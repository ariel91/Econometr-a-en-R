#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$var1 <- renderPrint({
    input$bins
  })
  
  output$var2 <- renderPrint({
    input$range
  })
  
  output$var3 <- renderPrint({
    input$variable
  })
  
  output$var4 <- renderPrint({
    input$select_input_2
  })
  
  output$var5 <- renderPrint({
    input$date1
  })
  
  output$var6 <- renderPrint({
    
    fecha <- paste(input$dateRange2[1]," to  ",input$dateRange2[2])
    fecha
    
  })
  
  output$var7 <- renderText({ input$obs })
  
  output$var8<- renderText({
    input$txt
  })
  output$var9 <- renderText({
    input$caption
  })
  output$var10 <- renderText({
    input$action
  })
  output$var11 <- renderText({
    input$infoLink
  })
  
  
  
  
  
    
})