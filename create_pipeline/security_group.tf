
resource "aws_security_group" "allow_elb" {
  name        = "allow_elb"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.web_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_elb"
  }
}

resource "aws_security_group" "allow_ecs" {
  name        = "allow_ecs"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.web_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.web_vpc.cidr_block]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_ecs"
  }
}
