variable username {
    type = string
    default = "Akshay"
}

variable age {
    type = number
    default = 25
}

# terraform plan -var-file=dev.tfvars ---- command to run with file name other than terraform.tfvars

output user {
    value = "Hello, ${var.username} your age is ${var.age}"
}