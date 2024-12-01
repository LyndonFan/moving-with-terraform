variable "old_primary_dns_name" {
  type = string
  nullable = true
}

variable "secondary_dns_name" {
  type = string
  nullable = false
}

variable "primary_dns_name" {
  type = string
  nullable = false
}

variable "num_instances" {
  type = number
  nullable = false
}