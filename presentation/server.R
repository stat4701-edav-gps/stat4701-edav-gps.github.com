library(shiny)
library(ggplot2)

#df <- read.table(file = "https://github.com/stat4701-edav-gps/stat4701-edav-gps.github.com/blob/master/data/taxi_july_boro2.tsv", sep=",", header = TRUE)
#df <- read.table(file = "c:/R/project/taxi_july_boro2.csv", sep=",", header = TRUE)

df <- read.table(file = "taxi_july_by_geoid.csv", sep=",", header = TRUE)
 

shinyServer(function(input, output) {


  output$plot1 <- renderPlot({

  if(input$radio=='b'){
      df2 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] & df$DIST_BLDG_HGHT>=input$Slider[1]
                    & df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] )
   } else {
    df2 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] 
           & df$DIST_BLDG_HGHT>=input$Slider[1] & df$TYPE==input$radio & df$DIST_ROADBED<=input$Slider2[2] 
           & df$DIST_ROADBED>=input$Slider2[1] )
   }
 
    
    #df2 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT==input$Slider )
    p <- ggplot(df2)+
    geom_point(aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED),colour = 'blue', size = 2)

#    p <- ggplot(df2)+
#    geom_point(aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED),colour = 'blue', size = 2) 

    p <- ggplot(df2, aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED)) + geom_line() + ylab('Distance from Road Bed') +
   xlab('Building Height')
    #geom_point(aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED),colour = 'blue', size = 2) 

    print(p)

  })

output$plot2 <- renderPlot({

if(input$radio=='b'){
      df3 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] & df$DIST_BLDG_HGHT>=input$Slider[1]
                    & df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] & df$DIST_ROADBED/df$DIST_BLDG_HGHT <1 )
   } else {
    df3 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] 
           & df$DIST_BLDG_HGHT>=input$Slider[1] & df$TYPE==input$radio & df$DIST_ROADBED<=input$Slider2[2] 
           & df$DIST_ROADBED>=input$Slider2[1] & df$DIST_ROADBED/df$DIST_BLDG_HGHT <1 )
   }
    

    p2 <- ggplot(df3, aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED)) + geom_line() + ylab('Distance from Road Bed') +
   xlab('Building Height')
    
    print(p2)

  })

output$plot3 <- renderPlot({

  if(input$radio=='b'){
      df4 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] & df$DIST_BLDG_HGHT>=input$Slider[1]
                    & df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] )
   } else {
    df4 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] 
           & df$DIST_BLDG_HGHT>=input$Slider[1] & df$TYPE==input$radio & df$DIST_ROADBED<=input$Slider2[2] 
           & df$DIST_ROADBED>=input$Slider2[1] )
   }
 
    

 p3 <- ggplot(df4, aes( x=DIST_BLDG_HGHT))  + geom_histogram(breaks=seq(input$Slider[1], input$Slider[2], by = 5), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + ylab('Count') +
   xlab('Building Height')

    print(p3)
  })


output$plot4 <- renderPlot({

  if(input$radio=='b'){
      df5 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] & df$DIST_BLDG_HGHT>=input$Slider[1]
                    & df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] )
   } else {
    df5 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider[2] 
           & df$DIST_BLDG_HGHT>=input$Slider[1] & df$TYPE==input$radio & df$DIST_ROADBED<=input$Slider2[2] 
           & df$DIST_ROADBED>=input$Slider2[1] )
   }
    

 p4 <- ggplot(df5, aes( x=DIST_ROADBED))  + geom_histogram(breaks=seq(input$Slider2[1], input$Slider2[2], by = 5), 
                 col="red", 
                 fill="blue", 
                 alpha = .2) + ylab('Count') +
   xlab('Distance from Road Bed')

    print(p4)
  })

})


#ggplot(Molten, aes(x = time, y = value, colour = variable)) + geom_line()