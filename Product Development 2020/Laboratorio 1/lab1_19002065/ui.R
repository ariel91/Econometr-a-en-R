#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    
    
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      ,
      # Specification of range within an interval
      sliderInput("range", "Range:",
                  min = 1, max = 1000, value = c(200,500)),
      
      selectInput("variable", "Variable:",
                  c("Curso 1",
                    "Curso 2" ,
                    "Curso 3" ))
      
      ,
      
      selectizeInput('select_input_2',"seleccione carros:",
                     choices = rownames(mtcars),
                     selected = "Camaro Z28",
                     multiple = TRUE),
      
      dateInput("date1", "Date:", value = "2012-02-29"),
      
      dateRangeInput('dateRange2',
                     label = paste('Date range input 2: range is limited,',
                                   'dd/mm/yy, language: fr, week starts on day 1 (Monday),',
                                   'separator is "-", start view is year'),
                     start = Sys.Date() - 3, end = Sys.Date() + 3,
                     min = Sys.Date() - 10, max = Sys.Date() + 10,
                     separator = " - ", format = "dd/mm/yy",
                     startview = 'year', language = 'fr', weekstart = 1
      )
      ,
      
      numericInput("obs", "Observations:", 10, min = 1, max = 100),
      
      checkboxGroupInput("icons", "Choose icons:",
                         choiceNames =
                           list(icon("calendar"), icon("bed"),
                                icon("cog"), icon("bug")),
                         choiceValues =
                           list("calendar", "bed", "cog", "bug")
      ),
      
      radioButtons("rb", "Choose one:",
                   choiceNames = list(
                     icon("calendar"),
                     HTML("<p style='color:red;'>Red Text</p>"),
                     "Normal text"
                   ),
                   choiceValues = list(
                     "icon", "html", "text"
                   )),
      
      
      textInput("txt", "Text input:", "text here"),
      

      
      textAreaInput("caption", "Caption", "Data Summary"),
      
      actionButton("action", "Button"),
      actionLink("infoLink", "Information Link", class = "btn-info")
      
      
      #submitButton(text = "reprocesar")
      
      
      
    )
    
    ,
    # Show a plot of the generated distribution
    mainPanel(
      h1("Input:"),
      verbatimTextOutput("var1"),
      h1("Rango:"),
      verbatimTextOutput("var2"),
      h1("Variable"),
      verbatimTextOutput("var3"),
      h1("Seleccion multiple de entrada"),
      verbatimTextOutput("var4"),
      h1("Fecha"),
      verbatimTextOutput("var5"),
      h1("Rango de Fecha"),
      verbatimTextOutput("var6"),
      h1("Numeric Input"),
      verbatimTextOutput("var7"),
###########################################################################################
      h2("Texto"),
      verbatimTextOutput("var8"),
      h2("Parrafo"),
      verbatimTextOutput("var9"),
      h2("Action button"),
      verbatimTextOutput("var10"),
      h2("Action link"),
      verbatimTextOutput("var11")
      
    
    )
    
    
  )
  
  
  
  
))
