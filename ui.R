####  App 5 ### 
# Christophe Bontemps (2021) 

# This is is the user-interface definition of a Shiny web application. 
# You can run the application by clicking 'Run App' above.
#
# Activity: 
# 1- Run this app (and compare with your solution)
# 2- Congratulations !!! 
# NB: plottly may reqire an internet connection


library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        # Application title
        titlePanel("A basic interactive application for data exploration "),
        # Creating a sidebar
        sidebarLayout(
          # Sidebar layout with my 2 component
          sidebarPanel(
            selectInput(
              inputId = "var",
              label = "Variable", 
              choices = c("Income",  "Population", "CO2") # CO2 can be removed from the list 
            ),
            selectInput(
              inputId = "region",
              label = "Region", 
              choices = c("Asia", "Europe", "Africa", "Americas", "Select..."),
              selected = "Select..."), 
      
            sliderInput(
              inputId = "StartYear", 
              label = "Choose the starting year", 
              min = 1990, 
              max = 2018, 
              value = 1990, 
              sep = "",  # does remove the comma in the slider ;-)
              animate = TRUE # to add a "play" button..
            ),
            sliderInput("A", 
                        "Transparancy level", 
                        value = 1,  
                        min = 0, 
                        max = 1,
                        step = 0.01),
          ), # End of sidebar layout
        # Show a plot of the generated distribution
    
        mainPanel(
            h3(textOutput("myTitle")),  # html (h3 level) dysplay
            plotlyOutput("myHist")
        )
    )
))
