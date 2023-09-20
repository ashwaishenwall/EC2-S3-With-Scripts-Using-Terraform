# Input Variables
# AWS region
variable "aws_region" {
  description = "region in which aws resources to be created"
  type        = string
  default     = "us-east-1"
}
################################### Variables ####################################
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "HR"
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa"  = "t2.small"
    "prod" = "t3.medium"
  }
}