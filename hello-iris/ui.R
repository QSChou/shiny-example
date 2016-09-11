library(shiny)
fluidPage(
  titlePanel("iris"),
  sidebarLayout(
    sidebarPanel(
      wellPanel(
    radioButtons("dataset", "Choose a dataset:", choices = c("iris", "pressure", "cars"))),
      wellPanel(
    #selectInput("colnum", "Choose a Column Number:", choices = c(1,2,3,4))
        uiOutput("colui")
        ),
      wellPanel(
    sliderInput("bining", label = "Bining Numer", min = 0, max = 100 , value = 50))),
    #wellPanel(
    #  selectInput("colnum", "Choose a Column Number:", choices = c("cols"))),
    mainPanel(
      verbatimTextOutput("cols")
      ,verbatimTextOutput("coln")
      ,verbatimTextOutput("summary")
      ,plotOutput("dist"))
  ))
