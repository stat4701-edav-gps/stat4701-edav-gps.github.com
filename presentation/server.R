library(shiny)
library(ggplot2)

#df <- read.table(file = "https://github.com/stat4701-edav-gps/stat4701-edav-gps.github.com/blob/master/data/taxi_july_boro2.tsv", sep=",", header = TRUE)
#df <- read.table(file = "c:/R/project/taxi_july_boro2.csv", sep=",", header = TRUE)

df <- read.table(file = "taxi_july_by_geoid.csv", sep=",", header = TRUE)


shinyServer(function(input, output) {

  output$plot1 <- renderPlot({

    df2 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider & df$TYPE==input$radio 
& df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] )
#& df$GEOID>=input$geoid[1] & df$GEOID<=input$geoid[2]
    
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

    df3 <- subset(df,df$BORO==input$boro & df$DIST_BLDG_HGHT<=input$Slider & df$TYPE==input$radio 
& df$DIST_ROADBED<=input$Slider2[2] & df$DIST_ROADBED>=input$Slider2[1] )
#& df$GEOID>=input$geoid[1] & df$GEOID<=input$geoid[2]
    

    p2 <- ggplot(df3, aes( x=DIST_BLDG_HGHT,y=DIST_ROADBED)) + ylab('Value') +
   xlab('Building Height') + geom_bar(stat = "identity")

    print(p2)

  })


})


#ggplot(Molten, aes(x = time, y = value, colour = variable)) + geom_line()