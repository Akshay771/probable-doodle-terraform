# to use system env variable directly
# set env variable like "export TF_VAR_name=Raju" and terraform plan command

variable "name" {
    type = string
}

output username {
    value = "Hello, ${var.name}"
}