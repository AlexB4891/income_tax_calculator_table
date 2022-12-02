# Income tax calculator table for individuals under a dependency relationship

## A project of the ERGOSTATS Statistical Research Center

### Authors:

- Alex Bajaña (alexvbr@ergostats.org)
-Carla Chamorro (carlachamorro@gmail.com)

## Categories:

- Submission type: *Single table example*

- Category: `interactive-Shiny`

- Industry: *public sector*, *tax administration*

## A bit of context

Income tax in Ecuador applies to companies and individuals. When we talk about an individual, we distinguish two main working conditions: dependency relationship (work with employment contract and benefits) and autonomous economic activity. This distinction is not only reflected in the working conditions that an individual must accept, but also in the payment mechanism of the personal income tax.

In the first case, that is to say, the individuals who work in a dependency relationship, the income tax payment mechanism can become complex and even when the documentation is extensive, confusion can be generated when making the tax return. this tax. Our application is an effort to reduce the complexity and difficulty inherent in paying this tax by using tables that are easy to understand and interpret, so that individuals can anticipate the economic burden that income tax implies.

We focus on the case that they work exclusively under **dependency relationship** since the information on income and expenses is reported by the employer, this facilitates the identification of the amounts that an individual actually receives and spends and that are registered in the public databases of Ecuador.

The payment of income tax is accompanied by deductions, exemptions, benefits and incentives that are dictated in Ecuadorian tax regulations. In this sense, our application not only allows anticipation of the amount to be paid for the tax, but also allows a holistic understanding of the tax planning tools that an individual under a dependency relationship can use in their income tax return. of natural persons.

As of 2022, Ecuadorians who are required to declare personal income tax will face a new structure for declaring this tax. If the complexity of reporting this tax already caused confusion, this upcoming fiscal period will be accompanied by uncertainty until individuals get used to this change. The application that we developed also seeks to educate individuals who work under a dependency relationship about this change, so that when filing their income tax return they not only do so as part of their tax obligations but also give their contribution to the promotion of tax culture.

## How does it work?

- The first thing you must do to make use of the application is to know your situation in the single taxpayer registry RUC. If you are not Ecuadorian and want to know what your tax burden would be if you worked in Ecuador, you can review the main concepts in the following link:

  - <https://www.sri.gob.ec/web/intersri/ruc-personas-naturales>
  
Para ingresar a la aplición tienes dos opciones:

* [Versión en español](https://datascienceinf.shinyapps.io/income_tax_calculator/?_ga=2.268723953.1064023296.1670015093-1899560843.1670015093)
* [Versión en ingles](https://datascienceinf.shinyapps.io/table_app_en/?_ga=2.268723953.1064023296.1670015093-1899560843.1670015093)

87 / 5.000
Resultados de traducción
## Technical details

- The table was developed in R 4.2.1
- We use the libraries:

```
library(shiny)
library(tidyverse)
library(gt)
library(shinyBS)
library(tippy)
library(scales)
library(readxl)
library(gtExtras)
library(shinyWidgets)

```

## Guia de usuario









