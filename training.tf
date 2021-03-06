#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-958128fa
#
# Your subnet ID is:
#
#     subnet-6987b713
#
# Your security group ID is:
#
#     sg-73a74919
#
# Your Identity is:
#
#     terraform-training-falcon
#

variable "count" {
  default = 2
}

resource "aws_instance" "web" {
  ami                    = "ami-958128fa"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-6987b713"
  vpc_security_group_ids = ["sg-73a74919"]

  count = "${var.count}"

  tags {
    "Identity"   = "terraform-training-falcon"
    "Owner"      = "od007"
    "Department" = "Derivatives Trading"
    "Name"       = "web ${count.index +1} / ${var.count}"
  }
}
