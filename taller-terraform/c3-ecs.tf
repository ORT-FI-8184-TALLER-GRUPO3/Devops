#creo cluster ecs

resource "aws_ecs_cluster" "ecs_cluster_dev" {
  name = "terraform_ecs_cluster"
}
