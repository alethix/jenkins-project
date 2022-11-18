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

data "template_cloudinit_config" "jagent" {
  count = 3
  gzip = true
  base64_encode = true
  part {
    content_type = "text/cloud-config"
    content = <<-EOF
      #cloud-config
      hostname: ${var.v_06_vsphere_vm_agent}_${count.index + 1}.alethixlabs.io
      users:
        - name: ansible                    
          ssh-authorized-keys:
            - ${file("~/.ssh/id_ed25519.pub")}
      runcmd:
        - sed -i '/ansible insecure public key/d' /home/ansible/.ssh/authorized_keys
        # make sure the ansible account is not expired.
        # NB this is needed when the base image expires the ansible account.
        - usermod --expiredate '' ansible
      EOF
  }
}