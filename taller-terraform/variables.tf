## defino variables
variable "app_name" {
  description = "Nombre de la app para crear un bucket"
  type        = string
  default     = "applicacion_por_defecto"
}

variable "environment_name" {
  description = "Nombre del ambiente para la aplicacion"
  type	      = string
  default     = "Desarrollo"
}
