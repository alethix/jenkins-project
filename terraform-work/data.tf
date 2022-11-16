data "vsphere_datacenter" "alethix_data_center" {
  name = "Alethix Datacenter"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Mission Innovation Lab"
  datacenter_id = data.vsphere_datacenter.alethix_data_center.id
}

data "vsphere_datastore" "datastore" {
  name          = "4TB_Array"
  datacenter_id = data.vsphere_datacenter.alethix_data_center.id
}

data "vsphere_network" "network" {
  datacenter_id = data.vsphere_datacenter.alethix_data_center.id
  name          = "VM Network"
}

data "vsphere_virtual_machine" "template" {
  name          = "centos8_x64_packer_template"
  datacenter_id = data.vsphere_datacenter.alethix_data_center.id
}

data "vsphere_folder" "folder" {
  path          = var.v_04_vsphere_folder  
  datacenter_id = data.vsphere_datacenter.alethix_data_center.id
}