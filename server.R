#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(flexdashboard)

shinyServer(function(input, output) {
    bmi <- reactive({
        ht <- (input$slider_ht)/100
        wt <- input$slider_wt
        wt/(ht*ht)
    })

    output$selected_weight <- renderText({
        paste("Your input weight was ", input$slider_wt, " Kg")
    })
    output$selected_height <- renderText({
        paste("Your input height was ", input$slider_ht, " cm")
    })
    output$calculated_bmi <- renderText({
        paste("Your calculated BMI is ", format(round(bmi(),2),nsmall=2))
    })
    output$gauge = renderGauge({
        gauge(value=format(round(bmi(),2),nsmall=2),
              min=0,
              max=50,
              sectors=gaugeSectors(warning=c(10,35),
                                   success=c(18,27),
                                   danger=c(0,50)
                                   )
              )
    })
    })

