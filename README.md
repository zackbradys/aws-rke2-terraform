![rancher-long-banner](images/rgs-banner-rounded.png)

# AWS RKE2 Terraform Guide

### Table of Contents
* [About Me](#about-me)
* [Introduction](#introduction)
* [Prerequisites](#prerequisites)
* [Configuration](#configuration)

## About Me
A little bit about me, my history, and what I've done in the industry.
- DOD/IC Contractor
- U.S. Military Veteran
- Open-Source Contributor
- Built and Exited a Digital Firm
- Active Volunteer Firefighter/EMT

## Introduction
The intent of this repository is to provide a baseline deployment for an out of the box, secure, and highly available [Rancher Kubernetes Engine (RKE2)](https://docs.rke2.io) cluster on AWS, managed by Terraform. In this implementation, I wanted to remove most of the assumptions and complexities that you see in many deployments.

**Contributing:** Please utilize GitHubs features such as Issues, Forks, and Pull Requests to contribute!

**Note:** This repository is a work in progress and may change from time to time.

## Prerequisites
* Git Utility, Terminal Utility, and HashiCorp Terraform with Access to the AWS Provider
* AWS Commercial or AWS GovCloud Account with an Access Key and Secret Key
* Ability to Subscribe to the [AWS Marketplace Listing for the AMI for Rocky 9](https://aws.amazon.com/marketplace/pp/prodview-ygp66mwgbl2ii) or use your own AWS AMI.

## Configuration

### For AWS EC2 ELB (Load Balancers and Private Subnets)
* Follow --> [terraform/aws-ec2-rke2-elb-tf](terraform/aws-ec2-rke2-elb-tf/README.md)

### For AWS EC2 Route53 (DNS Round Robin and Public Subnets):
* Follow --> [terraform/aws-ec2-rke2-route53-tf](terraform/aws-ec2-rke2-route53-tf/README.MD)

### For AWS EC2 Bring Your Own (LB/DNS/IP and Public Subnets):
* Follow --> [terraform/aws-ec2-rke2-byob-tf](terraform/aws-ec2-rke2-byob-tf/README.md)