terraform {
  required_providers {
    virtualbox = {
      source = "shekeriev/virtualbox"
#      version = "0.0.4"
    }
  }
}

# There are currently no configuration options for the provider itself.

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
