terraform {
  backend "local" {
    path = "/mnt/tf-k8s-cluster/terraform.tfstate"
  }
}

resource "vsphere_virtual_machine" control {
  name             = "${lookup(var.control[count.index], "hostname")}"
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  num_cpus         = "${lookup(var.control[count.index], "CPU_Count")}"
  memory           = "${lookup(var.control[count.index], "RAM")}"
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  count            = "${length(var.control)}"
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${lookup(var.control[count.index], "hostname")}"
        domain    = "home"
      }

      network_interface {
        ipv4_address = "${lookup(var.control[count.index], "ip")}"
        ipv4_netmask = 24
      }
      
      dns_server_list = ["192.168.1.254"]
      dns_suffix_list = ["home"]
      ipv4_gateway    = "192.168.1.254"

    }
  }

}

resource "vsphere_virtual_machine" worker {
  name             = "${lookup(var.worker[count.index], "hostname")}"
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  num_cpus         = "${lookup(var.worker[count.index], "CPU_Count")}"
  memory           = "${lookup(var.worker[count.index], "RAM")}"
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  count            = "${length(var.worker)}"
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "${lookup(var.worker[count.index], "hostname")}"
        domain    = "home"
      }

      network_interface {
        ipv4_address = "${lookup(var.worker[count.index], "ip")}"
        ipv4_netmask = 24
      }
      
      dns_server_list = ["192.168.1.254"]
      dns_suffix_list = ["home"]
      ipv4_gateway    = "192.168.1.254"

    }
  }

}


