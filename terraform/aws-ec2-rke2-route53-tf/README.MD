# AWS RKE2 Terraform

## Configuration Option: **AWS Route 53 (DNS Round Robin)**

**Step 1:** Clone the repository:
```bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
cd terraform/aws-ec2-rke2-route53-tf
```

**Step 2:** Update the variables in [terraform.tfvars](terraform.tfvars)

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