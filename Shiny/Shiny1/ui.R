#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = c(5,30),
                        step = 1),
            selectInput("color", "choix couleur histo :",
                        choices = c("red","green","yellow"),
                        selected = "yellow"),
            dateInput(inputId = "idDate",
                      label = "date", 
                      value = "2015/05/02",
                      format = "dd/mm/yyyy", startview = "year", weekstart = 0,
                      language = "fr")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textInput(inputId = "idText", label = "Entrez le titre", value = ""),
            textOutput("Textetable"),
            dataTableOutput(outputId = "dataTable"),
            
        )
    )
)

