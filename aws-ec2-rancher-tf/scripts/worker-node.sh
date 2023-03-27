#!/bin/bash

set -ebpf

### Applying MOTD Banner
cat << EOF >> /etc/motd

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#             ______       ______     ____  ____        _____     _____       ______              #
#            |_   _ \    .' ___  |   |_   ||   _|      |_   _|   |_   _|    .' ___  |             #
#              | |_) |  / .'   \_|     | |__| |          | |       | |     / .'   \_|             #
#              |  __'.  | |   ____     |  __  |          | |   _   | |   _ | |                    #
#             _| |__) |_\ `.___]  |_  _| |  | |_  _     _| |__/ | _| |__/ |\ `.___.'\             #
#            |_______/(_)`._____.'(_)|____||____|(_)   |________||________| `.____ .'             #
#                                                                                                 #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                                                 #
#    0100001001010010010000010100010001011001 010001110100110001001111010000100100000101001100    #
#    100100001001111010011000100010001001001010011100100011101010011  010011000100110001000011    #
#                                                                                                 #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                                                 #
#      WARNING!! You are connecting to a server managed, owned, and operated by Brady Global      #
#               Holdings LLC. All activity and usage is logged and monitored.                     #
#                                                                                                 #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

EOF

systemctl restart sshd

### Applying System Settings
cat << EOF >> /etc/sysctl.conf
# SWAP Settings
vm.swappiness=0
vm.panic_on_oom=0
vm.overcommit_memory=1
kernel.panic=10
kernel.panic_on_oops=1
vm.max_map_count = 262144

# IPv4 Connection Settings
net.ipv4.ip_local_port_range=1024 65000

# Increase Max Connection
net.core.somaxconn=10000

# Closed Socket Settings
net.ipv4.tcp_tw_reuse=1
net.ipv4.tcp_fin_timeout=15

# Increasing Backlogged Sockets (Default is 128)
net.core.somaxconn=4096
net.core.netdev_max_backlog=4096

# Increasing Socket Buffers
net.core.rmem_max=16777216
net.core.wmem_max=16777216

# Network Tuning Settings
net.ipv4.tcp_max_syn_backlog=20480
net.ipv4.tcp_max_tw_buckets=400000
net.ipv4.tcp_no_metrics_save=1
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_syn_retries=2
net.ipv4.tcp_synack_retries=2
net.ipv4.tcp_wmem=4096 65536 16777216

# ARP Cache Settings
net.ipv4.neigh.default.gc_thresh1=8096
net.ipv4.neigh.default.gc_thresh2=12288
net.ipv4.neigh.default.gc_thresh3=16384

# More IPv4 Settings
net.ipv4.tcp_keepalive_time=600
net.ipv4.ip_forward=1

# File System Monitoring
fs.inotify.max_user_instances=8192
fs.inotify.max_user_watches=1048576
EOF

sysctl -p > /dev/null 2>&1

### Install Packages
yum update -y
yum install -y zip zstd skopeo tree iptables container-selinux iptables libnetfilter_conntrack libnfnetlink libnftnl policycoreutils-python-utils cryptsetup iscsi-initiator-utils

### Setup RKE2 Agent
mkdir -p /etc/rancher/rke2/

### Configure RKE2 Config
cat << EOF >> /etc/rancher/rke2/config.yaml
write-kubeconfig-mode: 0640
#profile: cis-1.6
kube-apiserver-arg:
- "authorization-mode=RBAC,Node"
kubelet-arg:
- "protect-kernel-defaults=true"
EOF

curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL=v1.24 INSTALL_RKE2_TYPE=agent sh -

### Configure RKE2 Agent Finalizers
mkdir -p /opt/rancher
cat << EOF >> /opt/rancher/rke2-agent-finalizer.txt

1) Ensure you have set the server and token in /etc/rancher/rke2/config.yaml
server: https://:9345
token: awsRKE2terraform

2) After completing those changes, run the following command to start the rke2-agent:
systemctl enable rke2-agent.service && systemctl start rke2-agent.service
EOF