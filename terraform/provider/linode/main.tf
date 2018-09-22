provider "linode" {
  token = "${var.linode_token}"
}

resource "linode_instance" "node" {
  count                           = "${var.count}"

  label                           = "${format(var.hostname_format, count.index + 1)}"
  group                           = "kubernetes"
  region                          = "us-east"
  type                            = "g6-standard-2"
  private_ip                      = true

  disk {
    label                         = "boot"
    size                          = "81920"
    image                         = "linode/ubuntu16.04lts"
    root_pass                     = "${var.root_password}"
    authorized_keys               = [ "${var.public_key}" ]
  }

  config {
    label                         = "boot"
    kernel                        = "linode/grub2"
    devices {
      sda {
        disk_label                = "boot"
      }
    }
  }

  provisioner "remote-exec" {
    inline = [
      "hostnamectl set-hostname ${self.label}",
      "echo 'Acquire::ForceIPv4 \"true\";' >> /etc/apt/apt.conf.d/99force-ipv4",
      "apt-get update",
      "apt-get install -yq nfs-common",
    ]

    connection {
      type        = "ssh"
      host        = "${self.ip_address}"
      user        = "root"
    }
  }
}
