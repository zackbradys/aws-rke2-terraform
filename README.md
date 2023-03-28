---
title: AWS RKE2 Terraform
author: Zack Brady, Field Engineer
contact: zack.brady@rancherfederal.com
---

# AWS RKE2 Terraform

### Table of Contents
* [About Me](#about-me)
* [Introduction](#introduction)
* [Prerequisites](#prerequisites)
* [Configuration](#configuration)
* [Roadmap](#roadmap)

## About Me

A little bit about me, my history, and what I've done in the industry. 
- DOD/IC Contractor
- U.S. Military Veteran
- Open-Source Contributor
- Built and Exited a Digital Firm
- Active Volunteer Firefighter/EMT

## Introduction

The intent of this repository is to provide a baseline for a out of the box, secure, and highly available deployment of a [Rancher Kubernetes Engine (RKE2)](https://docs.rke2.io) cluster on AWS using Terraform. In this implementation, I wanted to remove most of the assumptions and complexities that you see in many deployments. It was based off of the common issue of bootstrapping RKE2 with very little or no available services and limited knowledge of RKE2 or Kubernetes. In order to provide this deployment with as little assumptions and complexities as possible, you must manually set DNS and bootstrap RKE2. 

**At the end of this deployment, you will have a Highly Available (HA) RKE2 Kubernetes Cluster with all the controls from the RKE2 DISA STIG, running in multiple AWS Availability Zones, deployed and managed by Terraform.**

**Contributing:** Please feel free to utilize GitHub Issues and GitHub Pull Requests to add your thoughts and changes. 

**Note:** This repository is a work in progress and may change from time to time.

## Prerequisites

* Terminal Utility (Terminal, VSCode, Termius etc...)
* HashiCorp Terraform CLI with Access to the AWS Provider 
* An AWS Commercial or GovCloud Account (with an Access Key and Secret Key)

## Configuration

**Step 1:** Clone the repository:

~~~ bash
git clone https://github.com/zackbradys/aws-rke2-terraform.git
~~~

**Step 2:** Update the variables in [variables.tf](/aws-ec2-rancher-tf/variables.tf):

~~~ bash
variable "region" {
  default     = "YOUR-AWS-REGION"
  description = "(Required) The AWS Region to use for the instance(s)."
}

variable "access_key" {
  default = "YOUR-ACCESS-KEY"
  description = "(Required) The AWS Access Key to use for the instance(s)."
}

variable "secret_key" {
  default = "YOUR-SECRET-KEY"
  description = "(Required) The AWS Secret Key to use for the instance(s)."
}

variable "key_pair_name" {
  default     = "YOUR-KEY-PAIR"
  description = "(Required) The AWS Key Pair name to use for the instance(s)."
}
~~~

**Step 3:** Run the Terraform commands

```bash
terraform init

terraform plan

terraform apply --auto-approve

terraform output
```

**Step 4a:** Setup DNS Round Robin on your DNS Server/Provider. I prefer to utilize this option in AWS Route 53, with the following configuration:

Example Domain A Record:
```bash
Record Name:
Record Type: A – Routes traffic to an IPv4 address and some AWS resources
Record Alias: No

Record Value:
ec2.cp.ip.1 
ec2.cp.ip.2
ec2.cp.ip.3

Record TTL: 300
Record Routing Policy: Simple Routing
```

Example Domain CNAME Record:
```bash
Record Name: *
Record Type: CNAME – Routes traffic to another domain name and to some AWS resources
Record Alias: No

Record Value:
example.com

Record TTL: 300
Record Routing Policy: Simple Routing
```

**Step 4b:** If you do not have a DNS Server available, you are able to configure your local /etc/hosts and on each of the nodes /etc/hosts, with the following configuration:

Example /etc/hosts:
```bash
ec2.cp.ip.1 ec2.cp.ip.2 ec2.cp.ip.3 example.com
example.com *.example.com
```

**Step 5:** SSH into each node and complete the final steps located in the following files:

```bash
ssh -i "YOUR-KEY-NAME.pem" rocky@ec2.cp.ip.1


On the RKE2 Control (cp) Nodes: 
vi /opt/rancher/rke2-control-finalizer.txt

On the RKE2 Worker (wk) Nodes:
vi /opt/rancher/rke2-agent-finalizer.txt
```

## Roadmap
* README Updates/Instructions
* Terraform Code Additions for
  * Configuring an AWS ELB
  * Configuring your Route 53
  * Bring Your Own LB/DNS/IP
    * Current solution, but not implemented within terraform and requires manual configuration