
server <- function(input, output) {
  
  gen_datos <- reactive({
    input$muestra
    rnorm(input$n, input$med, input$std)
  })
  
  alpha <- reactive({
    1-(1-input$a)/2
  })
    
  output$ic_media <- renderPlot({
    
    datos <- gen_datos()
    
    mx <- mean(datos) 
    sx <- var(datos)
    
    Um <- mx + qt(alpha(), input$n-1)*sqrt(sx/input$n)
    Lm <- mx - qt(alpha(), input$n-1)*sqrt(sx/input$n)
    
    barras <- round(0.05*input$n) + 10
    
    densidad <- density(datos)
    hist(datos, col = 'gray90', breaks = barras, freq = F); box()
    lines(densidad)
    abline(v = input$med, col = 'red3', lwd = 3)
    abline(v = c(Lm, Um), col = 'blue3', lwd = 3, lty = 2)
  
  })

  
}
