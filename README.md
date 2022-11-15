# Tabla calculadora del impuesto a la renta

## Un proyecto del Centro de Investigación Estadística ERGOSTATS

### Autores:

- Alex Bajaña
- Carla Chamorro

## Un poco de contexto

El impuesto a la renta en Ecuador se aplica a empresas e individuos. Cuando hablamos de un individuo distinguimos dos principales condiciones de trabajo: relación de dependencia (trabajo con contrato laboral y prestaciones) y actividad económica autonoma. Esta distinción no solo se refleja en las condiciones laborales a las que un individuo se debe acoger sino que tambien en el mecanismo de pago del impuesto a la renta personal. 

En el primer caso, es decir los individuos que trabajan en relación de dependencia, el mecanismo de pago del impuesto a la renta puede llegar a ser complejo e incluso cuando la documentación es extensa, se pueden generar confusiones a la hora de realizar la declaración de este impuesto. Nuestra aplicación es un esfuerzo por reducir la complejidad y la dificultad inherente al pago de este impuesto empleando tablas de fácil comprensión e interpretación, de suerte que los individuos puedan anticipar la carga económica que implica el impuesto a la renta. 

Nos concentramos en el caso que trabajan de manera exclusiva bajo **relación de dependencia** dado que la información de ingresos y gastos es reportada por el empleador, esto facilita la identificación de los valores que efectivamente percibe y gasta un individuo y que están registrados en las bases de datos públicas del Ecuador. 

El pago del impuesto a la renta va acompañado de deducciones, exoneraciones, beneficios e incentivos que se dictan en las normas tributarias ecuatorianas. En ese sentido, nuestra aplicación no solo permite la anticipación al monto a pagar por el impuesto sino que permite entender de manera holistica cuales son las herramientas de planificación tributaria que un individuo bajo relación de dependencia puede hacer uso en su declaración del impuesto a la renta de personas naturales. 

A partir de 2022 los ecuatorianos que están obligados a declarar el impuesto a la renta de personas naturales se enfrentan a una nueva estructura para la declaración de este tributo. Si ya de por si la complejidad del reporte de este impuesto causaba confusión, este periodo fiscal que se avecina estará acompañado de incertidumbre hasta que los individuos se acostumbren a este cambio. La aplicación que desarrollamos busca tambien educar a los individuos que trabajan bajo relación de dependencia sobre este cambio, de suerte que a la hora de presentar su declaración de impuesto a la renta no solo lo hagan como parte de sus obligaciones tribuarias sino que tambien den su aporte a la promoción de la cultura tributarias.

## ¿Como funciona?

- Lo primero que debes hacer para hacer uso de la aplicación es conocer tu situación en el registro único de contribuyentes RUC. Si no eres ecuatoriano y quieres conocer cual sería tu carga impositiva si trabajaras en Ecuador puedes revisar los principales conceptos en el siguiente enlace:

  - <https://www.sri.gob.ec/web/intersri/ruc-personas-naturales>
  
  - Documento que explique que es la relacion de dependencia
  
  - Impuesto a la renta de personas naturales
  
  - Ingreso económico vs ingreso bruto (diferencia: concepción de la capacidad económica del invidividuo)
  
  - ¿Que es la base imponible?
  
    - Como era en 2021
    
    - Como es en 2022
  
  - Tablas de base imponible (pop up reactivo al ingreso declarado)
  
  - Gastos personales, detalles
  
  * Todo esto esta en el articulo 10 de la LORTI (una nota en la esquina de la tabla que nos permita revisar la legislación)
  
 ![](borrador_ejemplo.png)
 
- Posterior a ello deberás hacer un calculo de tus **ingresos mensuales bajo relación de dependencia** que es la suma de tus **sueldos, salarias, comisiones y otros ingresos percibidos**. En la aplicación tendrás campos para los conceptos de ingresos más importantes en Ecuador. Asi mismo es importante que conozcas de manera aproximada cuales son los gastos en los que incurristes durante el año y su detalle. 

- Navega en los menus desplegables para definir de manera aducada tu perfil de contribuyente, vas a encontrar campos relacionados a tu actividad económica, tu relación con otras fuentes de ingresos, entre otros detalles. 

- Para los calculos del impuesto a la renta hemos desarollado la libreria `ircalculatoR` la cual podras instalar de la siuiente manera:

```

library(remotes)

install_github("https://github.com/AlexB4891/ircalculatoR")

```
  Encuentra ejemplos del código sobr algunos ejemplos en el enlace:
  
  <URL de una presentación Quarto>
  

## Detalles técnicos

- La tabla fue desarrollada en R 4.2.1
- Empleamos las librerias:

```
library(tidyverse)
library(htmltools)
library(gt)
library(gtExtras)
library(rlang)
library(shiny)

```

- Submision type: *Single table example*

- Categoria: `interactive-Shiny`

- Industry: *public sector*, *tax administration*

Revisa la aplicación en el siguiente enlace:

<URL de la aplicacion/tabla>




