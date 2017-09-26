# Getting started

You'll need a triton account name and key id (ssh fingerprint) from ops, head over
to #ops-chat and chat about that.

Install Terraform https://www.terraform.io/:

```
brew install terraform
```

Checkout this repo and edit the `terraform.tfvars` file to add in the account
name and key id you got from ops, like so:

```
account = "stephen"
key_id  = "0e:a2:8f:a5:ca:a6:c6:5f:b7:be:d2:ef:c4:02:bc:bc"
```

Spin up `fa-web` module -- 3 smartos instances, 2 of which (fa-mysql & fa-lb) implicitly depend on fa-web,
and a such will be spun up once fa-web is complete (but then concurrently).

```
terraform plan
terraform apply
```

When you're done:

```
terraform destroy
```


# Troubleshooting

TODO The default SSH key path is `~/.ssh/id_rsa_triton_ovh`, if your key doesn't
match that you can pass it as a variable.

