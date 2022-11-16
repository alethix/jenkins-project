terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  user                 = var.v_01_provider_username
  password             = var.v_02_provider_password
  vsphere_server       = var.v_03_provider_vsphere_server
  allow_unverified_ssl = true
}