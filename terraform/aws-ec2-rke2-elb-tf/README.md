# AWS RKE2 Terraform

## Configuration Option: **AWS ELB (Load Balanced)**

**Step 1:** Clone the repository:
```bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
```

**Step 2:** Update the variables in [terraform.tfvars](terraform.tfvars):
```bash
### (Required) The AWS Region to use for the instance(s).
region = ""

### (Required) The AWS Access Key to use for the instance(s).
access_key = ""

### (Required) The AWS Secret Key to use for the instance(s).
secret_key = ""

### (Required) The AWS Key Pair name to use for the instance(s).
key_pair_name = ""

### (Required) The AWS Route53 domain to use for the cluster(s).
domain = ""
```

**Step 3:** Run the Terraform commands
```bash
### cd terraform/aws-ec2-rancher-tf
terraform init

terraform plan

terraform apply --auto-approve

terraform output
```

**Step 4:** Verify Deployment:
```bash
### Replace IP's and Key
ssh -i "example.pem" rocky@0.0.0.0

### Verify Successful Deployment
cat /opt/rancher/COMPLETED

### Verify kubectl
kubectl get nodes -o wide
```