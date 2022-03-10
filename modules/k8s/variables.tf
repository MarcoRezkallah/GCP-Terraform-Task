variable "cluster_region" {}
variable "cluster_zones_list" {}
variable "machine_type" {}
variable "nodes_per_zone" {}
variable "cluster_name" {}
variable "master_node_cidr" {}
variable "vpc_link" {}
variable "subnet_link" {}
variable "subnet_cidr" {}
variable "machine_os_image" { default = "COS_CONTAINERD" }
