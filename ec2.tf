resource "aws_instance" "noel" {
  ami           = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  key_name      = "devopskeypair"
  subnet_id     = aws_subnet.subnet1.id
  vpc_security_group_ids = [
    aws_security_group.noel.id
  ]

  tags = {
    Name = "noel"
  }

}
