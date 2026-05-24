output "vpc_id" {
  description = "VPC ID value"
  value = aws_vpc.tf_vpc.id
}

output "aws_internet_gateway" {
  description = "IGW ID value"
  value = aws_internet_gateway.tf_igw.id
}

output "aws_subnet_public" {
  description = "public Subnet-id value"
  value = aws_subnet.pub_subnet.id
} 

output "aws_subnet_private" {
  description = "private Subnet-id value"
  value = aws_subnet.pri_subnet.id
} 

output "aws_security_group" {
  description = "security group"
  value = aws_security_group.tf_srg.id
} 

output "aws_route_table_public" {
  description = "Route table id value for public subnet"
  value = aws_route_table.tf_pub_rt.id
}

output "aws_route_table_private" {
  description = "Route table id value for private subnet"
  value = aws_route_table.tf_pri_rt.id
}
