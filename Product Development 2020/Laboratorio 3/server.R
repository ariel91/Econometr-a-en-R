library(shiny)
library(readr)
library(dplyr)
sales_data_sample <- read_csv("sales_data_sample.csv")

shinyServer(function(input, output, session) {
  
  observe({
    query <- parseQueryString(session$clientData$url_search)
    if (!is.null(query[['territory']])) {
      updateSliderInput(session, "territory", value = query[['territory']])
    }
  })
  
  territory <- reactive({
    sales_data_sample %>%
      filter(TERRITORY==input$territory)
  })
  
  observeEvent(territory(),{
    choices <- unique(territory()$CUSTOMERNAME)
    updateSelectInput(session, 'customername', choices = choices)
  })
  
  customer <- reactive({
    territory() %>%
      filter(CUSTOMERNAME==input$customername)
  })
  observeEvent(customer(), {
    choices <- unique(customer()$ORDERNUMBER)
    updateSelectInput(session, 'ordernumber', choices = choices)
  })
  output$data <- renderTable({
    customer() %>%
      filter(ORDERNUMBER == input$ordernumber)
  })
  
})
