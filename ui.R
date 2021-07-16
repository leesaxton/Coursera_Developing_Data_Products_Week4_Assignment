#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(flexdashboard)
# Define UI for application that calculates BMI from input height and weight
shinyUI(fluidPage(

    # Application title
    titlePanel("BMI Calculator with Yorkshire Definitions"),
    # Sidebar with a slider input for height and weight
    sidebarLayout(
        sidebarPanel(
            helpText("Please enter your weight (in kg) and height (in cm) to
                     get a calculation of how skinny or tubby you are"),
            sliderInput("slider_wt",
                        "Weight in Kg:",
                        min = 35,
                        max = 250,
                        step = 0.5,
                        value = 75),
            sliderInput("slider_ht",
                        "Height in cm:",
                        min = 100,
                        max = 250,
                        step = 1,
                        value=175)
        ),
        # Main panel displaying input values and calculated BMI along with a
        # cheeky interopretation of BMI ranges and a gauge plot of the calculated BMI
         mainPanel(
             h3("BMI Calculation"),
             h4 (""),
             h4(textOutput("selected_weight")),
             h4(textOutput("selected_height")),
             h4(textOutput("calculated_bmi")),
             h4(""),
             h3("BMI Ranges - Not necessarily a medical definition"),
             h4(""),
             h4("Less than 15 - Yer nowt but skin and bone"),
             h4("15-20 - Get some meat on yer"),
             h4("20-25 - Tha's about reet"),
             h4("25-30 - You look well"),
             h4("30-35 - Tha's got some timber on yer"),
             h4("More than 35 - I'd rather put you up for a week than a fortnight"),
             h4(""),
             gaugeOutput("gauge")

         )
    )
))




