# ----------------------------------------------------------------------------------------------------------------------
# CREATE A VPC
# This Terraform template creates a generic VPC for apps. The VPC includes 4 types of subnets:
# - Public
# - Private-App
# - Private-Peristence
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    { Name = var.vpc_name },
    var.tags
  )
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = { Name = "${var.vpc_name}-public" }
}

resource "aws_subnet" "private-app" {
  vpc_id            = aws_vpc.main
  cidr_block        = var.private_app_cidr_block
  availability_zone = var.availability_zone

  tags = { Name = "${var.vpc_name}-private-app" }
}

resource "aws_subnet" "private-persistence" {
  vpc_id            = aws_vpc.main
  cidr_block        = var.private_persistence_cidr_block
  availability_zone = var.availability_zone

  tags = { Name = "${var.vpc_name}-private-persistence" }
}
