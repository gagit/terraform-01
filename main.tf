terraform {
  required_providers {
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
  ami = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  
   tags = {
     Name = "ubuntu2004instance"
   }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

// output "private_ip" {
//   value = "${aws_instance.web.private_ip}"
// }

