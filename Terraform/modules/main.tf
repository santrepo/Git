provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
    source = "../VPC_Creation"
    cidr_block_vpc = "10.0.0.0/16"
    cidr_block_public_sub = "10.0.1.0/24"
    cidr_block_private_sub = "10.0.2.0/24"
}

module "EC2" {
  source = "../Ec2_Creation"
  instance_type_value = "t3.micro"
  ssh_key = "instance1sshkey"
  ami_value = "ami-019715e0d74f695be"
  subnet_id = module.vpc.aws_subnet_public
  vpc_sg_id = module.vpc.aws_security_group
}  

output "public_ip" {
  value = module.EC2.public-ip-address
}

output "private_ip" {
  value = module.EC2.private_ip
}