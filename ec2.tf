data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "MyFirstInstanceSG"
  description = "Allow SSH inbound traffic"
  
  ingress {
    description = "SSH from anywhere"
    from_port = 22
    to_port = 22
    protocol = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MyFirstInstanceSG"
  }
}


resource "aws_instance" "myfirstec2" {
  ami           = data.aws_ami.amazon_linux
  instance_type = "t2.micro"
  key_name      = aws_key_pair.a4l_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "MyFirstEC2Instance"
  }
}