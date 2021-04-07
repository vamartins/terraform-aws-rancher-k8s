variable "instanceNamePublicRancher" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "awslab-instance-rancher"
}

variable "instance_count" {
  description = "Number of Instances"
  default = "3"
}

variable "env" {
  description = "Environment of the Application"
  default     = "dev"
}

variable "Provisioner" {
  description = "Application used to provisioning"
  default     = "Terraform"
}

variable "ami" {
  description = "AWS AMI to be used "
  default     = "ami-08962a4068733a2b6"
}

variable "instanceTypeRancher" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default     = "t3a.medium"
}

variable "instanceTypeK8s" {
  description = "AWS Instance type defines the hardware configuration of the machine"
  default     = "t3a.small"
}

variable "keyName" {
  description = "Define what Key pairs the instance will use"
  default     = "challenge_tui"
}

variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "us-east-2"
}

variable "availabilityZone" {
  default = "us-east-2a"
}

variable "instanceTenancy" {
  default = "default"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "vpcCIDRblock" {
  default = "172.16.0.0/16"
}

variable "publicsCIDRblock" {
  default = "172.16.1.0/24"
}

variable "publicdestCIDRblock" {
  default = "0.0.0.0/0"
}

variable "localdestCIDRblock" {
  default = "172.16.0.0/16"
}

variable "ingressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "egressCIDRblock" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "mapPublicIP" {
  default = true
}