# ui.R


shinyUI(fluidPage(
  titlePanel("Select Values"),
  
  fluidRow(
    column(3,
      selectInput("boro", label = h3("Select Borough"), 
        choices = list("Manhattan" = "Manahattan", "Bronx" = "Bronx",
                       "Brooklyn" = "Brooklyn", "Queens" = "Queens", "Staten Island" = "Staten Island" ), selected = "Manhattan"))
  ,column(3,
      radioButtons("radio", label = h3("Check Value"),
        choices = list("Pickup" = "p", 
           "Drop-off" = "d",
           "Both" = "b"),
        selected = "d"))
,    column(3, 
      sliderInput("Slider", label = h3("Building Height"),
        min = 0, max = 500, value = c(0,50))
      )  
,    column(3, 
      sliderInput("Slider2", label = h3("Distance from Road Bed"),
                   min = 0, max = 500, value = c(0,50) 
                 )
      )  )
,
 
mainPanel(
   p("Bld Ht vs Road Bed Distance"),
   plotOutput('plot1'),
p("Road Bed Distance/Building Height <1")
  ,plotOutput('plot2')
  ,plotOutput('plot3')
  ,plotOutput('plot4')

  )

))
