resource "aws_instance" "this" {
  ami           = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"

  iam_instance_profile = "FT-EC2-Role"

  vpc_security_group_ids = [
    aws_security_group.this.id
  ]

  subnet_id = aws_subnet.public.id

  user_data = <<-EOF
    #!/bin/bash
    # Redirect output and errors to a log file for debugging
    sudo exec > /var/log/user-data.log 2>&1
    sudo set -x

    # Update all packages
    sudo dnf update -y

    # Install Nginx
    sudo dnf install -y nginx

    # Write the HTML content to the Nginx index page
    sudo echo "<h1>Manila Ops DevOps Training</h1>" > /usr/share/nginx/html/index.html

    # Start and enable the Nginx service
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF

  tags = {
    Name = "noel ec2"
  }
}
