resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "${var.env_prefix}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.private_subnet_1a_id

  tags = {
    Name = "${var.env_prefix}-nat"
  }

  depends_on = [var.igw]
}

