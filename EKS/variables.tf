variable "name" {
    default = "arkadii"
}
#variable "vpc_cidr" {
#}
#variable "private_subnets" {
#}
#variable "public_subnets" {
#}
variable "vpc_id" {
}
variable "subnets_ids" {
}
variable "tags" {
}
variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}

### Backend vars
variable "iam_profile" {
  description = "Profile of aws creds"
  default     = null
}

variable "zone_name" {
}

variable "external_dns_policy_name" {
  type    = string
<<<<<<< HEAD
  default = "external-dns-irsa-external-dns-arkadii"
}

variable "admin_password_bcrypt" {
  description = "bcrypt-хеш пароля для ArgoCD admin"
  type        = string
=======
  default = "external-dns-irsa-external-dns"
>>>>>>> c4b68d66763e7a055b833a6708ed193cd3f73e87
}
