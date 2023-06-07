## :open_file_folder:&nbsp; Repository structure

The Git repository contains the following directories under `cluster` and are ordered below by how Flux will apply them.

- **flux** directory is the entrypoint to Flux
- **bootstrap** directory contains a simple Kustomize resource to deploy Flux to an empty cluster
- **apps** directory is where my common applications (grouped by namespace) are placed.

```
cluster
├── apps
├── bootstrap
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
| Node                          | Hostname | RAM  | Storage       | Function    | Operating System |
|-------------------------------|----------|------|---------------|-------------|------------------|
| Raspberry Pi 4 Model B        | w1       | 8GB  | 64GB SSD      | Kube Worker | Ubuntu 22.04 LTS |
| Raspberry Pi 4 Model B        | w2       | 8GB  | 64GB SSD      | Kube Worker | Ubuntu 22.04 LTS |
| Raspberry Pi Compute Module 4 | w7       | 8GB  | 32GB eMMC     | Kube Worker | Ubuntu 22.04 LTS |
| VM on Synology                | w-amd-2  | 8GB  | 150GB SSD     | Kube Worker | Debian 11        |
| HP EliteDesk 800 G2           | w-amd-3  | 32GB | 256GB SSD     | Kube Worker | Ubuntu 22.04 LTS |
| Lenovo ThinkCentre M910q Tiny | m1       | 16GB | 256GB SSD x 2 | Kube Master | Ubuntu 22.04 LTS |

## Storage
| Node         | Hostname | RAM  | Storage                             | Function   | Operating System |
|--------------|----------|------|-------------------------------------|------------|------------------|
| Synology NAS | NAS      | 16GB | 2 x 3TB HDD, 2 x 6TB HDD, 1 TB NVME | NFS Server | DSM 7            |

## Network

| Vendor   | Model                            | Function                                                     |
|----------|----------------------------------|--------------------------------------------------------------|
| Juniper  | EX2200-48P-4g                    | Hallway switch with PoE and fiber uplinks to rack            |
| Juniper  | EX3300-48P                       | Rack switch with PoE                                         |
| Ubiquiti | Unifi USW-Flex-Mini              | Bedroom switching (gaming iTX system and Steam Deck)         |
| Ubiquiti | EdgeRouter 12                    | Main router                                                  |
| Mikrotik | RBD53G-5HacD2HnD (Chateau LTE12) | Handling IPv6 because EdgeRouter's DHCPv6 client is terrible |

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6. 
Kubernetes nodes are on their own VLAN which has access to the NAS.
