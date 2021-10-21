## :open_file_folder:&nbsp; Repository structure

The Git repository contains the following directories under `cluster` and are ordered below by how Flux will apply them.

- **base** directory is the entrypoint to Flux
- **crds** directory contains custom resource definitions (CRDs) that need to exist globally in your cluster before anything else exists
- **core** directory (depends on **crds**) are important infrastructure applications (grouped by namespace) that should never be pruned by Flux
- **apps** directory (depends on **core**) is where your common applications (grouped by namespace) could be placed, Flux will prune resources here if they are not tracked by Git anymore

```
cluster
├── apps
├── base
├── core
└── crds
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
| ------------------------ |-----|------| ------------- | ----------------- | -------------------- |
| Raspberry Pi 4 Model B   |k8s-master1 | 4GB  | 64GB SSD     | Kube Master Node  | Ubuntu 20.04.3 LTS         |
| Raspberry Pi 4 Model B   |k8s-worker3 | 2GB  | 64GB SSD     | Kube Worker Node  | Ubuntu 20.04.3 LTS        |
| VM on Synology   | k8s-worker4 | 5GB  | 32GB Unknown     | Kube Worker Node  | Ubuntu 20.04.3 LTS        |
| Raspberry Pi 4 Model B   |k8s-worker5| 8GB  | 64GB SSD    | Kube Worker Node  | Ubuntu 20.04.3 LTS        |
| Raspberry Pi 4 Model B   |k8s-worker6| 8GB  | 320GB HDD    | Kube Worker Node  | Ubuntu 20.04.3 LTS         |
| VM on Proxmox   |k8s-worker-amd64-1 | 8GB  | 30GB Unknown    | Kube Worker Node  | Ubuntu 20.04.3 LTS         |
| Synology NAS        | NAS | 16GB  | 2 x 3TB HDD, 2 x 6TB HDD, 1 TB NVME  | NFS Server | DSM 7 |
| Home Server | pve | 32GB | 256GB SSD, 320 GB HDD | Virtualization host | Proxmox 7|

## Network

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6.  
Kubernetes nodes are on their own VLAN which has access to the NAS.