provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "portfolio_sg" {
  name        = "portfolio-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "portfolio_server" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = "t2.micro"
  key_name               = "portfolio-key"
  vpc_security_group_ids = [aws_security_group.portfolio_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker run -d --restart unless-stopped -p 80:80 gomathi304/flair-frontend
              EOF

  tags = {
    Name = "PortfolioServer"
  }
}

output "website_url" {
  value = "http://${aws_instance.portfolio_server.public_ip}"
}