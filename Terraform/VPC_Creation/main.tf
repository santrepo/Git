# 1.vpc
    resource "aws_vpc" "tf_vpc" {
      cidr_block = var.cidr_block_vpc
      tags = {
         name = var.tag_name
      }
    }

# 2.internet gateway
   resource "aws_internet_gateway" "tf_igw" {
      vpc_id = aws_vpc.tf_vpc.id
      tags = {
        name = var.tag_name
      }
   }

# 3.public subnet
   resource "aws_subnet" "pub_subnet" {
     vpc_id = aws_vpc.tf_vpc.id
     cidr_block = var.cidr_block_public_sub
     availability_zone = "ap-south-1a"
     tags ={
      name = var.tag_name
     }
   }

# 4.private subnet
 resource "aws_subnet" "pri_subnet" {
     vpc_id = aws_vpc.tf_vpc.id
     cidr_block = var.cidr_block_private_sub
     availability_zone = "ap-south-1a"
     tags ={
      name = var.tag_name
      }
   }

# 5.route table public
 resource "aws_route_table" "tf_pub_rt" {
   vpc_id = aws_vpc.tf_vpc.id

   route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.tf_igw.id
   }

   tags = {
      name = "public route table"
   }
   
 }

# 6.route table private
 resource "aws_route_table" "tf_pri_rt" {
   vpc_id = aws_vpc.tf_vpc.id
   tags = {
      name = "private route table"
   }
 }

# 7.assignment of subnet with route table
resource "aws_route_table_association" "tf_pub_rt_ass" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.tf_pub_rt.id
}

# 8.assignment of subnet wit private route table
resource "aws_route_table_association" "tf_pri_rt_ass" {
  subnet_id = aws_subnet.pri_subnet.id
  route_table_id = aws_route_table.tf_pri_rt.id
}

# 9.security group
resource "aws_security_group" "tf_srg" {
  vpc_id = aws_vpc.tf_vpc.id
  name = "terraform_security_group"

  # SSH access
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule (allow all)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
