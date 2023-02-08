set -eou pipefail
namespace=$1
if [ -z "$namespace" ]
then
  echo "This script requires a namespace argument input. None found. Exiting."
  exit 1
fi
kubectl get namespace $namespace -o json | jq '.spec = {"finalizers":[]}' > rknf_tmp.json
kubectl proxy &
sleep 5
curl -H "Content-Type: application/json" -X PUT --data-binary @rknf_tmp.json http://localhost:8001/api/v1/namespaces/$namespace/finalize
pkill -9 -f "kubectl proxy"
rm rknf_tmp.json
