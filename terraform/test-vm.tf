resource "proxmox_vm_qemu" "test-vm" {
  vmid = 222
  name        = "test-vm"
  target_node = "shaman"

  # or for a Clone VM operation
  clone = "ubuntu-2204-template"
  full_clone = true
  bios = "ovmf"
  agent = 1
  scsihw = "virtio-scsi-single"

  os_type = "ubuntu"
  cpu {
    type = "x86-64-v2-AES"
    cores = 1
    sockets = 1
  }
  memory = 2048

  disks {
    scsi {
      scsi0 {
        disk {
          size = "32G"
          storage = "local"
          format = "qcow2"
        }
      }
    }
  }



  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
}
