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
  type = string
}

variable "subnets_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "region" {
  default = "eu-central-1"
}

variable "iam_profile" {
  type    = string
  default = null
}

variable "zone_name" {
  type = string
}

variable "external_dns_policy_name" {
  type    = string
  default = "external-dns-irsa-external-dns-arkadii"
}

variable "group" {
  description = "DNS group name"
  type        = string
}
