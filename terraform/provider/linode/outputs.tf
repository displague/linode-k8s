output "hostnames" {
  value = ["${linode_instance.node.*.label}"]
}

output "private_ips" {
  value = ["${linode_instance.node.*.private_ip_address}"]
}

output "public_ips" {
  value = ["${linode_instance.node.*.ip_address}"]
}

output "public_network_interface" {
  value = "eth0"
}

output "private_network_interface" {
  value = "eth0"
}
