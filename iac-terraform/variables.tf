## defino variables
variable "app_name" {
  description = "Nombre de la app para crear un bucket"
  type        = string
  default     = "applicacion_por_defecto"
}

variable "region" {
  default = "us-east-1"
}


variable "environment_name" {
  description = "Nombre del ambiente para la aplicacion"
  type	      = string
  default     = "Desarrollo"
}

variable "environment_prefix" {
  description = "prefijo de entorno"
  type        = string
  default     = "dev"
}

variable "availability_zone_1" {
  description = "zona de disponibidad 1"
  type        = string
  default     = "us-east-1a"
}

variable "creoECRs" {
  description = "condicional para crear ECRr para cada repositorio de BE"
  type        = bool
  default     = "true"
}

#Para S3 buckets
variable "s3_bucket_postfix" {
  description = "posfijo del nombre del bucket luego del entorno"
  type        = string
  default     = "-devops-g3-frontend"
}


variable "aws_account_id" {
  description = "AWSAccountId"
  type        = string
  default     = "556390483751"
}

