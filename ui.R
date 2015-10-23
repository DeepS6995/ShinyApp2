library(shiny)
library(ggplot2)
data(mtcars)
attach(mtcars)

aggdata2 <-aggregate(mtcars, by=list(cyl,hp), 
                     FUN=mean, na.rm=TRUE)

shinyUI(pageWithSidebar(
        headerPanel('Guess MPG for Horse Powers in Cars'),
                sidebarPanel(
                        sliderInput(inputId = "hp",
                                    label = "Choose a HorsePower",
                                    value = 100, min = 52, max = 335)),      
                mainPanel(
                        plotOutput('plot1'),
                        
                        textOutput('text1')
                )
        ) 
)