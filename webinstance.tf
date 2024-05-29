resource "aws_instance" "webserver" {
  ami               = "ami-053b0d53c279acc90" # Replace with your desired AMI
  instance_type     = "t2.micro"              # Replace with your desired instance type
  key_name          = "terrakey"              # Replace with your SSH key pair name
  availability_zone = "us-east-1a"

  tags = {
    Name = "WebServerInstance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt-get install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo Congratulations! on your first Webserver Installation > /var/www/html/index.html'
              EOF
}