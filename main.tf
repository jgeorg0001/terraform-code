provider "aws" {
  region = "eu-west-3"
  alias  = "Paris"
}


resource "aws_instance" "frontend" {
  count                   = "${var.counts}"
  provider                = "aws.Paris"
  ami                     = "${var.ami}"
  instance_type           = "${var.instance["type"]}"
  key_name                = "${var.key["name"]}"
  vpc_security_group_ids  = ["${aws_security_group.frontend.id}"]
  disable_api_termination = false

  tags = {
    Name       = "${var.tags["name"]}"
    App        = "${var.tags["app"]}"
    Maintainer = "${var.tags["maintainer"]}"
    Role       = "${var.tags["role"]}"
  }

  depends_on = ["aws_key_pair.terraform"]

  lifecycle {
    prevent_destroy = false
  }

  timeouts {
    create = "7m"
    delete = "1h"
  }

}
resource "aws_key_pair" "terraform" {
  key_name   = "${var.key["name"]}"
  provider   = "aws.Paris"
  public_key = "${var.key["pub"]}"

}


resource "aws_security_group" "frontend" {
  name        = "frontend"
  description = "Security config for frontend app"
  provider    = "aws.Paris"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Open SSH port open for All"
  }

  tags = {
    Role = "${var.tags["role"]}"
    App  = "${var.tags["app"]}"
  }
}
