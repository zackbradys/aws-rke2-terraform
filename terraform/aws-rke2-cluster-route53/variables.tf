### Required Variables
variable "region" {
  type        = string
  description = "(Required) The AWS Region to use for the instance(s)."
}

variable "access_key" {
  type        = string
  description = "(Required) The AWS Access Key to use for the instance(s)."
}

variable "secret_key" {
  type        = string
  description = "(Required) The AWS Secret Key to use for the instance(s)."
}

variable "key_pair_name" {
  type        = string
  description = "(Required) The AWS Key Pair name to use for the instance(s)."
}

variable "domain" {
  type        = string
  description = "(Required) The AWS Route53 Domain to use for the instance(s)."
}

variable "prefix" {
  type        = string
  description = "(Required) The prefix/name for all provisioned resources."
}

### Optional Variables
variable "token" {
  default     = "awsRKE2terraform"
  type        = string
  description = "(Optional) The RKE2 Cluster Join Token to use for the cluster(s)."
}

variable "vRKE2" {
  default     = "v1.29"
  type        = string
  description = "(Optional) The RKE2 Version to use for the clusters(s)."
}

variable "ami_id" {
  default     = "ami-0ebfd941bbafe70c6"
  type        = string
  description = "(Optional) The AWS AMI ID to use for the instance(s)."
}

### Networking Variables
variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "(Optional) The AWS VPC CIDR Block to use for the instance(s)."
}

variable "subnet_cidr_blocks" {
  default     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  type        = list(any)
  description = "(Optional) The AWS Subnet CIDR Blocks to use for the instance(s)."
}

variable "associate_public_ip_address" {
  default     = true
  type        = bool
  description = "(Optional) Associate AWS Public IP Address for use for the instance(s)."
}

### Instance Variables
variable "instance_type_control" {
  default     = "m5.xlarge"
  type        = string
  description = "(Optional) The AWS Instance type to use for the instance(s)."
}

variable "instance_type_controls" {
  default     = "m5.xlarge"
  type        = string
  description = "(Optional) The AWS Instance type to use for the instance(s)."
}

variable "instance_type_worker" {
  default     = "m5.2xlarge"
  type        = string
  description = "(Optional) The AWS Instance type to use for the instance(s)."
}

variable "number_of_instances_control" {
  default     = 1
  type        = number
  description = "(Optional) The number of AWS EC2 instances to create on deployment."
}

variable "number_of_instances_controls" {
  default     = 2
  type        = number
  description = "(Optional) The number of AWS EC2 instances to create on deployment."
}

variable "number_of_instances_worker" {
  default     = 3
  type        = number
  description = "(Optional) The number of AWS EC2 instances to create on deployment."
}

### Storage Variables
variable "volume_size_control" {
  default     = 128
  type        = number
  description = "(Optional) The AWS Volume Size to use for the instance(s)."
}

variable "volume_size_controls" {
  default     = 128
  type        = number
  description = "(Optional) The AWS Volume Size to use for the instance(s)."
}

variable "volume_size_worker" {
  default     = 256
  type        = number
  description = "(Optional) The AWS Volume Size to use for the instance(s)."
}

variable "volume_type_control" {
  default     = "gp3"
  type        = string
  description = "(Optional) The AWS Volume Type to use for the instance(s)."
}

variable "volume_type_controls" {
  default     = "gp3"
  type        = string
  description = "(Optional) The AWS Volume Type to use for the instance(s)."
}

variable "volume_type_worker" {
  default     = "gp3"
  type        = string
  description = "(Optional) The AWS Volume Type to use for the instance(s)."
}

variable "encrypted" {
  default     = true
  type        = bool
  description = "(Optional) Volume Encryption for use for the instance(s)."
}

variable "delete_on_termination" {
  default     = true
  type        = bool
  description = "(Optional) Delete on Termination for the instance(s)."
}
