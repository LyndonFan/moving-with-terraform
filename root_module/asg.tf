resource "aws_launch_template" "placeholder_launch_template" {
  name          = "placeholder-launch-template"
  image_id      = "ami-0d750261a981f4cb8"  # Ubuntu 22.04 LTS in eu-west-2
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

# skipped since localstack only implements it in pro version
# resource "aws_autoscaling_group" "placeholder_asg" {
#   name                 = "placeholder-asg"
#   min_size             = var.num_instances
#   max_size             = var.num_instances
#   desired_capacity     = var.num_instances
#   vpc_zone_identifier  = [aws_subnet.private_subnet.id]

#   launch_template {
#     id      = aws_launch_template.placeholder_launch_template.id
#     version = "$Latest"
#   }

#   tag {
#     key                 = "Name"
#     value               = "placeholder-asg"
#     propagate_at_launch = true
#   }

#   lifecycle {
#     ignore_changes = [ min_size, max_size, desired_capacity ]
#   }
# }
