variable "project" {
  type    = string
  default = "zomato"
}

variable "env" {
  type    = string
  default = "prod"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YY-HH-mm-ss", timestamp())}"
  image-name     = "${var.project}-${var.env}-${local.image-timestamp}"
}

variable "ami" {
  default = "ami-067c21fb1979f0b27"
}
