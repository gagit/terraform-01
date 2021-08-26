terraform {
<<<<<<< HEAD
  required_providers{
    /*
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
    */
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
=======
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
>>>>>>> de5d70a7fe08212706979cdfa22948fb62826c68
    }
  }
}

<<<<<<< HEAD
provider "aws" {
  region  = "us-east-2"
=======
variable "aws_region" {
  default="us-east-2"
}


provider "aws" {
  region  = var.aws_region
>>>>>>> de5d70a7fe08212706979cdfa22948fb62826c68
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

sgr-0c0f23e390eb43319


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AJ+m3KgVA/YxHhOqHp9H6g/KgADlYXqSVQz7f0TWgbBNsrgv6pHXwaeiNuFuvO+BpWYDybe6f69zQ/nWlSnVU3TaqvMC228WtD4XzB6LzDu2+IJegqazJ9Dq0X3BLsGGCUWQh/IpURpSt8vS3ZgKFpH8xMdqCjUEAVCZkBsdM8zR96h2ABQpICLHmg3VHxgUHOPeToe0cmhfN2sMzavJZzs7A4kNwGX1P7aPWVVTDH3HppwVAhUoT3kpCue5pV3LXem0EdsHaz0o+QUYi+5DfVVrpcO6qPejKQNey9uLKcMCg6HTVg2P4zqM3s628imSh8UTqJ37T65q9nHoo1WjxUL6daN6qieYxvCk4ZytcxDZPeBK2K2zfs1qMbExf1VaxKn+jUewP4H1DKLMgsj5sVulb4QAhTJFkyOWDJCMgfYWYcQPcauAwTji4KwqGdQc30fTypevZRV6Np79Dvvd6cSI6sNJ0dHiqMDalucjo++O518hgYIiJ5Jk10MWXU9TqtigJqo6wGnDT4nJ0aNa2/D2lw7IKMdS0u4j2KZLddyYATx0b3bO8zIqbODt13Xj31gbzXbQ75qCeSLHig40gs0dX/gD9Eh525YwUMf3+ZMO7TKLxjA9Y6wt1C0R/X6Q8E4Yxw== gabrielandrestoledo@gmail.com"
}
output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "private_ip" {
   value = "${aws_instance.web.private_ip}"
}

