# module "ecr" {
#   source = "./modules/0_ecr"
#   env_prefix = var.env_prefix
# }

module "vpc" {
  source = "./modules/1_vpc"
  vpc_cidr_block = var.vpc_cidr_block
  env_prefix = var.env_prefix
}

module "igw" {
  source = "./modules/02_igw"
  vpc_id = module.vpc.vpc_id
  env_prefix = var.env_prefix
}

module "subnets" {
  source = "./modules/03_subnets"
  private_subnet_cidr_block1 = var.private_subnet_cidr_block1
  private_subnet_cidr_block2 = var.private_subnet_cidr_block2
  public_subnet_cidr_block1 = var.public_subnet_cidr_block1
  public_subnet_cidr_block2 = var.public_subnet_cidr_block2
  availability_zone1 = var.availability_zone1
  availability_zone2 = var.availability_zone2
  vpc_id = module.vpc.vpc_id
  env_prefix = var.env_prefix
}

module "nat" {
    source = "./modules/04_nat"
    private_subnet_1a_id = module.subnets.private_subnet_1a_id
    env_prefix = var.env_prefix
    igw = module.igw.igw
}

module "routes" {
  source = "./modules/05_routes"
  private_subnet_1a_id = module.subnets.private_subnet_1a_id
  private_subnet_1b_id = module.subnets.private_subnet_1b_id
  public_subnet_1a_id = module.subnets.public_subnet_1a_id
  public_subnet_1b_id = module.subnets.private_subnet_1b_id
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  env_prefix = var.env_prefix
  route_cidr_block = var.route_cidr_block
  core_network_arn = var.core_network_arn
}

module "eks" {
  source = "./modules/6_eks"
  private_subnet_1a_id = module.subnets.private_subnet_1a_id
  private_subnet_1b_id = module.subnets.private_subnet_1b_id
  public_subnet_1a_id = module.subnets.public_subnet_1a_id
  public_subnet_1b_id = module.subnets.private_subnet_1b_id
}

module "nodes" {
  source = "./modules/7_nodes.tf"
  private_subnet_1a_id = module.subnets.private_subnet_1a_id
  private_subnet_1b_id = module.subnets.private_subnet_1b_id
  eks_cluster_name = module.eks.eks_cluster_name
}

module "iam_oidc" {
  source = "./modules/8_iam_oidc"
  eks_cluster_url = module.eks.eks_cluster_url
}

module "iam_test" {
  source = "./modules/09_iam_test"
  oidc_eks_arn = module.iam_oidc.eks_oidc_arn
  eks_oidc_url = module.iam_oidc.eks_oidc_url
}

module "iam_autoscaler" {
  source = "./modules/10_iam_autoscaler"
  eks_oidc_url = module.iam_oidc.eks_oidc_url
  oidc_eks_arn = module.iam_oidc.eks_oidc_arn
}
