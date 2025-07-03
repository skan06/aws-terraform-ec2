provider "aws" {
  region = "eu-west-1" 
}

# 1️⃣ Clé SSH publique utilisée pour se connecter à l'EC2
resource "aws_key_pair" "my_key_ssh" {
  key_name   = "my-key-terraform"
  public_key = file("${path.module}/my-key.pub")
}

# 2️⃣ Groupe de sécurité autorisant le SSH (port 22)
resource "aws_security_group" "ssh_sg" {
  name        = "ssh-access"
  description = "Autorise le SSH depuis Internet"

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

# 3️⃣ Instance EC2 Amazon Linux 2
resource "aws_instance" "mon_instance" {
  ami                    = "ami-0fab1b527ffa9b942"  # Amazon Linux 2 pour eu-west-1
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.my_key_ssh.key_name
  security_groups        = [aws_security_group.ssh_sg.name]

  tags = {
    Name = "test-EC2"
  }
}
