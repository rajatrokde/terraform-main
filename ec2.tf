resource "aws_instance" "website" {
  ami           = "ami-0e97ea97a2f374e3d"
  instance_type = "t2.micro"
  user_data     = <<-EOF
              #!/bin/bash
              yum update
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx_server"
  }
}
