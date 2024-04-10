
# creating own ssh k"ey and sending public to instance on aws
# "$ssh-keygen -t rsa and enter location "./"
resource "aws_key_pair" "tf-key" {
  key_name = "tf-key"
  # path to public key
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = aws_key_pair.tf-key.key_name

}