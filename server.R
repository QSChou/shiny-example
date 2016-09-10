shinyServer(function(input,output) {
  y <- reactive(
     {colnum <- as.numeric(input$colnum)
      iris[,colnum]}
  )
  
  output$t1 <- renderPrint(
    names(iris)[as.numeric(input$colnum)])
  output$summary <- renderPrint({
                      summary(y())})
 
  output$dist <- renderPlot(
    {
      x <- y()
      bins <- seq(min(x),max(x),length.out = input$slider1)
      hist(x,breaks = bins,col='blue',border = 'white')
    }
  )  
}
)