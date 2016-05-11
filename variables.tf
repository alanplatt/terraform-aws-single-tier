variable "public_key_path" {
    default = "~/.ssh/id_rsa_aws_1.pub"
}

variable "key_name" {
    default = "id_rsa_aws_1"
}

variable "aws_region" {
    default = "eu-west-1"
}

# Ubuntu 14.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-f95ef58a"
  }
}

variable "web-instances" {
  default = {
    "count" = 4
  }
}
