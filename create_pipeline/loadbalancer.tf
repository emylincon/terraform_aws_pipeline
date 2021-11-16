
resource "aws_lb" "loadbalancer" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_elb.id]
  subnets            = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id] #["subnet-78ab3600", "subnet-2bea5461", "subnet-facca0a7"] #[for s in data.aws_subnet.example : s.cidr_block]

  enable_deletion_protection = false

  tags = {
    Environment = var.env
  }
}

resource "aws_lb_target_group" "lb_target" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.web_vpc.id #var.vpc_default_id # # aws_vpc.web_vpc.id

  depends_on = [
    aws_lb.loadbalancer
  ]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target.arn
  }
}


resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.web_vpc.id #aws_vpc.web_vpc.id # #var.vpc_default_id

  ingress = [
    {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = "HTTP to VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name = "allow_http"
  }
}
