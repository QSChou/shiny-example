shinyServer(function(input,output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "iris" = iris,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  output$colui <- renderUI(
    {
      if(is.null(input$dataset)) return()
      col_class <- lapply(datasetInput(), class)
      selectInput("colnum", "Choose a Column Number:", choices = names(datasetInput()[,sapply(datasetInput(),is.numeric)]))
    # selectInput("colnum", "Choose a Column Number:", choices = col_class)
      
    }
  )
  
  y <- reactive(
    {
      data <- datasetInput()
      colnum <- which(names(data) == input$colnum, arr.ind = TRUE)
      data[,colnum]}
  )
  
  output$cols <- renderPrint(
    names(datasetInput()))
  output$coln <- renderPrint(
    input$colnum)
  
  output$summary <- renderPrint({
                      summary(y())})
 
  output$dist <- renderPlot(
    {
      x <- y()
      bins <- seq(min(x),max(x),length.out = input$bining)
      hist(x,breaks = bins,col='blue',border = 'white')
    }
    )  
  }
)
