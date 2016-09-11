library(shiny)
fluidPage(
  titlePanel("iris"),
  sidebarLayout(
    sidebarPanel(
      wellPanel(
    radioButtons("dataset", "Choose a dataset:", choices = c("iris", "pressure", "cars"))),
      wellPanel(
        uiOutput("colui")
        ),
      wellPanel(
    sliderInput("bining", label = "Bining Numer", min = 0, max = 100 , value = 50))),
    mainPanel(
      verbatimTextOutput("cols")
      ,verbatimTextOutput("coln")
      ,verbatimTextOutput("summary")
      ,plotOutput("dist"))
  ))
