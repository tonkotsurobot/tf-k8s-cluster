# Variables
variable "vsphere_vcenter" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_datacenter" {}
variable "template_name" {}
variable "vsphere_datastore" {}
variable "vsphere_cluster" {}
variable "control" {
  type = "list"
  default = [ ]
}

variable "worker" {
  type = "list"
  default = [ ]
}
