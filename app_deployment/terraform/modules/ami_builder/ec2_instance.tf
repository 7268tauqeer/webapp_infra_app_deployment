resource "aws_key_pair" "golden_ami_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "source_ec2" {
  ami           = data.aws_ami.latest-amazon-ami.id
  instance_type = var.instance_size
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [var.security_group_id]
  key_name = aws_key_pair.golden_ami_key.id
  tags = {
    Name = "golden_ami_source_instance"
  }

  provisioner "local-exec" {
  command = <<EOD
  cat <<EOF > aws_hosts 
  [dev] 
  ${aws_instance.source_ec2.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=${var.private_key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'
  EOD
}

  
}

data "aws_ami" "latest-amazon-ami" {
  most_recent = true
  owners = ["amazon"] # Canonical

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}