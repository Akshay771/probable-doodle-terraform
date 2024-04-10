# using variable 
# one way is to run the file directly using "terraform plan" command which requires variable value in shell as input.
# other is to run the command with variable and its value like 'terraform paln -var "variable1=value" -var "variable2=value"' 
# this method will overrides the default value set in variable.tf 


# using variable type string and number
output user {
    value = "Hello, ${var.username} your age is ${var.age}"
}

# using variable type list
output firstuser {
    value = "first name in list is ${var.users[0]} "
}