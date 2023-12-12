#creo cluster ecs

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment_prefix}_ecs_cluster"
}
