####  App 5 ### 
# Christophe Bontemps (2021) 

# This is the server logic of a Shiny web application. 
# You can run the application by clicking 'Run App' above.
#
# Activity: 
# 1- Run this app (and compare with your solution)
# 2- Congratulations! 
# NB: plottly may reqire an internet connection

library(shiny)
library(ggplot2)
library(tidyverse)
library(plotly)

MyData <- read.csv(file = "M6-IncomeCO2-Data.csv")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$myHist <- renderPlotly({
      p <- MyData %>% 
            filter(
              year >= input$StartYear) %>%
          ggplot() +
          aes_string( x= input$var, y= "CO2")+
          geom_point(colour = "#057AA6",
                     alpha = input$A)+
          geom_point(dat= subset(MyData,Region ==input$region), 
                     alpha=input$A,
                     color="pink") +
          ggtitle( " ") +
          theme_minimal()
      
      ggplotly(p)
      

    })

    output$myTitle <- renderText({
      paste("Years >", input$StartYear, " with x = ", input$var, " and y = CO2" )
      
    })
})
