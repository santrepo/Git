variable "tag_name" {
  default = "terraform"
}

variable "cidr_block_vpc" {
 description = "Cidr value for vpc"
}

variable "cidr_block_public_sub" {
  description = "Cidr value for public subnet"
}

variable "cidr_block_private_sub" {
  description = "cidr value for private subnet"
}

