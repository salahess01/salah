terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.81.2:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "Salah@2021"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "my_vm" {
  name        = "my-vm"
  target_node = "CentosCICD1"
  iso       = "CentOS-7-x86_64-DVD-2009__1_.iso"

  os_type     = "qemu"

  cores       = 2
  memory      = 2048
  sockets     = 1
  scsihw      = "virtio-scsi-pci"


  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network.0.macaddr,
    ]
  }
}

