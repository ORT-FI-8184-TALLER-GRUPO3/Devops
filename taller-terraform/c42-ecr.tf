#creo los ECR, uno por cada repositorio de backend (armados igual al nombre del repo de BE)

resource "aws_ecr_repository" "products" {
  count = var.creoECRs ? 1 : 0
  name                 = "products"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "orders-service-example" {
  count = var.creoECRs ? 1 : 0
  name                 = "orders-service-example"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "shipping" {
  count = var.creoECRs ? 1 : 0
  name                 = "shipping"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "pagos" {
  count = var.creoECRs ? 1 : 0
  name                 = "pagos"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

//for_each = toset( ["products", "orders-service-example", "shipping", "pagos"] )