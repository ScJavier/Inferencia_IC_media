library(shiny)

ui <- fluidPage(

  titlePanel('Intervalos de confianza para la distribución normal'),
  
  sidebarLayout(
    
    sidebarPanel(title = 'Caption',
      numericInput('med', 'Media', value = 10, step = 0.1),
      numericInput('std', 'Desviación estándar', value = 1, step = 0.1, min = 0.1),
      numericInput('n', 'Tamaño de muestra', value = 30, step = 1, min = 2),
      numericInput('a', 'Confianza', value = 0.95, step = 0.005, min = 0.5, max = 0.995),
      actionButton('muestra', 'Nueva muestra')
      
    ),
    
    mainPanel(
      h3('Intervalo para la media'),
      plotOutput('ic_media'),
      br()
    )
  )
)