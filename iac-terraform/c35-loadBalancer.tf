#Payments
resource "aws_lb" "payments" {
  name               = "${var.environment_prefix}-alb-payments"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.vpc-ecs-public-subnet-1.id,aws_subnet.vpc-ecs-public-subnet-2.id]
  security_groups    = [aws_security_group.ecs-vpc-sg.id]
  #depends_on = [aws_security_group.ecs-vpc-sg]
  tags = {
    Name = "${var.environment_prefix}-alb-payments"
  }
}


resource "aws_lb_listener" "payments" {
  load_balancer_arn = aws_lb.payments.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.payments.arn
  }
}


resource "aws_lb_target_group" "payments" {
  name     = "${var.environment_prefix}-alb-tg-payments"
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc-ecs.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

output "payments_service_url" {
  value = aws_lb.payments.dns_name
}

#####################################################

#shipping
resource "aws_lb" "shipping" {
  name               = "${var.environment_prefix}-alb-shipping"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.vpc-ecs-public-subnet-1.id,aws_subnet.vpc-ecs-public-subnet-2.id]
  security_groups    = [aws_security_group.ecs-vpc-sg.id]
  #depends_on = [aws_security_group.ecs-vpc-sg]
  tags = {
    Name = "${var.environment_prefix}-alb-shipping"
  }
}


resource "aws_lb_listener" "shipping" {
  load_balancer_arn = aws_lb.shipping.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shipping.arn
  }
}


resource "aws_lb_target_group" "shipping" {
  name     = "${var.environment_prefix}-alb-tg-shipping"
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc-ecs.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

output "shipping_service_url" {
  value = aws_lb.shipping.dns_name
}

#Products
resource "aws_lb" "products" {
  name               = "${var.environment_prefix}-alb-products"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.vpc-ecs-public-subnet-1.id,aws_subnet.vpc-ecs-public-subnet-2.id]
  security_groups    = [aws_security_group.ecs-vpc-sg.id]
  #depends_on = [aws_security_group.ecs-vpc-sg]
  tags = {
    Name = "${var.environment_prefix}-alb-products"
  }
}


resource "aws_lb_listener" "products" {
  load_balancer_arn = aws_lb.products.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.products.arn
  }
}


resource "aws_lb_target_group" "products" {
  name     = "${var.environment_prefix}-alb-tg-products"
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc-ecs.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

output "products_service_url" {
  value = aws_lb.products.dns_name
}


#orders
resource "aws_lb" "orders" {
  name               = "${var.environment_prefix}-alb-orders"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.vpc-ecs-public-subnet-1.id,aws_subnet.vpc-ecs-public-subnet-2.id]
  security_groups    = [aws_security_group.ecs-vpc-sg.id]
  #depends_on = [aws_security_group.ecs-vpc-sg]
  tags = {
    Name = "${var.environment_prefix}-alb-orders"
  }
}


resource "aws_lb_listener" "orders" {
  load_balancer_arn = aws_lb.orders.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.orders.arn
  }
}


resource "aws_lb_target_group" "orders" {
  name     = "${var.environment_prefix}-alb-tg-orders"
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.vpc-ecs.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

output "orders_service_url" {
  value = aws_lb.orders.dns_name
}
