## :open_file_folder:&nbsp; Repository structure

The Git repository contains the following directories under `cluster` and are ordered below by how Flux will apply them.

- **flux** directory is the entrypoint to Flux
- **bootstrap** directory contains a simple Kustomize resource to deploy Flux to an empty cluster
- **charts** directory contains all of my different chart repos
- **crds** directory contains custom resource definitions (CRDs) that need to exist globally in my cluster before anything else exists
- **config** directory contains cluster-wide configs like global variables
- **core** directory (depends on **crds**) are important infrastructure applications (grouped by namespace) that should never be pruned by Flux
- **apps** directory (depends on **core**) is where my common applications (grouped by namespace) are placed.

```
cluster
├── apps
├── bootstrap
├── charts
├── config
├── core
├── crds
└── flux
```

### :wrench:&nbsp; Tools

| Tool                                                               | Purpose                                                             |
|--------------------------------------------------------------------|---------------------------------------------------------------------|
| [ansible](https://www.ansible.com)                                 | Preparing Ubuntu for Kubernetes and installing k3s                  |
| [flux](https://toolkit.fluxcd.io/)                                 | Operator that manages your k8s cluster based on your Git repository |
| [go-task](https://github.com/go-task/task)                         | A task runner / simpler Make alternative written in Go              |
| [sops](https://github.com/mozilla/sops)                            | Encrypts k8s secrets with GnuPG                                     |


## 💻 Nodes
| Node                     | Hostname | RAM  | Storage       | Function          | Operating System 
| ------------------------ |--|------| ------------- | ----------------- |------------------|
| Raspberry Pi 4 Model B   | k8s-master1 | 8GB  | 64GB SSD     | Kube Master Node  | Ubuntu 22.04 LTS |
| Raspberry Pi 4 Model B   | k8s-worker5 | 8GB  | 64GB SSD    | Kube Worker Node  | Ubuntu 22.04 LTS |
| Raspberry Pi 4 Model B   | k8s-worker7 | 8GB  | 320GB HDD    | Kube Worker Node  | Ubuntu 22.04 LTS |
| Synology NAS        | NAS | 16GB | 2 x 3TB HDD, 2 x 6TB HDD, 1 TB NVME  | NFS Server | DSM 7            |
| VM on Synology   | k8s-worker-amd64-0 | 5GB  | 32GB Unknown     | Kube Worker Node  | Ubuntu 22.04 LTS |
| VM on home-server | k8s-worker-amd64-2 | 8GB | 64GB SSD | Kube Worker Node | Ubuntu 22.04 LTS |
| HP EliteDesk 800 G2 | k8s-worker-amd64-3 | 32GB | 256 GB SSD | Kube Worker Node | Ubuntu 22.04 LTS |

## Network

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6.  
Kubernetes nodes are on their own VLAN which has access to the NAS.
