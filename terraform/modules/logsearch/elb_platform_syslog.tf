resource "aws_elb" "platform_syslog_elb" {
  name = "${var.stack_description}-platform-syslog"
  subnets = ["${var.elb_subnets}"]
  security_groups = ["${var.bosh_security_group}"]
  idle_timeout = 3600
  internal = true

  listener {
    lb_port = 5514
    lb_protocol = "tcp"
    instance_port = 5514
    instance_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 10
    timeout = 5
    target = "TCP:5514"
    interval = 30
  }

  tags {
    Name = "${var.stack_description}-platform-syslog"
  }
}
