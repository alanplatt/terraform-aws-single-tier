resource "aws_vpc" "default" {
  tags {
    Name = "Web"
  }
  cidr_block = "10.0.0.0/16"
}
