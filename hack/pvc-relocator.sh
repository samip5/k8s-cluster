#!/bin/bash

# Requires kubectl all set up already
# Requires source and destination Namespaces exist already

# Approach taken from https://stackoverflow.com/a/66078690/920350

if [ "$#" -ne 3 ]; then
    echo "ERROR: invalid arguments"
    echo ""
    echo "Usage: $0 SRCNS DESTNS PVC"
    echo "       SRCNS: namespace where PVC currently exists"
    echo "       DESTNS: namespace where PVC shall exist"
    echo "       PVC: persistentVolumeClaim name"
    exit 1
fi

SRCNS="$1" # e.g. default
DESTNS="$2" # e.g. media
PVC="$3" # e.g. plex-config

#####################################################
PV=$(kubectl -n "$SRCNS" get pvc "$PVC" -o custom-columns=PV:.spec.volumeName --no-headers)

if [ "$PV" == "" ]; then
    echo "ERROR: No PV found for PVC \"$PVC\" in namespace \"$SRCNS\". Exiting."
    exit 1
fi

kubectl get ns "$DESTNS" &> /dev/null
if [ "$?" -ne 0 ]; then
    echo "ERROR: Destination namespace \"$DESTNS\" not found. Exiting."
    exit 1
fi

echo "Plan Summary"
echo ""
echo "PVC to move: \"$PVC\""
echo "         PV: \"$PV\""
echo "    from NS: \"$SRCNS\""
echo "      to NS: \"$DESTNS\""

echo ""
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    # Store the current yaml for later
    TEMPPVC=$(mktemp)
    TEMPPV=$(mktemp)
    kubectl get pvc -n "$SRCNS" "$PVC" -o yaml > "$TEMPPVC"
    kubectl get pv "$PV" -o yaml > "$TEMPPV"

    # Patch the pv to be Retain on delete, in case it is currently set to something else
    kubectl patch pv "$PV" -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
    sleep 1

    # Check if that worked
    RETAIN=$(kubectl get pv "$PV" -o custom-columns=Reclaim:.spec.persistentVolumeReclaimPolicy --no-headers)
    if [ "$RETAIN" != "Retain" ]; then
        echo "ERROR: Reclaim policy didn't change to Retain, exiting. Check the PV."
        exit 1
    fi
    echo "Changed reclaim policy on $PV to Retain"
    sleep 1

    # Delete the original PVC
    echo "Deleting original PVC from \"$SRCNS\" (don't panic)..."
    kubectl delete -n "$SRCNS" pvc "$PVC"
    sleep 0.5

    # Patch the PV's reference to the PVC to get rid of uid
    echo "Disconnecting PV from PVC..."
    kubectl patch pv "$PV" -p "{\"spec\":{\"claimRef\":{\"namespace\":\"$DESTNS\",\"name\":\"$PVC\",\"uid\":null}}}"
    sleep 0.5

    # Create the new PVC
    echo "Creating new PVC..."
    grep -v -e "uid:" -e "resourceVersion:" -e "namespace:" -e "selfLink:"  "$TEMPPVC" | kubectl -n "$DESTNS" apply -f -
    sleep 5

    # Get the new PVC's uid
    PVCUID=$(kubectl get -n "$DESTNS" pvc "$PVC" -o custom-columns=UID:.metadata.uid --no-headers)

    # Patch the PV with the new PVC's uid
    echo "Linking PV to new PVC..."
    kubectl patch pv "$PV" -p "{\"spec\":{\"claimRef\":{\"uid\":\"$PVCUID\",\"name\":null}}}"
else
    exit 1
fi
