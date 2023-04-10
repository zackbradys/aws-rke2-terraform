# AWS RKE2 Terraform

## Configuration Option: **AWS Route 53 (DNS)**

**Step 1:** Clone the repository:

~~~ bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
~~~

**Step 2:** Update the variables in [variables.tf](/terraform/aws-ec2-rke2-route53-tf/variables.tf):

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

variable "domain" {
  default     = ""
  description = "(Required) The AWS Route53 Domain to use for the instance(s)."
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


**Step 4:** Complete the final steps on each of the nodes:

```bash
# Replace IP's and Key

ssh -i "example.pem" rocky@0.0.0.0

# On the RKE2 Control (cp) Nodes
vi /opt/rancher/rke2-control-finalizer.txt

# On the RKE2 Worker (wk) Nodes
vi /opt/rancher/rke2-agent-finalizer.txt
```