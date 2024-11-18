resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block #"10.0.0.0/16"

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}