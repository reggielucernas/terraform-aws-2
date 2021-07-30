# ----------------------------------------------------------------------------------------------------------------------
# CREATE A VPC
# This Terraform template creates a generic VPC for apps. The VPC includes 4 types of subnets:
# - Public (one per AZ)
# - Private-App (one per AZ)
# - Private-Peristence (one per AZ)
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    { Name = var.vpc_name },
    var.tags
  )
}

