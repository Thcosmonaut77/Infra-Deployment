variable "region" {
  description = "AWS region"
  type = string
}

variable "profile" {
  description = "AWS profile"
  type = string
}

variable "az1" {
  description = "Availability zone 1"
  type = string
}

variable "allowed_ip" {
  description = "Allowed SSH CIDR"
  type = string
  sensitive = true
}

variable "instance_type" {
  description = "Instance type"
  type = string
}

variable "kp" {
  description = "key pair"
  type = string
}

variable "server_names" {
  description = "server names"
  type = list(string)
}