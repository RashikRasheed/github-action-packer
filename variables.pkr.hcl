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
  default = "ami-0f5ee92e2d63afc18"
}
