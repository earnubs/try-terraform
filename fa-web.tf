variable "account" {}

variable "key_id" {}

output "ip" {
  value = "${module.my-fa-web.ip}"
}

module "my-fa-web" {
  name           = "int99"
  source         = "./fa-web"
  triton_account = "${var.account}"
  triton_key_id  = "${var.key_id}"
}
