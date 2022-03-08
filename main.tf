module "network" {
  source = "./modules/network"

  vpc_name    = "main-vpc"
  vpc_cidr    = "10.0.0.0/16"
  subnet_name = "main-subnet"
  subnet_cidr = "10.0.1.0/24"
}
