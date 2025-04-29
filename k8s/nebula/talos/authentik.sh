#!/bin/bash


KUBE_API=$(kubectl config view --minify --output jsonpath="{.clusters[*].cluster.server}")
NAMESPACE=security
SECRET_NAME=$(kubectl get serviceaccount authentik-remote-cluster -o jsonpath='{.secrets[0].name}' 2>/dev/null || echo -n authentik-remote-cluster)
KUBE_CA=$(kubectl -n $NAMESPACE get secret/$SECRET_NAME -o jsonpath='{.data.ca\.crt}')
KUBE_TOKEN=$(kubectl -n $NAMESPACE get secret/$SECRET_NAME -o jsonpath='{.data.token}' | base64 --decode)

echo "apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${KUBE_CA}
    server: ${KUBE_API}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: $NAMESPACE
    user: authentik-user
current-context: default-context
users:
- name: authentik-user
  user:
    token: ${KUBE_TOKEN}"
