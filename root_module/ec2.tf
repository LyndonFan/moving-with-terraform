resource "aws_security_group" "webserver_sg" {
  name        = "webserver-security-group"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.internal_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.internal_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  webserver_script = file("${path.module}/server.sh")
  _webserver_python = file("${path.module}/webserver.py")
}

resource "aws_instance" "webserver" {
  ami           = "ami-0d750261a981f4cb8"  # Ubuntu 22.04 LTS in eu-west-2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  
  user_data = base64encode(local.webserver_script)
  user_data_replace_on_change = true

  tags = {
    Name = "Internal Webserver"
  }

  depends_on = [ local.webserver_script, local._webserver_python ]
}
