# AWS RKE2 Terraform

## Configuration Option: **Bring Your Own (LB/DNS/IP)**

**Step 1:** Clone the repository:

~~~ bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
~~~

**Step 2:** Update the variables in [variables.tf](/aws-ec2-rancher-tf/variables.tf):

~~~ bash
# Add AWS Region, AWS Access Key, AWS Secret Key, and AWS SSH Key Name

variable "region" {
  default     = ""
  description = "(Required) The AWS Region to use for the instance(s)."
}

variable "access_key" {
  default = ""
  description = "(Required) The AWS Access Key to use for the instance(s)."
}

variable "secret_key" {
  default = ""
  description = "(Required) The AWS Secret Key to use for the instance(s)."
}

variable "key_pair_name" {
  default     = ""
  description = "(Required) The AWS Key Pair name to use for the instance(s)."
}
~~~

**Step 3:** Run the Terraform commands
```bash
# cd terraform/aws-ec2-rancher-tf

terraform init

terraform plan

terraform apply --auto-approve

terraform output
```

**Step 4a:** Setup DNS Round Robin on your DNS Server/Provider. I prefer to utilize this option in AWS Route 53, with the following configuration:

Example Domain A Record:
```bash
# Replace IP's

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
# Replace Domain

Record Name: *
Record Type: CNAME – Routes traffic to another domain name and to some AWS resources
Record Alias: No

Record Value:
example.com

Record TTL: 300
Record Routing Policy: Simple Routing
```

**Step 4b:** If you do not have a DNS Server available, you are able to configure your local /etc/hosts and on each of the nodes /etc/hosts, with the following configuration:

Example /etc/hosts on each node and locally:
```bash
# Replace IP's and Domain

# vi /etc/hosts

0.0.0.0 0.0.0.0 0.0.0.0 example.com
example.com *.example.com
```

**Step 5:** SSH into each node and complete the final steps located in the following files:

```bash
# Replace IP's and Key

ssh -i "example.pem" rocky@0.0.0.0

# On the RKE2 Control (cp) Nodes
vi /opt/rancher/rke2-control-finalizer.txt

# On the RKE2 Worker (wk) Nodes
vi /opt/rancher/rke2-agent-finalizer.txt
```