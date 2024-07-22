resource "aws_instance" "website" {
  ami           = "ami-0e97ea97a2f374e3d"
  instance_type = "t2.micro"
  user_data     = <<-EOF
              #!/bin/bash
              yum update
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              cd /usr/share/nginx/html
              wget https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip

              EOF

  tags = {
    Name = "nginx_server"
  }
}
