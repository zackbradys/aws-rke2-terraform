# AWS RKE2 Terraform

## Configuration Option: **AWS Route 53 (DNS Round Robin)**

**Step 1:** Clone the repository:
```bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
```

**Step 2:** Update the variables in [terraform.tfvars](terraform.tfvars):

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