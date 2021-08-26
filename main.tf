terraform {
  required_providers {
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

variable "aws_region" {
  default="us-east-2"
}

provider "aws" {
  region  = var.aws_region
}

resource "aws_instance" "web" {  
  // ubuntu2004instance
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  
   tags = {
     Name = "Automation"
     ServerType="ubuntu2004"
   }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AJ+m=="
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "private_ip" {
   value = "${aws_instance.web.private_ip}"
}

