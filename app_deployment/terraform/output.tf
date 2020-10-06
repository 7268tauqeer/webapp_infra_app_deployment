output "golden_ami" {
    value = "${aws_ami_from_instance.webapp_golden_ami.id}"
}