#!/bin/bash

set -ebpf

### Set Variables
export DOMAIN=${DOMAIN}
export TOKEN=${TOKEN}
export vRKE2=${vRKE2}

### Install Packages
yum install -y zip zstd tree jq iptables container-selinux iptables libnetfilter_conntrack libnfnetlink libnftnl policycoreutils-python-utils cryptsetup
yum install -y nfs-utils && yum install -y iscsi-initiator-utils && echo "InitiatorName=$(/sbin/iscsi-iname)" > /etc/iscsi/initiatorname.iscsi && systemctl enable --now iscsid
echo -e "[keyfile]\nunmanaged-devices=interface-name:cali*;interface-name:flannel*" > /etc/NetworkManager/conf.d/rke2-canal.conf

### Setup RKE2 Agent
mkdir -p /etc/rancher/rke2/

### Configure RKE2 Config
cat << EOF >> /etc/rancher/rke2/config.yaml
profile: cis-1.23
write-kubeconfig-mode: 0640
kube-apiserver-arg:
- authorization-mode=RBAC,Node
kubelet-arg:
- protect-kernel-defaults=true
- read-only-port=0
- authorization-mode=Webhook
- max-pods=200
cloud-provider-name: aws
server: https://$DOMAIN:9345
token: $TOKEN
EOF

### Download and Install RKE2 Agent
curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL=$vRKE2 INSTALL_RKE2_TYPE=agent sh -

### Configure RKE2 Agent Finalizers
mkdir -p /opt/rancher
cat << EOF >> /opt/rancher/rke2-worker-nodes-finalizer.txt
1) After setting up LB/DNS/IP and all CONTROL NODES are running, run the following commands to start the rke2-agents:
systemctl enable rke2-agent.service && systemctl start rke2-agent.service
EOF

### Verify End of Script
date >> /opt/rancher/COMPLETED