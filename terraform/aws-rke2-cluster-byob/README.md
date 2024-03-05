# AWS RKE2 Terraform

## Configuration Option: **Bring Your Own (LB/DNS/IP)**

**Step 1:** Clone the repository:

```bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
cd terraform/aws-rke2-cluster-byob
```

**Step 2:** Update the variables in [terraform.tfvars](terraform.tfvars)

**Step 3:** Run the Terraform commands

```bash
terraform init

terraform plan

terraform apply --auto-approve
```

**Step 4a:** Setup DNS Round Robin on your DNS Server/Provider. I prefer to utilize this option in AWS Route 53, with the following configuration:

Example Domain A Record:

```bash
### Replace IP's (0.0.0.0)
Record Name:
Record Type: A – Routes traffic to an IPv4 address and some AWS resources
Record Alias: No

Record Value:
0.0.0.0
0.0.0.0
0.0.0.0

Record TTL: 300
Record Routing Policy: Simple Routing
```

Example Domain CNAME Record:

```bash
### Replace Domain (example.com)
Record Name: *
Record Type: CNAME – Routes traffic to another domain name and to some AWS resources
Record Alias: No

Record Value:
example.com

Record TTL: 300
Record Routing Policy: Simple Routing
```

**Step 4b:** If you do not have a DNS Service/Server available, you are able to configure your local `/etc/hosts` and on each of the nodes `/etc/hosts` with the following configuration:

Example /etc/hosts on each node and locally:

```bash
### Replace IP's and Domain
vi /etc/hosts

0.0.0.0 0.0.0.0 0.0.0.0 example.com
example.com *.example.com
```

**Step 5:** SSH into each node and complete the final steps located in the following files:

```bash
### Replace IP's and Key
ssh -i "example.pem" rocky@0.0.0.0

### RKE2 Control (cp) Node
vi /opt/rancher/rke2-control-node-finalizer.txt

### RKE2 Control (cp) Nodes
vi /opt/rancher/rke2-control-node-finalizer.txt

### RKE2 Worker (wk) Nodes
vi /opt/rancher/rke2-worker-nodes-finalizer.txt
```
