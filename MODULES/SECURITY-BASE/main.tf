resource "aws_security_group" "CACI" {
  vpc_id      = var.vpc_id
  name        = "${var.project}-SG"
  
  dynamic "ingress" {
    for_each          = var.access_ports
    content {   
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      description     = "security group for private subnet servers"
      self            = true
    } 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  timeouts {
    delete = "2m"
  }

  lifecycle {
    create_before_destroy = true
  }
}


