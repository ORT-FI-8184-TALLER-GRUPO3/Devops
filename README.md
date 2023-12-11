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

