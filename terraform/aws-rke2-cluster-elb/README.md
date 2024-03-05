# AWS RKE2 Terraform

## Configuration Option: **AWS ELB (Load Balanced)**

**Step 1:** Clone the repository:

```bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
cd terraform/aws-rke2-cluster-elb
```

**Step 2:** Update the variables in [terraform.tfvars](terraform.tfvars)

**Step 3:** Run the Terraform commands

```bash
terraform init

terraform plan

terraform apply --auto-approve
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
