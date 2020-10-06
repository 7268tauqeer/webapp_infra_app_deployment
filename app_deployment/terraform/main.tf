

provider "aws" {
  region = var.aws_region
  profile= var.aws_profile
}


data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "tfstate-store-0987"
    key    = "tfstate_test_store"
    region = "ap-southeast-2"
  }
}


module "ec2_instance" {
  source = "./modules/ami_builder"
  key_name   = var.key_name
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  instance_size = var.instance_size
  subnet_id = data.terraform_remote_state.network.outputs.public_subnet_a
  security_group_id = data.terraform_remote_state.network.outputs.public_sg
  rds_endpoint = data.terraform_remote_state.network.outputs.rds_endpoint
}

resource "null_resource" "webapp_config" {
  provisioner "local-exec" {
    command = "sleep 60 && ansible-playbook ../ansible/app_config.yml -i aws_hosts"
    }
  depends_on = [module.ec2_instance]
}
resource "random_id" "golden_ami" {
  byte_length = 8
}

resource "aws_ami_from_instance" "webapp_golden_ami" {
  name               = "webapp_ami-${random_id.golden_ami.b64}"
  source_instance_id = "${module.ec2_instance.source_ec2_instance_id}"
  depends_on = [module.ec2_instance, null_resource.webapp_config]
}

resource "null_resource" "update_tfvars" {
  provisioner "local-exec" {
    command = "sed -i '/^ami/d' ../../infra_deployment/terraform.tfvars && echo ami_id=\"${aws_ami_from_instance.webapp_golden_ami.id}\" >> ../../infra_deployment/terraform.tfvars"
    }
  depends_on = [aws_ami_from_instance.webapp_golden_ami]
}


