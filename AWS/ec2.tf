# aws ec2 instance creation
resource "aws_instance" "web" {
  count                  = 2
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.tf-key.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "tf-instance-${count.index + 1}"
  }
}

output "instance_public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}
