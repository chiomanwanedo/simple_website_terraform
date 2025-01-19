variable "aws_region" {
  default = "eu-west-2"  #Use your preferred region
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-03715fb51899253c4" # Amazon Linux 2 AMI
}

variable "key_pair_name" {
  description = "chioma_keypair"
  type        = string
}