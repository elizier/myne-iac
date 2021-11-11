module "vpc" {
  source                             = "terraform-aws-modules/vpc/aws"
  version                            = "3.11.0"
  name                               = local.vpc_name
  tags                               = local.tags
  cidr                               = var.cidr
  azs                                = var.azs
  private_subnets                    = var.private_subnets
  database_subnets                   = var.database_subnets
  public_subnets                     = var.public_subnets
  public_subnet_tags                 = local.public_subnet_tags
  private_subnet_tags                = local.private_subnet_tags
  enable_nat_gateway                 = true
  single_nat_gateway                 = var.single_nat_gateway
  enable_dns_support                 = true
  enable_dns_hostnames               = true
  create_database_subnet_route_table = true

}