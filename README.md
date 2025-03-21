<div align="center">

### My Home Operations Repository :octocat:

_... managed with Flux, Renovate, and GitHub Actions_ 🤖

</div>

<div align="center">

[![Talos](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dtalos_version&style=for-the-badge&logo=talos&logoColor=white&label=%20&color=blue)](https://talos.dev)&nbsp;&nbsp;
![Kubernetes](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dkubernetes_version&style=for-the-badge&logo=kubernetes&logoColor=white&label=%20&color=blue)
[![Renovate](https://img.shields.io/github/actions/workflow/status/samip5/k8s-cluster/schedule-renovate.yaml?branch=main&label=&logo=renovatebot&style=for-the-badge&color=blue)](https://github.com/samip5/k8s-cluster/actions/workflows/schedule-renovate.yaml)

</div>


<div align="center">

[![Age-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_age_days&style=flat-square&label=Age)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Uptime-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_uptime_days&style=flat-square&label=Uptime)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Node-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_node_count&style=flat-square&label=Nodes)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Pod-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_pod_count&style=flat-square&label=Pods)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Pod-Count-Average-Per-Node](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_avg_per_node_pod_count&style=flat-square&label=PodsPerNodeAvg)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Firing Prom Alerts](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dprometheus_active_alerts&style=flat-square)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![CPU-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_cpu_usage&style=flat-square&label=CPU)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Memory-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_memory_usage&style=flat-square&label=Memory)](https://github.com/kashalls/kromgo/)&nbsp;&nbsp;
[![Power-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.skylab.fi%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_power_usage&style=flat-square&label=Power)](https://github.com/kashalls/kromgo/)

</div>

### :wrench:&nbsp; Tools

| Tool                                                               | Purpose                                                             |
|--------------------------------------------------------------------|---------------------------------------------------------------------|
| [flux](https://toolkit.fluxcd.io/)                                 | Operator that manages your k8s cluster based on your Git repository |
| [go-task](https://github.com/go-task/task)                         | A task runner / simpler Make alternative written in Go              |
| [sops](https://github.com/mozilla/sops)                            | Encrypts k8s secrets with GnuPG                                     |


## 💻 Nodes
| Node                          | Hostname | RAM  | Storage                                            | Function    | Operating System |
|-------------------------------|----------|------|----------------------------------------------------|-------------|------------------|
| Raspberry Pi Compute Module 4 | w7       | 8GB  | 2TB SSD                                            | Kube Worker | Talos            |
| Raspberry Pi Compute Module 4 | cm4-1    | 8GB  | 32GB eMMC                                          | Kube Worker | Talos            |
| Lenovo ThinkCentre M910q Tiny | w-amd-1  | 32GB | 1TB Kingston DC SSD + 256GB SSD                    | Kube Worker | Talos            |
| Random Chinese N100 board     | w-amd-2  | 32GB | 480GB Transcend SSD, 275GB Crucial SSD + 320GB HDD | Kube Worker | Talos            |
| HP EliteDesk 800 G2           | w-amd-3  | 32GB | 256GB SSD                                          | Kube Worker | Talos            |
| Lenovo ThinkCentre M910q Tiny | m1       | 16GB | 256GB SSD x 2                                      | Kube Master | Talos            |

## Storage
| Node         | Hostname | RAM  | Storage                                                                                  | Function   | Operating System |
|--------------|----------|------|------------------------------------------------------------------------------------------|------------|------------------|
| Synology NAS | NAS      | 16GB | 2 x 3TB HDD (SMR for backups), 2 x 8TB HDD, 1 TB NVME, 256GB NVME for storage pool cache | NFS Server | DSM 7            |

## Network

| Vendor   | Model         | Function                                           |
|----------|---------------|----------------------------------------------------|
| Juniper  | EX2200-48P-4g | Hallway switch with PoE+ and fiber uplinks to rack |
| Juniper  | EX3300-48P    | Rack switch with PoE++ and 10G SFP+                |
| TP-Link  | TL-SG108E     | Bedroom switching behind desk                      |
| Mikrotik | RB5009        | Main router                                        |

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6. 
Kubernetes' nodes are on their own VLAN which has access to the NAS.

## ☁️ Cloud Dependencies

While most of my infrastructure and workloads are self-hosted I do rely upon the cloud for certain key parts of my setup. This saves me from having to worry about two things. (1) Dealing with chicken/egg scenarios and (2) services I critically need whether my cluster is online or not.

The alternative solution to these two problems would be to host a Kubernetes cluster in the cloud and deploy applications like [HCVault](https://www.vaultproject.io/), [Vaultwarden](https://github.com/dani-garcia/vaultwarden), [ntfy](https://ntfy.sh/), and [Gatus](https://gatus.io/). However, maintaining another cluster and monitoring another group of workloads is a lot more time and effort than I am willing to put in.

| Service                                                               | Use                                                                | Cost                |
|-----------------------------------------------------------------------|--------------------------------------------------------------------|---------------------|
| [Cloudflare](https://www.cloudflare.com/)                             | Domain(s) and S3                                                   | ~$20/yr             |
| [GitHub](https://github.com/)                                         | Hosting this repository and continuous integration/deployments     | Free                |
| [Mailbox](https://mailbox.org/)                                       | Email hosting                                                      | ~30€/12 months        |
| [NextDNS](https://nextdns.io/?from=dm7g7gda)                                        | My router DNS server which includes AdBlocking                     | ~$20/yr             |
| [Kapsi internet-users association](https://www.kapsi.fi/english.html) | Hosts my off-site backup aka minio (S3) and own website            | 40€/yr              |
| [Bilance](https://www.bilanceapp.com)                                 | Budgeting app for iOS and Android                                  | ~30€/yr             |
| [1Password](https://1password.eu)                                     | External Secrets and secret management                             | 20€/yr (Student discount) |
|                                                                       |                                                                    | Total: ~140€/yr      |

## Stargazers

[![Star History Chart](https://api.star-history.com/svg?repos=samip5/k8s-cluster&type=Date)](https://star-history.com/#samip5/k8s-cluster&Date)

