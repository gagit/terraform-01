variable "vpc_id" {
   type = string
}
variable "key_pair_name" {
   type = string
}
variable "subnet_id" {
   type = string
}

variable "aws_region" {
  default="us-east-2"
}