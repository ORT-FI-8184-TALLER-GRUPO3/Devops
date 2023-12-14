<p align = "center">
<img src = "./extras/ortLogo.jpg" width=100%>
</p>

### Facultad de ingeniería | Escuela de tecnología - DevOps 

Entregado como requisito para la obtención de la certificación en Devops.















Rafael <br>
Maximiliano<br>
Matias Techeira - 176519<br>

Tutor: Lic. Federico Barcelo




## Abstract

Se establece como objetivo primordial mejorar la agilidad en el desarrollo y la calidad del software, asegurando simultáneamente una mayor eficiencia operativa. La estrategia propuesta permitirá a la empresa mantener su competitividad en un mercado dinámico y en constante evolución.

El equipo multidisciplinario encargado de liderar la implementación de DevOps en áreas clave como desarrollo, control de calidad y operaciones, se embarcará en la exploración de estrategias avanzadas de automatización y escalabilidad en la nube. Este enfoque no solo promete acelerar la entrega de software, sino también garantizar la fiabilidad y flexibilidad necesarias para adaptarse a las cambiantes demandas del mercado.

## Presentación del cliente y la problemática

La problemática principal de esta empresa en el sector retail radica en la necesidad urgente de adaptarse constantemente y entregar eficientemente software para mantenerse competitiva en un mercado en constante cambio. La entrega de software in-house actual no cumple con los requisitos de velocidad y calidad necesarios para enfrentar los desafíos del entorno dinámico del retail.

Por parte de la directiva se propuso la implementación de un modelo DevOps como solución para acelerar el "time-to-market" y mejorar la calidad del software, aprovechando al máximo las ventajas de la nube. Esta estrategia busca no solo mejorar la agilidad en el desarrollo y la calidad del software, sino también lograr una mayor eficiencia operativa para mantener la competitividad.

## Análisis de requerimientos

## Solución planteada ante la problemática
**Puntos clave**

Desmenuzando el objetivo central planteado en el Abstract, el equipo se plantea las siguientes metas específicas:

1. Implementar la infraestructura en la plataforma de nube de AWS, utilizando para ello la herramienta Terraform (IaC).
2. Incorporar pruebas automáticas y análisis de código estático (SonarCloud).
3. Desarrollar un proceso integral de integración continua y entrega continua (CI/CD).
4. Gestionar microservicios empaquetados en contenedores, para su despliegue en un sistema de orquestación en la nube de AWS, específicamente utilizando imágenes Docker en ECS Fargate.
5. Mantener una eficiencia óptima en las prácticas de las metodologías ágiles, con el fin de ofrecer una solución que potencie tanto la calidad como la velocidad de los procesos.

## Estrategia de ramas

**Repositorios de Microservicios y la Implementación de GitFlow**

En el desarrollo de microservicios, utilizamos repositorios específicos que albergan tanto el código fuente del servicio como los archivos necesarios para el ciclo de integración continua (CI). Para gestionar eficazmente estos repositorios, implementamos la estrategia de GitFlow. Esta metodología de trabajo con Git se destaca por su riguroso control en el pasaje de cambios entre ramas, asegurando una revisión detallada y una aprobación cuidadosa en cada etapa del desarrollo.

En nuestra estructura, definimos tres ramas estables: **Dev**, **Prod** y **Test**. Cada una de estas ramas cumple un papel específico y crítico en el ciclo de vida del software. A continuación, se presenta un diagrama detallado que ilustra el flujo de trabajo que seguimos, resaltando cómo GitFlow facilita una gestión más ordenada y controlada de los cambios en nuestros repositorios de microservicios.

<p align = "center">
<img src = "./extras/gitflow.png" width=100%>
</p>

**Repositorio de DevOps y la Estrategia de Trunk Based** 

En el ámbito de DevOps, adoptamos un enfoque diferente para la gestión de nuestro repositorio, centrándonos en la estrategia de Trunk Based Development. 

Esta metodología se basa en la idea de mantener una línea principal de desarrollo actualizada, donde todos los cambios se integran de manera rápida y continua.

Esta forma de trabajar se alinea perfectamente con los principios de integración y despliegue continuos ya nos permite mantener un flujo de trabajo ágil y eficiente, acorde con los objetivos de rapidez y eficacia propios de las prácticas de DevOps.

Esto nos ayuda a garantizar una entrega continua de software de alta calidad, manteniendo un enfoque colaborativo y dinámico en la gestión. A continuación, presentamos un diagrama que ilustra este proceso con una rama efímera feature.

<p align = "center">
<img src = "./extras/trunkbased.png" width=100%>
</p>

## Estrategia para CI/CD 

**Backend**

El proceso de integración y despliegue continuo implementado en el repositorio de DevOps centraliza y estandariza el ciclo de vida del software de los microservicios del backend. Esta arquitectura de CI/CD permite a cada microservicio del backend invocar un workflow genérico, ya que su lógica es similar pero a su vez proporcionando parámetros específicos que adaptan la ejecución a sus necesidades individuales.

La utilización de un workflow genérico para el backend facilita la gestión del código y la infraestructura, permitiendo actualizaciones y mejoras centralizadas que se propagan automáticamente a todos los microservicios del backend. Los microservicios, a través de sus respectivos repositorios, hacen uso de un archivo 'caller.yml', que activa el workflow genérico. Este 'caller' es un manifiesto que, al detectar cambios en el código como nuevos 'push' o 'pull requests', envía la información relevante al workflow centralizado en DevOps.

Esta estrategia desacopla el proceso de CI/CD de los repositorios individuales de los microservicios y centraliza la lógica de integración y despliegue en un único lugar. Al proteger la lógica dentro del repositorio de DevOps, se asegura la integridad del flujo de trabajo e idealmente simplifica la gestión de los secretos y configuraciones (vale aclarar, que inicialmente no se tenía ésta estructura y se utilizaba los secretos en cada repositorio individual, al transformar y mudar el flujo de trabajo, se decidio utilizar secrets: inherit en los llamadores para pasarle dicha información al workflow reutilizable ya que no se disponía de mucho tiempo extra para ajustar, pero entendemos que para que la coherencia exista en este tipo de solución, dichos secretos se tendrían que haber mudado al repositorio de Devops por cuestiones de escalabilidad y seguridad). Además, esta abstracción permite que los equipos de desarrollo se enfoquen en el desarrollo de características y correcciones, confiando en que el proceso de CI/CD se maneja de manera consistente y segura desde un solo punto de control.

La automatización del pipeline fomenta la eficiencia y la cohesión entre los equipos, reduciendo la redundancia y los errores manuales, y promoviendo un ambiente de trabajo más ágil y enfocado en la entrega de valor continuo. Con esta implementación, se abraza el espíritu de DevOps de colaboración y mejora continua, mientras se mantiene una infraestructura robusta y adaptable a los cambios rápidos y constantes del desarrollo de software moderno.