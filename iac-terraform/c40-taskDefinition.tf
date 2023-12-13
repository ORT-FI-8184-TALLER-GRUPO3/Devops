resource "aws_ecs_task_definition" "payments-task-def" {
  family                   = "payments-task-def"
  task_role_arn            = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  #task_role_arn            = data.lab_user.arn
  execution_role_arn       = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "payments-service",
    "image": "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/ecr-payments-service:payments-service-dev",
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


resource "aws_ecs_task_definition" "shipping-task-def" {
  family                   = "shipping-task-def"
  task_role_arn            = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  #task_role_arn            = data.lab_user.arn
  execution_role_arn       = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "shipping-service",
    "image": "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/ecr-shipping-service:shipping-service-dev",
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


resource "aws_ecs_task_definition" "products-task-def" {
  family                   = "products-task-def"
  task_role_arn            = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  #task_role_arn            = data.lab_user.arn
  execution_role_arn       = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "products-service",
    "image": "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/ecr-products-service:products-service-dev",
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

#Microservicio Orders debe levantarse despues de tener disponibles las URL de sus dependencias
resource "aws_ecs_task_definition" "orders-task-def" {
   depends_on = [aws_lb.payments, aws_lb.shipping, aws_lb.products]
  family                   = "orders-task-def"
  task_role_arn            = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  #task_role_arn            = data.lab_user.arn
  execution_role_arn       = "arn:aws:iam::${var.aws_account_id}:role/LabRole"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "orders-service",
    "image": "${var.aws_account_id}.dkr.ecr.us-east-1.amazonaws.com/ecr-orders-service:orders-service-dev",
    "essential": true,
    "environment" : [
        { "name": "APP_ARGS", "value": "http://${aws_lb.payments.dns_name} http://${aws_lb.shipping.dns_name} http://${aws_lb.products.dns_name}" }
    ],
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
