variable "region" {
  description = "AWS region"
  type = string
}

variable "profile" {
  description = "AWS profile"
  type = string
}

variable "my_ip" {
  description = "Allowed CIDR"
  type = string
  sensitive = true
}

variable "kp" {
  description = "Key pair" 
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}