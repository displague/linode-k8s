variable "master_count" {
  type    = "string"
  default = "1"
}

variable "worker_count" {
  type    = "string"
  default = "3"
}

variable "public_key_path" {
  type = "string"
  default = "~/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  type = "string"
  default = "~/.ssh/id_rsa"
}

variable "linode_token" {
  type = "string"
}

variable "root_password" {
  type = "string"
}

variable "domain" {
  type    = "string"
  default = "example.net"
}

variable "hostname_format" {
  type = "string"
  default = "node-%d"
}

variable "token" {
  type = "string"
}

variable "kubernetes_api_port" {
  type    = "string"
  default = "6443"
}
