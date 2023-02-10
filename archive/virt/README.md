## Virtualization inside Kubernetes

I'm using these to enable me to run virtual machines inside my cluster.  
The workloads only get scheduled to my amd64 nodes as arm64 is not supported by any of the containers (ref: https://github.com/kubevirt/kubevirt/issues/3558)

P.S This is beyond a bad idea with longhorn, but I don't have anything else that even resembles block storage, so will see how it goes.