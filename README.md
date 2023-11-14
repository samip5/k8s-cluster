### :wrench:&nbsp; Tools

| Tool                                                               | Purpose                                                             |
|--------------------------------------------------------------------|---------------------------------------------------------------------|
| [ansible](https://www.ansible.com)                                 | Preparing Ubuntu for Kubernetes and installing k3s                  |
| [flux](https://toolkit.fluxcd.io/)                                 | Operator that manages your k8s cluster based on your Git repository |
| [go-task](https://github.com/go-task/task)                         | A task runner / simpler Make alternative written in Go              |
| [sops](https://github.com/mozilla/sops)                            | Encrypts k8s secrets with GnuPG                                     |


## 💻 Nodes
| Node                          | Hostname        | RAM  | Storage       | Function         | Operating System |
|-------------------------------|-----------------|------|---------------|------------------|------------------|
| Raspberry Pi 4 Model B        | w1              | 8GB  | 250GB SSD      | Kube Worker      | Debian 12        |
| Raspberry Pi Compute Module 4 | w7              | 8GB  | 2TB SSD        | Kube Worker      | Debian 12        |
| Lenovo ThinkCentre M910q Tiny | w-amd-1         | 8GB  | 256GB SSD x 2 | Kube Worker      | Debian 12        |
| VM on Synology                | w-amd-storage-1 | 4GB  | 400GB NVME    | Longhorn storage | Debian 12        |
| HP EliteDesk 800 G2           | w-amd-3         | 32GB | 256GB SSD     | Kube Worker      | Debian 12        |
| Lenovo ThinkCentre M910q Tiny | m1              | 16GB | 256GB SSD x 2 | Kube Master      | Debian 12        |

## Storage
| Node         | Hostname | RAM  | Storage                             | Function   | Operating System |
|--------------|----------|------|-------------------------------------|------------|------------------|
| Synology NAS | NAS      | 16GB | 2 x 3TB HDD, 2 x 8TB HDD, 1 TB NVME | NFS Server | DSM 7            |

## Network

| Vendor   | Model                            | Function                                                     |
|----------|----------------------------------|--------------------------------------------------------------|
| Juniper  | EX2200-48P-4g                    | Hallway switch with PoE and fiber uplinks to rack            |
| Juniper  | EX3300-48P                       | Rack switch with PoE                                         |
| Ubiquiti | Unifi USW-Flex-Mini              | Bedroom switching (gaming iTX system and Steam Deck)         |
| Qotom    | TLSense C3758  (TekLager.se)     | Main router                                                  |

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6. 
Kubernetes nodes are on their own VLAN which has access to the NAS.

## Stargazers

[![Star History Chart](https://api.star-history.com/svg?repos=samip5/k8s-cluster&type=Date)](https://star-history.com/#samip5/k8s-cluster&Date)

