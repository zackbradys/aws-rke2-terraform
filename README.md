---
title: AWS RKE2 Terraform
author: Zack Brady - Field Engineer
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
The intent of this repository is to provide a baseline deployment for an out of the box, secure, and highly available [Rancher Kubernetes Engine (RKE2)](https://docs.rke2.io) cluster on AWS managed by Terraform. In this implementation, I wanted to remove most of the assumptions and complexities that you see in many deployments. It was based off of the common issue of bootstrapping RKE2 with very little or no available services and limited knowledge of RKE2 or Kubernetes.

**At the end of this deployment, you will have a Highly Available (HA) RKE2 Kubernetes Cluster, the controls from the RKE2 DISA STIG, utilzing multiple AWS Subnets and AWS Availability Zones, and managed by Terraform.**

**Contributing:** Please utilize GitHubs features such as Forks, Issues, and Pull Requests to contribute!

**Note:** This repository is a work in progress and may change from time to time.

## Prerequisites
* Git Utility (Git, Github Desktop, etc...)
* Terminal Utility (Terminal, VSCode, Termius etc...)
* HashiCorp Terraform with Access to the AWS Provider 
* AWS Commercial or AWS GovCloud Account (with an Access Key and Secret Key)
* Ability to Subscribe to the [AWS Marketplace Listing for the AMI for Rocky 9](https://aws.amazon.com/marketplace/pp/prodview-ygp66mwgbl2ii) or use your own AWS AMI Image.

## Configuration

### For Bring Your Own (LB/DNS/IP):
* Complete [terraform/aws-ec2-rke2-tf](/terraform/aws-ec2-rke2-tf/README.md)

### For AWS Route 53 (DNS):
* Complete [terraform/aws-ec2-rke2-route53-tf](/terraform/aws-ec2-rke2-route53-tf/README.MD)

### For AWS ELB (Load Balancers)
* Complete [terraform/aws-ec2-rke2-elb-tf](/terraform/aws-ec2-rke2-elb-tf/README.md)

## Roadmap
* ~~README Updates/Instructions~~
* ~~Terraform Code Additions for~~
  * ~~Configuring an AWS ELB~~
  * ~~Configuring your Route 53~~
  * ~~Bring Your Own LB/DNS/IP~~