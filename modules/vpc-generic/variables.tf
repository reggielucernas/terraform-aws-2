variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The IP address range in CIDR notation for the VPC."
  type        = string
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC."
  type        = bool
  default     = true
}

variable "public_subnet_cidr_block" {
  description = "The IP address range in CIDR notation for the Public subnet."
  type        = string
}

variable "private_app_cidr_block" {
  description = "The IP address range in CIDR notation for the Private-App subnet."
  type        = string
}

variable "private_persistence_cidr_block" {
  description = "The IP address range in CIDR notation for the Private-Persistence subnet."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone."
  type        = string
}
