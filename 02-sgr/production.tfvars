region           = "us-east-1"
name             = "myne"
team             = "myne"
cidr             = "10.1.0.0/16"
azs              = ["us-east-1a", "us-east-1b"]
public_subnets   = ["10.1.0.0/24", "10.1.1.0/24"]
private_subnets  = ["10.1.10.0/24", "10.1.11.0/24"]
database_subnets = ["10.1.20.0/24", "10.1.21.0/24"]
single_nat_gateway = true