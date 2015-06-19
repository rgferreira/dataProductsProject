options(rgl.useNULL=TRUE)
library(shiny)
library(shinyRGL)
shinyUI(fluidPage(
        titlePanel("Interactive 3D plot for mtcars data set"), 
        sidebarLayout(
           sidebarPanel(
                selectInput("xvar",
                            label ="Choose variable x",
                            choices = c(names(mtcars)),
                            selected = "mpg"),
                selectInput("yvar",
                            label ="Choose variable x",
                            choices = c(names(mtcars)),
                            selected = "wt"),
                selectInput("zvar",
                            label ="Choose variable x",
                            choices = c(names(mtcars)),
                            selected = "hp"),
                checkboxInput("labels",
                              label = "Show car model labels",
                              value = FALSE),
                helpText("You can rotate the 3D plot in whichever direction,",
                         " and also zoom in/out with your scrolling interface,",
                         " such as a mouse or a trackpad.")
        ),
        mainPanel(
                textOutput("xmean"), 
                textOutput("ymean"),
                textOutput("zmean"), br(),
                webGLOutput('My3DPlot') ,
                tabsetPanel(
                        tabPanel(p(icon("line-chart"), "Documentation"),
                                   htmlOutput("Documentation")
                                 )
                )
        )
        )
)
)


