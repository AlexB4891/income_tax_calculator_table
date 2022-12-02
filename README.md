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
  
Acces to the app in the two versions:

* [Spanish version](https://datascienceinf.shinyapps.io/income_tax_calculator/)
* [English version](https://datascienceinf.shinyapps.io/table_app_en/)

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

The table was deployed using a HTML Quarto document.

## User's guide

First some key concepts:

1.	**Income tax in Ecuador:** Income tax is levied on income obtained by individuals, undivided estates and corporations, whether domestic or foreign. The tax year is from January 1 to December 31 (National Assembly of Ecuador, 2004; Presidency of the Republic of Ecuador, 2010).

Individuals, whether they are dependent or not, and whether or not they are obliged to keep accounting records, are obliged to file their annual income tax return.

2.	**Dependency relationship:** Article 8 of the Labor Code defines an individual contract as: "(...) an agreement by virtue of which a person undertakes to render lawful and personal services to another or others, under their dependence, for a remuneration fixed by the agreement, the law, the collective contract or custom" (National Congress, 2005).

Based on this article, the condition of a dependent relationship refers to the fact that the worker maintains a relationship of subordination to his employer and obedience to the provisions for the development of labor activities.

## How is the 2022 income tax calculated?


To calculate the income tax for each taxpayer, go to the section *Income Tax Calculation 2022*.

![image](https://user-images.githubusercontent.com/58230734/205386792-04f3a10d-fa9c-4840-acba-67822bf7f19a.png)


By clicking on the button *Enter your data* the following options are displayed:

![image](https://user-images.githubusercontent.com/58230734/205386897-65bacea0-5109-4557-923f-eba0b35d33fc.png)


Consider that the monthly salary corresponds to the liquid income minus the personal contributions to the Ecuadorian Institute of Social Security. To this value must be added other income such as: utilities, commissions, overtime or other bonuses, in case the taxpayer receives them.

![image](https://user-images.githubusercontent.com/58230734/205386950-079bd8c2-e314-456b-89d8-92c3abccfc60.png)

The following subsection indicates the number of months of work the taxpayer had.

![image](https://user-images.githubusercontent.com/58230734/205387017-f91517bb-3f78-4747-b79a-dfcbf1b33faf.png)

In the next subsection of the drop-down list, the amounts of personal expenses for each item should be included.
 
![image](https://user-images.githubusercontent.com/58230734/205387050-121e316e-508b-45c8-b432-9753be1de2a3.png)

By hovering the cursor over the name of each type of personal expense, the list of expenses that can be included for deduction is displayed. 

Once the personal income and expenses have been entered, click on the button Continue to know the amount of income tax to be paid.

## What is considered for the 2022 income tax calculation?

To arrive at the taxable base, taxpayers under a dependency relationship can deduct personal contributions to the Ecuadorian Institute of Social Security, personal expenses and exemptions for disability and senior citizens . 

In the section Inputs for the income tax calculation it is possible to visualize the personal income and expenses that the taxpayer entered. As for personal expenses, it shows how much each expense item represents in income.

Additionally, through the tax summary it is possible to know the parameters established for the bracket in which the taxpayer's taxable income falls and the share of personal expenses to which he/she is entitled.

![image](https://user-images.githubusercontent.com/58230734/205387127-af2c78a3-0a69-4705-bb07-11571b58a3c0.png)

Based on the income, personal expenses, parameters established for the bracket in which the taxable income falls and the amount of personal expenses that the taxpayer can deduct, the calculation of the income tax due is made as shown in the following table:

![image](https://user-images.githubusercontent.com/58230734/205387175-ab4ad8e6-0ef3-4dd1-b75f-2ed893b0c1bf.png)

After calculating the amount of income tax to be paid, the last column of the table indicates how much income tax represents the taxpayer's income, i.e., it is possible to know the tax burden of the taxpayer.

Next, a message appears indicating whether or not the taxpayer must pay income tax for the 2022 tax period.

It is important to know the filing dates of both the Personal Expenses Schedule and the Personal Income Tax Return, in order to avoid fines.

![image](https://user-images.githubusercontent.com/58230734/205387205-2bc9e4ad-730c-46a4-9644-b29b64119b05.png)

For further information on personal income tax, glossaries are available detailing the personal expenses that the taxpayer can deduct, conceptualizations of income and taxable income, and the income tax table used in this practical exercise.

![image](https://user-images.githubusercontent.com/58230734/205387235-3722370f-6ff6-4175-b411-c8298a8681f8.png)

Finally, there are notes specifying definitions of terms and considerations to keep in mind.

![image](https://user-images.githubusercontent.com/58230734/205387257-e04b4c9a-758e-4d55-a955-2193e99da858.png)













