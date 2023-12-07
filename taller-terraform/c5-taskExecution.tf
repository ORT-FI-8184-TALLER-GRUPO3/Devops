/*
data "aws_ecs_task_execution" "example" {
  cluster         = aws_ecs_cluster.ecs_cluster_dev.id
  task_definition = aws_ecs_task_definition.task_def_1.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = aws_subnet.vpc-dev-public-subnet-1[*].id
    security_groups  = [aws_security_group.dev-vpc-sg.id]
    assign_public_ip = true
  }
}
*/

resource "aws_ecs_service" "pruebaServicio" {
  name            = "ServicioPagos"
  cluster         = aws_ecs_cluster.ecs_cluster_dev.id
  #aws-ecr-nginx-ecs-fargate-td
  #task_definition = "arn:aws:ecs:us-east-1:556390483751:task-definition/aws-ecr-nginx-ecs-fargate-td:1"
  
  #servicio pagos
  task_definition = aws_ecs_task_definition.task_def_1.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  #iam_role        = "arn:aws:iam::556390483751:role/LabRole"
  #depends_on      = [aws_iam_role_policy.foo]

/*
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
*/
/*
  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }
*/
  network_configuration {
    subnets          = aws_subnet.vpc-dev-public-subnet-1[*].id
    security_groups  = [aws_security_group.dev-vpc-sg.id]
    assign_public_ip = true
  }
  /*
  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
  */
}