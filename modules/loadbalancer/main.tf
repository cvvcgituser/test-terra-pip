resource "aws_lb" "external-elb" {
  name               = "${var.external-elb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.elb_sg]
  subnets            = [var.elb_subnet_1, var.elb_subnet_2]
}

resource "aws_lb_target_group" "external-elb" {
  name     = "${var.target-group_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = var.elb_instance1
  port             = 80

  depends_on = [
    var.elb_instance1,
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = var.elb_instance2
  port             = 80

  depends_on = [
    var.elb_instance2,
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
}


