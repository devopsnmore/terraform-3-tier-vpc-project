# vpc variables
variable "vpc_cidr" {
  default       = "10.0.0.0/16"
  description   = "vpc_cidr block"
  type          = string
}

variable "pub_subnet_az2a_cidr" {
  default       = "10.0.0.0/24"
  description   = "public subnet az2a cidr block"
  type          = string
}

variable "pub_subnet_az2b_cidr" {
  default       = "10.0.1.0/24"
  description   = "public subnet az2b cidr block"
  type          = string
}

variable "priv_app_subnet_az2a_cidr" {
  default       = "10.0.2.0/24"
  description   = "private app subnet az2a cidr block"
  type          = string
}

variable "priv_app_subnet_az2b_cidr" {
  default       = "10.0.3.0/24"
  description   = "private app subnet az2b cidr block"
  type          = string
}

variable "priv_data_subnet_az2a_cidr" {
  default       = "10.0.4.0/24"
  description   = "private data subnet az2a cidr block"
  type          = string
}

variable "priv_data_subnet_az2b_cidr" {
  default       = "10.0.5.0/24"
  description   = "private data subnet az2b cidr block"
  type          = string
}