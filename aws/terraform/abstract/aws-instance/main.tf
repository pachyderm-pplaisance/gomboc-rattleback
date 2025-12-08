resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"

  ebs_block_device {
    device_name = "/dev/xvda"
  }
}
