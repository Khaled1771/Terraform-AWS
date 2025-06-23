resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.cidr_block
  tags = {
    name = var.vpc_name
  }
}