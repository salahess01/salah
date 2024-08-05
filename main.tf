terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2" # Use the latest version available
    }
  }
}

provider "virtualbox" {
  # Configuration options (if any)
}

resource "virtualbox_vm" "my_vm" {
  name      = "my-vm"
  os_type   = "Ubuntu_64"
  cpus      = 2
  memory    = 1024
  vram      = 12

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }

  disk {
    size = 10240 # Size in MB
  }
}
