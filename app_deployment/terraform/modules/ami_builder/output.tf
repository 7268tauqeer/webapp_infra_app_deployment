
output "source_ec2_instance_id" {
  description = " Intsnace of ec2 instance"
  value       = "${aws_instance.source_ec2.id}"
}

output "source_ec2_public_ip" {
  description = " public IP of the instance"
  value       = "${aws_instance.source_ec2.public_ip}"
}