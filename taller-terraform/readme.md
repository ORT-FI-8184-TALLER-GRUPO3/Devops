Instrucciones para utilizar terraform

Precondiciones: 
    Se deben tener creados el s3 bucket y la dinamodb en la cuenta.
    Los datos de los nombres está en el archivo c1-versions.tf
    sino la otra opcion es comentar el bloque de # Adding Backend as S3 for Remote State Storage
Yo hice esto:
        cree el bucket s3 para guardar el estado con el nombre rafa-terraform-devopslab (lo deje publico el tema es que tiene que ser unico, usar otro nombre) 
		
		Fui a dynamoDB y cree la tabla terraform-dev-state-table con atributo LockID (por lo que vi en: https://quileswest.medium.com/how-to-lock-terraform-state-with-s3-bucket-in-dynamodb-3ba7c4e637)
		



La primera vez que se use:
terraform init
./crear_workspaces.sh

luego de que eso esta hecho se pueuden usar los siguientes scrips:
crear_dev.sh --> crea unicamente el ambiente de desarrollo
destroy_dev-sh --> destruye unicamente el ambiente de desarrollo
crear_todos_ambientes.sh --> crea todos los ambientes
destroy_todos_ambientes.sh --> destruye todos los ambientes

Problemas conocidos:
A veces puede pasar que se rompe el lock que utiliza para el acceso al State en AWS cuando pase eso va a dar un mensaje como este:

Error: Error acquiring the state lock
│ 
│ Error message: operation error DynamoDB: PutItem, https response error StatusCode: 400, RequestID: I8J63JTPHK6CK07IIENI9F32QVVV4KQNSO5AEMVJF66Q9ASUAAJG,
│ ConditionalCheckFailedException: The conditional request failed
│ Lock Info:
│   ID:        764912c6-46f9-10f4-bf8b-d5521ec7d7da
│   Path:      rafa-terraform-devopslab/dev2/terraform.tfstate
│   Operation: OperationTypeApply
│   Who:       root@192.168.2.144
│   Version:   1.6.3
│   Created:   2023-12-02 00:12:53.971687581 +0000 UTC
│   Info:      

Para romper el candado hacer lo siguiente referenciando el ID del mensaje, en este ejemplo sería:
terraform force-unlock 764912c6-46f9-10f4-bf8b-d5521ec7d7da