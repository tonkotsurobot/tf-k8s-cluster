# Variables
variable "vsphere_vcenter" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_datacenter" {}
variable "template_name" {}
variable "vm_name" {}
variable "ip_address_base" {
  default = "192.168.1."
}
variable "octet" {}
variable "vsphere_datastore" {}
variable "vmcount" {
  default = "1"
}
variable "vsphere_cluster" {}
