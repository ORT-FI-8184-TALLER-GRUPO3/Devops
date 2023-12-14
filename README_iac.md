# Arquitectura de la Solución

Se elgió una solución desplegada en la nube que permite satisfacer los requerimeintos planteados, y para este caso se eligió la nube AWS dabido a que es una de las tres más importantes y que los integrantes del equipo estaban familiarizados con la misma. En particular se decidió utilizar un modelo de servicio PaaS para acelerar el despliegue de la infraestructura así como también traspasar al proveedor de nube parte de la carga administrativa asociado.
La implementación en AWS fue realizada mediante el servicio ECS (Elastic Containter Service) con lanzamiento utilizando la modalidad FARGATE (Serverless).
Se generaron 3 ambientes distintos (desarrolo, testing y produccion)
A continuación se muestra un diagrama que muestra el despliegue de cada uno de los microservicios de Back-end por cada ambiente.

<p align = "center">
<img src = "./extras/Arquitectura_deploy_aws_ms.svg" width=100%>
</p>

Los componentes son los siguientes:
Se generó una VPC en la region us-east-1 por cada ambiente con dos subredes públicas en distintas areas de disponibilidad (us-east-1a y us-east-1b). Estos recursos son compartidos por todos los contenedores de backend en cada ambiente.
La salida a internet desde la VPC se realiza con un Internet Gateway en conjunto con una tabla de ruteo. Para cada ambiente se generó un Cluster de ECS y luego para cada microservicio desplegado se genera un Application Load Balancer que permite balancear la carga entre las dos subredes, así como también proveer de una ip pública para el acceso desde internet. La cantidad de instancias de contenedor desplegadas se puede especificar por ambiente y se seteo inicialmente en 2 para el ambiente de producción, donde tiene sentido aplicar el balanceo de carga y se asegura una alta disponibilidad y en 1 para los ambientes de desarrollo y testing. Si bien no tiene mucho sentido aplicar el balanceador de carga hacia una unica instancia de todos modos es util por la utilización de las ip públicas para resolver la dependencia del MS de orders.
Como elemento complementario para el despliegue dentro de la nube y de interacción con pipelines de CI/CD se generaron los recursos de ECR (Elastic Container Registry) y se optó por utilizar uno por cada servicio. Esto permite mantener una independencia entre MS y facilita la utlización de tags para las imagenes subidas a los mismos. En cada uno de estos registros se va a utilizar un tag por cada ambiente y quedan representados de esta manera en la infraestructura:

<p align = "center">
<img src = "./extras/ECRporMS.svg" width=100%>
</p>

Por último también se generaró la infraestructura para desplegar el frontend para lo cual se utilizó un S3 Bucket por ambiente. La elección se debe a que el contenido a desplegar es estático y utilizar un S3 Bucket público es una manera economica de permitir su consumo y evitar soluciones más complejas como levantar una instancia de EC2 con un webserver o algún contenedor en ECS, y de alguna manera también trasferir el costo adminsitrativo de mantener el contenido en linea.  
 
Para el aprovisionamiento de la infraestructura se utilizó la aplicación de Infraestructura como Código (IaC) Terraform. Se opto por la utilización del almacenamiento del estado en un bucket de S3 y proteger en caso de concurrencia con una tabla de DynamoDB.
Debido a que se deben genear 3 ambientes similares y por simplicidad se utilizó la alternativa de generar archivos .tfvar por cada ambiente. Debido a que para generar la infraestructura para cada ambiente es necesario cambiar de workspace y utilizar el archivo .tfvar correspodiente se generaron archivos .sh muy simples para facilitar el uso así como evitar posibles errores a la hora de modificar cada ambiente.
Por ejemplo para generar el ambiente de desarrollo se utiliza ./crear_dev.sh que tiene el siguente código:

    terraform workspace select dev
    terraform apply -var-file="dev.tfvars" -auto-approve

El archivo destroy_dev.sh es análogo utlizando la el comando terraform destroy en vez del apply. El poder generar de a un ambiente facilitaba la prueba de generación de infraestructura por ejemplo en el ambiente de desarrollo y cuando se estabilizaba se pasaba al resto de los ambientes.
Tambipen hay una variante de estos archvios que sirven para crear y destruir todos los ambientes corriendo de manera secuencial los comandos para cada ambiente.
A modo de ejemplo se muestra el archivo prod.tfvars:

    environment_name = "Produccion"
    environment_prefix = "prod"
    availability_zone_1 = "us-east-1a"
    availability_zone_2 = "us-east-1b"
    creoECRs = "false"
    s3_bucket_postfix = "-s3grp3-webapp"
    be_desired_count = 2
    be_cpu = "256"
    be_memory = "512"

Solamente vale comentar algunas de estas variables, por ejemplo "creoECRs" que solamente se encuentra en true para el ambiente de desarrollo ya que los ECR se utilizan para todos los ambientes. Luego las variables be_cpu y be_memory asociados a la utiliacipon de los recursos de cpu y memoria para los contenedores de backend y el be_desired_count para la cantidad de instancias de contenedor levantadas de forma concurrente para cada MS.
Los archivos de iac se encuentran dentro de un único directorio llamado iac-terraform dentro del repositorio Devops

