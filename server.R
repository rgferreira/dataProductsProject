options(rgl.useNULL=TRUE)
library(UsingR)
library(rgl)
library(devtools)
library(shiny)
library(shinyRGL)
data(mtcars)
shinyServer(
        function(input, output, session) {
                x <- reactive({as.numeric(input$text1)+100})
                output$text1 <- renderText({x()                   })
                output$text2 <- renderText({x() + as.numeric(input$text2)})
                output$xmean <- renderText({paste(input$xvar, " mean: ",
                                                  mean(mtcars[ ,input$xvar]))})
                output$ymean <- renderText({paste(input$yvar, " mean: ",
                                                  mean(mtcars[ ,input$yvar]))})
                output$zmean <- renderText({paste(input$zvar, " mean: ",
                                                  mean(mtcars[ ,input$zvar]))})
                output$My3DPlot <- renderWebGL({
                        #output$names <- names(mtcars)
                        xvar <- input$xvar
                        yvar <- input$yvar
                        zvar <- input$zvar
                        points3d(mtcars[ , xvar],
                                 mtcars[ , yvar],
                                 mtcars[ , zvar],
                                 col = "blue", radius = 6, lwd=0, top=T)
                        axes3d()
                        #mean point
                        points3d(mean(mtcars[ , xvar]),
                                 mean(mtcars[ , yvar]),
                                 mean(mtcars[ , zvar]),
                                 col = "dark green", radius = 12, lwd=0, top=T)
                        text3d(mean(mtcars[ , xvar]),
                               mean(mtcars[ , yvar]),
                               mean(mtcars[ , zvar]),
                               c("mean","mean", "mean"),
                                 cex = 0.5, adj = 0.5, col="dark green")
                        
                        title3d("Drag to orbit. Scroll to zoom!", ,
                                xvar, yvar, zvar, col="red")
                        aspect3d(1,1,1)
                        if(input$labels==TRUE){
                        text3d(mtcars[ , xvar],
                                mtcars[ , yvar],
                                mtcars[ , zvar],
                                c(rownames(mtcars),
                                rownames(mtcars),
                                rownames(mtcars)), cex = 0.5, adj = 0.5)
                        } else {
                        
                        }
                })
        }
)
