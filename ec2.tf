resource "aws_instance" "tfec2" {
  ami = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  key_name = "MyKeyPairDevOps"
  subnet_id = aws_subnet.tfsubnet.id
  security_groups = [ aws_security_group.tfsecuritygroup.name ]
  tags = {
    Name = "terraform_ec2"
  }
}