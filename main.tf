provider "aws" {
  region = "eu-west-3"
  shared_credentials_file = "${var.shared_credentials_file}"
}

resource "aws_lightsail_key_pair" "deployer" {
  name   = "deployer-key"
  public_key = "${var.ssh_key}"

}

resource "aws_lightsail_instance" "lightsail_instance" {
  name = "${var.instance_name}"
  availability_zone = "eu-west-3c"
  key_pair_name = "deployer-key"
  blueprint_id = "ubuntu_18_04"
  bundle_id = "small_2_0"
}
