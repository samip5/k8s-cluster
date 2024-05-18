<div align="center">

<img src="https://raw.githubusercontent.com/onedr0p/home-ops/main/docs/src/assets/logo.png" align="center" width="144px" height="144px"/>

### My Home Operations Repository :octocat:

_... managed with Flux, Renovate, and GitHub Actions_ 🤖

</div>

<div align="center">

[![Kubernetes](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsamip5%2Fk8s-cluster%2Fmain%2Fk8s%2Fbase%2Fsystem-upgrade%2Fsystem-upgrade-controller%2Fplans%2Fserver-plan.yaml&query=spec.version&style=for-the-badge&logo=kubernetes&logoColor=white&label=%20)](https://k3s.io/)&nbsp;&nbsp;
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
| [ansible](https://www.ansible.com)                                 | Preparing Ubuntu for Kubernetes and installing k3s                  |
| [flux](https://toolkit.fluxcd.io/)                                 | Operator that manages your k8s cluster based on your Git repository |
| [go-task](https://github.com/go-task/task)                         | A task runner / simpler Make alternative written in Go              |
| [sops](https://github.com/mozilla/sops)                            | Encrypts k8s secrets with GnuPG                                     |


## 💻 Nodes
| Node                          | Hostname        | RAM  | Storage                                            | Function         | Operating System |
|-------------------------------|-----------------|------|----------------------------------------------------|------------------|------------------|
| Raspberry Pi 4 Model B        | w1              | 8GB  | 250GB SSD                                          | Kube Worker      | Debian 12        |
| Raspberry Pi Compute Module 4 | w7              | 8GB  | 2TB SSD                                            | Kube Worker      | Debian 12        |
| Lenovo ThinkCentre M910q Tiny | w-amd-1         | 32GB | 1TB Kingston DC SSD + 256GB SSD                    | Kube Worker      | Debian 12        |
| Custom Haswell mATX system    | w-amd-2         | 32GB | 480GB Transcend SSD, 275GB Crucial SSD + 320GB HDD | Kube Worker      | Debian 12        |
| VM on Synology                | w-amd-storage-1 | 4GB  | 400GB NVME                                         | Longhorn storage | Debian 12        |
| HP EliteDesk 800 G2           | w-amd-3         | 32GB | 256GB SSD                                          | Kube Worker      | Debian 12        |
| Lenovo ThinkCentre M910q Tiny | m1              | 16GB | 256GB SSD x 2                                      | Kube Master      | Debian 12        |

## Storage
| Node         | Hostname | RAM  | Storage                                                                                  | Function   | Operating System |
|--------------|----------|------|------------------------------------------------------------------------------------------|------------|------------------|
| Synology NAS | NAS      | 16GB | 2 x 3TB HDD (SMR for backups), 2 x 8TB HDD, 1 TB NVME, 256GB NVME for storage pool cache | NFS Server | DSM 7            |

## Network

| Vendor   | Model                        | Function                                                          |
|----------|------------------------------|-------------------------------------------------------------------|
| Juniper  | EX2200-48P-4g                | Hallway switch with PoE+ and fiber uplinks to rack                |
| Juniper  | EX3300-48P                   | Rack switch with PoE++ and 10G SFP+                               |
| Ubiquiti | Unifi USW-Flex-Mini          | Bedroom switching (gaming iTX system, Apple TV 4K and Steam Deck) |
| Qotom    | TLSense C3758  (TekLager.se) | Main router                                                       |

All nodes are connected to a dual-stack network, with private IPv4 and public IPv6. 
Kubernetes nodes are on their own VLAN which has access to the NAS.

## ☁️ Cloud Dependencies

While most of my infrastructure and workloads are self-hosted I do rely upon the cloud for certain key parts of my setup. This saves me from having to worry about two things. (1) Dealing with chicken/egg scenarios and (2) services I critically need whether my cluster is online or not.

The alternative solution to these two problems would be to host a Kubernetes cluster in the cloud and deploy applications like [HCVault](https://www.vaultproject.io/), [Vaultwarden](https://github.com/dani-garcia/vaultwarden), [ntfy](https://ntfy.sh/), and [Gatus](https://gatus.io/). However, maintaining another cluster and monitoring another group of workloads is a lot more time and effort than I am willing to put in.

| Service                                                               | Use                                                                | Cost           |
|-----------------------------------------------------------------------|--------------------------------------------------------------------|----------------|
| [Cloudflare](https://www.cloudflare.com/)                             | Domain(s) and S3                                                   | ~$20/yr        |
| [GCP](https://cloud.google.com/)                                      | Voice interactions with Home Assistant over Google Assistant       | Free           |
| [GitHub](https://github.com/)                                         | Hosting this repository and continuous integration/deployments     | Free           |
| [Fastmail](https://fastmail.com/)                                     | Email hosting                                                      | ~$99/yr        |
| [NextDNS](https://nextdns.io/)                                        | My router DNS server which includes AdBlocking                     | ~$20/yr        |
| [Kapsi internet-users association](https://www.kapsi.fi/english.html) | Hosts my off-site backup aka minio (S3), Bitwarden and own website | 40€/yr         |
| [updown.io](https://updown.io)                                        | External monitoring (IPv4/IPv6)                                    | ~€5/yr         |
| [Bilance](https://www.bilanceapp.com)                                 | Budgeting app for iOS and Android                                  | ~30€/yr        |
| [1Password](https://1password.eu)                                     | External Secrets and secret management                             | Free for the moment |
|                                                                       |                                                                    | Total: ~40€/mo |

## Stargazers

[![Star History Chart](https://api.star-history.com/svg?repos=samip5/k8s-cluster&type=Date)](https://star-history.com/#samip5/k8s-cluster&Date)

