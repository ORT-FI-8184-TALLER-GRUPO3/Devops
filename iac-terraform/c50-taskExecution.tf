resource "aws_ecs_service" "payments-service" {
  name            = "payments-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.payments-task-def.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  network_configuration {
    subnets          = aws_subnet.vpc-ecs-public-subnet-1[*].id
    security_groups  = [aws_security_group.ecs-vpc-sg.id]
    assign_public_ip = true
  }
}

resource "aws_ecs_service" "shipping-service" {
  name            = "shipping-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.shipping-task-def.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  network_configuration {
    subnets          = aws_subnet.vpc-ecs-public-subnet-1[*].id
    security_groups  = [aws_security_group.ecs-vpc-sg.id]
    assign_public_ip = true
  }
}
resource "aws_ecs_service" "orders-service" {
  name            = "orders-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.orders-task-def.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  network_configuration {
    subnets          = aws_subnet.vpc-ecs-public-subnet-1[*].id
    security_groups  = [aws_security_group.ecs-vpc-sg.id]
    assign_public_ip = true
  }
}
resource "aws_ecs_service" "products-service" {
  name            = "products-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.products-task-def.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  network_configuration {
    subnets          = aws_subnet.vpc-ecs-public-subnet-1[*].id
    security_groups  = [aws_security_group.ecs-vpc-sg.id]
    assign_public_ip = true
  }
}