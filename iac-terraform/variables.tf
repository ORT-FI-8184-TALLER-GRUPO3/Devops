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

variable "availability_zone_2" {
  description = "zona de disponibidad 2"
  type        = string
  default     = "us-east-1b"
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

variable "be_desired_count" {
  description = "Desired count de servicio de Back-End"
  type        = number
  default     = 1
}

variable "be_cpu" {
  description = "CPU asignado al servicio de Back-End"
  type        = string
  default     = "256"
}

variable "be_memory" {
  description = "CPU asignado al servicio de Back-End"
  type        = string
  default     = "512"
}
