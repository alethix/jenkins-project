ssh_username = "root"
ssh_password = ""

vsphere_template_name = "centos8_x64_packer_template"
vsphere_folder        = "Jenkins_Automation_Project"

cpu_num     = 2
mem_size    = 4096
disk_size   = 20000

vsphere_server          = "vcenter.alethixlabs.io"
vsphere_dc_name         = "Alethix Datacenter"
vsphere_compute_cluster = "Mission Innovation Lab"
vsphere_datastore       = "4TB_Array"
vsphere_portgroup_name  = "VM Network"

os_iso_path = "[4TB_Array] ISO/CentOS-Stream-8-x86_64-20220215-dvd1.iso"