variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "cluster_name" {
  default = "altschool-k8s"
}

variable "namespace" {
  type    = string
  default = "monitoring"
}

variable "kube-version" {
  type    = string
  default = "45.5.0"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "domain_name" {
  type    = string
  default = "paulskay.me"
}

variable "email_address" {
  type    = string
  default = "mailpaulskay@yahoo.co.uk"
}
variable "aws_account_id" {
  description = "account id number"
  default     = "064473886666"
}

variable "external_dns_chart_version" {
  description = "External-dns Helm chart version to deploy."
  type        = string
  default     = "6.14.0"
}

variable "external_dns_chart_log_level" {
  description = "External-dns Helm chart log leve. Possible values are: panic, debug, info, warn, error, fatal"
  type        = string
  default     = "warn"
}

variable "external_dns_zoneType" {
  description = "External-dns Helm chart AWS DNS zone type (public, private or empty for both)"
  type        = string
  default     = ""
}

# variable "external_dns_domain_filters" {
#   description = "External-dns Domain filters."
#   type        = list(string)
#   default = ["paulskay.me"]
# }