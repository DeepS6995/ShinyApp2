library(shiny)
library(ggplot2)
data(mtcars)
attach(mtcars)

aggdata2 <-aggregate(mtcars, by=list(cyl,hp), 
                     FUN=mean, na.rm=TRUE)
shinyServer(
        function(input, output) {
                output$plot1 <- renderPlot({
                        plot(aggdata2$hp, aggdata2$mpg, col= aggdata2$cyl,
                             xlab= "Horse Power", ylab= "Miles per Galon")
                        abline(lm(aggdata2$mpg~aggdata2$hp), col="blue", lwd=5) 
                        lines(c(input$hp, input$hp), c(0, 35),col="red",lwd=5) 
                        output$text1<- renderText({"Your MPG is the Intersection between Red and the Blue Lines"})
                         })  
                
        })
        