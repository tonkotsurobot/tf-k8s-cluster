# Variables
variable "vsphere_vcenter" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "template_name" {}
variable "vm_name" {}
variable "vsphere_datastore" {}
variable "vmcount" {
  default = "1"
}
variable "vsphere_cluster" {}
