variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-east"
}

variable "ibmcloud_zone" {
  description = "Preferred IBM Cloud zone in the region to use for your infrastructure"
  default = "2"
}

variable "resource_group" {
  default = "Default"
  description = "Define the resource group for the workload"
}

variable "vpc_name" {
  default = "rhpds"
  description = "Name of your VPC"
}

variable "subnet_name" {
  default = "rhpds"
  description = "Name of your Subnet"
}

variable "pg_name" {
  default = "rhpds"
  description = "Name of your Public Gateway"
}

variable "cos_name" {
  default = "rhpds"
  description = "Cloud Object Storage resource instance"
}

variable "cluster_name" {
  default = "rhpds"
  description = "Name of RHOIC Cluster"
}

variable "cluster_version" {
  default = "4.6.23_openshift"
  description = "Openshift Version for RHOIC Cluster"
}

variable "cluster_flavor" {
  default = "bx2.4x16"
  description = "Worker Flavor for RHOIC Cluster"
}

variable "cluster_worker_count" {
  default = "3"
  description = "Worker count per Zone for RHOIC Cluster"
}
