library(shiny)
library(readr)
library(dplyr)
sales_data_sample <- read_csv("sales_data_sample.csv")

#install.packages('rsconnect')
#library(rsconnect)
shinyUI(fluidPage(
  
  #Titulo aplicación
  titlePanel("Laboratorio 3"),
  
  #h3("Componenetes del URL"),
  #verbatimTextOutput("textoURL"),
  #h3("Variables en el url "),
  #verbatimTextOutput('textoQuery'),
  
  selectInput('territory', 'Territory', choices = unique(sales_data_sample$TERRITORY)),
  selectInput('customername', 'Customer', choices = unique(sales_data_sample$CUSTOMERNAME)),
  selectInput('ordernumber', 'Order', choices = unique(sales_data_sample$ORDERNUMBER)),
  tableOutput('data')
  
))
