output "vpc_id" {
  value = aws_vpc.terraform-vpc.id
  description = "The ID of terraform-vpc"
}

output "cidr_block" {
  value = aws_vpc.terraform-vpc.cidr_block
  description = "The CIDR/BLOCK of the VPC"
}