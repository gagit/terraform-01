provider "aws" {
  version = "3.48.0"
  region  = "us-east-2"
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

