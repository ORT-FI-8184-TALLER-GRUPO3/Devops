resource "aws_ecs_task_definition" "task_def_1" {
  family                   = "nombre_task_def_1"
  task_role_arn            = "arn:aws:iam::556390483751:role/LabRole"
  execution_role_arn       = "arn:aws:iam::556390483751:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "imagen_pagos",
    "image": "556390483751.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-nginx:imagen_pagos",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080,
        "protocol": "tcp"
      }
    ]
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}