terraform {
  required_providers{
    /*
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    */

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}


data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}



resource "aws_instance" "web" {  
  // ubuntu2004instance
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  key_name = var.key_pair_name
  subnet_id = data.aws_subnet.selected.id
  security_groups = [aws_security_group.allow-ssh-all-test.id]

   tags = {
     Name = "Automation"
     ServerType="ubuntu2004"
   }
}

resource "aws_security_group" "allow-ssh-all-test" {
name = "allow-ssh-all-test"
vpc_id = data.aws_vpc.selected.id
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AJ+m3KgVA/YxHhOqHp9H6g/KgADlYXqSVQz7f0TWgb"
}
