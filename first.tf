output "firstoutputblock" {
  value = "first block in tf"
}

output "secondoutputblock" {
  value = "second block in tf"
}

output "thirdoutputblock" {
  value = "third block in tf"
}

output "print_file_content" {
  # file function take file path and name as argument return its content
  value = file("${path.module}/file.txt")
  
}