library(shiny)
fluidPage(
  titlePanel("iris"),
  sidebarLayout(
    sidebarPanel(
    radioButtons("radio1", label = "Choices", choices = list(1,2,3,4)),
    selectInput("colnum", "Choose a Column Number:", choices = c(1,2,3,4)),
    sliderInput("slider1", label = "Slider", min = 0, max = 100 , value = 50)),
    mainPanel(
      verbatimTextOutput("t1")
      ,verbatimTextOutput("summary")
      ,plotOutput("dist")
      ))
)