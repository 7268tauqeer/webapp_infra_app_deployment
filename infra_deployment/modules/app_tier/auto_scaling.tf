# ---------------------------------------------------------------------------------------------------------------------
# AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration = "${aws_launch_configuration.launch_configuration.id}"
  vpc_zone_identifier  = ["${var.private_subnet_a}", "${var.private_subnet_b}"]
  min_size             = var.min_size
  max_size             = var.max_size
  load_balancers       = ["${aws_elb.elb.name}"]
  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "autoscaling_group"
    propagate_at_launch = true
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LAUNCH CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "launch_configuration" {
  image_id             = var.ami_id
  instance_type        = var.instance_size
  security_groups      = ["${var.private_sg}"]
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.id}"
  user_data = <<EOF
              #!/bin/bash
              cd /home/ec2-user/nodejs-mysql
              nodemon src/index.js
              EOF
  lifecycle {
    create_before_destroy = true
  }
}