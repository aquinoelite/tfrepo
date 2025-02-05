resource "aws_security_group" "noel" {
  vpc_id = aws_vpc.noel.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #allow all
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "noel"
  }
}
