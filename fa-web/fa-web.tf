variable "name" {}

variable "triton_image" {
  default = "6eb0793f-2092-489b-8957-8a6c9eee509d"
}

variable "triton_networks" {
  default = ["6408f468-171a-4d40-9f30-7184c9f95677"]
}

variable "triton_package" {
  default = "r4-d10-c4"
}

variable "triton_ssh_key" {
  default = "~/.ssh/id_rsa_triton_ovh"
}

variable "triton_account" {}

variable "triton_key_id" {}

output "ip" {
  value = "${triton_machine.fa-web.primaryip}"
}

provider "triton" {
  account      = "${var.triton_account}"
  key_id       = "${var.triton_key_id}"
  url          = "https://cloudapi.ovh.triton.fac.cloud"
  version      = "~> 0.2"
  key_material = "${file("${var.triton_ssh_key}")}"
}

resource "triton_machine" "fa-web" {
  name    = "${var.name}-app"
  package = "${var.triton_package}"
  image   = "${var.triton_image}"

  networks = "${var.triton_networks}"

  provisioner "local-exec" {
    command = "echo ${triton_machine.fa-web.primaryip}"
  }
}

resource "triton_machine" "fa-lb" {
  name    = "${var.name}-lb"
  package = "${var.triton_package}"
  image   = "${var.triton_image}"

  networks = "${var.triton_networks}"

  provisioner "local-exec" {
    command = "echo ${triton_machine.fa-web.primaryip}"
  }
}

resource "triton_machine" "fa-mysql" {
  name    = "${var.name}-mysql"
  package = "${var.triton_package}"
  image   = "${var.triton_image}"

  networks = "${var.triton_networks}"

  provisioner "local-exec" {
    command = "echo ${triton_machine.fa-web.primaryip}"
  }
}
