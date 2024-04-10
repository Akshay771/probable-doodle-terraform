variable users {
    type = list
    default = ["Rock", "Dave"]
}

variable "usermap" {
    type = map
    default = {
        John = 21
        Rock = 11 
    }
}

output joinfunction {
    value = "${join("----->", var.users)}"

}

output upperthestring{
    value = "${upper(var.users[1])}"
}

output lowerthestring{
    value = "${lower(var.users[1])}"
}

output mapfun {
    value = "Name is John and my age is ${lookup(var.usermap, "John")}"
}