resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block1 #"10.0.0.0/19"
  availability_zone = var.availability_zone1 #"us-east-1a"

  tags = {
    "Name"                            = "${var.env_prefix}-private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_cidr_block2 #"10.0.32.0/19"
  availability_zone = var.availability_zone2 #"us-east-1b"

  tags = {
    "Name"                            = "${var.env_prefix}-private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr_block1 #"10.0.64.0/19"
  availability_zone       = var.availability_zone2 #"us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "${var.env_prefix}-public-us-east-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr_block2 #"10.0.96.0/19"
  availability_zone       = var.availability_zone2 #"us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "${var.env_prefix}-public-us-east-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
