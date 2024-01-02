![rancher-long-banner](images/rgs-banner-rounded.png)

# AWS RKE2 Terraform Guide

## About Me
A little bit about me, my history, and what I've done in the industry.
- Former Contractor
- U.S. Military Veteran
- Open-Source Contributor
- Built and Exited a Digital Firm
- Active Volunteer Firefighter/EMT

## Introduction
The intent of this repository is to provide a baseline deployment for an out of the box, secure, and highly available [Rancher Kubernetes Engine (RKE2)](https://docs.rke2.io) cluster on AWS, managed by Terraform. In this implementation, I wanted to remove most of the assumptions and complexities that you see in many deployments.

**Contributing:** Please utilize GitHubs features such as Issues, Forks, and Pull Requests to contribute!

## Prerequisites
* Git Utility, Terminal Utility, and HashiCorp Terraform with Access to the AWS Provider Plugin
* AWS Commercial or AWS GovCloud Account with an Access Key and Secret Key

## Configuration

### For AWS EC2s with AWS ELBs (Load Balanced)
* Follow --> [terraform/aws-rke2-cluster-elb](terraform/aws-rke2-cluster-elb/README.md)

### For AWS EC2s with AWS Route53 (DNS Round Robin):
* Follow --> [terraform/aws-rke2-cluster-route53](terraform/aws-rke2-cluster-route53/README.MD)

### For AWS EC2s with Bring Your Own LB/DNS/IP:
* Follow --> [terraform/aws-rke2-cluster-byob](terraform/aws-rke2-cluster-byob/README.md)