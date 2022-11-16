/*
placing v_01, V_02 etc before variables, as terraform is asking the variable values based on alphabetical order, which is weird
*/

variable "v_01_provider_username" {
  type        = string
  description = "User Name: "
}

variable "v_02_provider_password" {
  type        = string
  description = "Password: "
  sensitive = true  
}

variable "v_03_provider_vsphere_server" {
  type        = string
  description = "Vsphere Server: "
  default     = "vcenter.alethixlabs.io"
}

variable "v_04_vsphere_folder" {
  type        = string
  description = "VSphere Folder: "
  default     = "Jenkins_Automation_Project"
}

variable "v_05_vsphere_vm_master" {
  type        = string
  description = "VM Name: "
  default     = "jenkins-master"
}

variable "v_06_vsphere_vm_agent" {
  type        = string
  description = "VM Name: "
  default     = "jenkins-agent"
}