# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(leaflet)

shinyUI(fluidPage(

  # Application title
  titlePanel("TP Geolocalisation"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput('from', 'Choose starting point', "Casablanca",placeholder = "example : Casablanca"),
      textInput('to', 'Choose destination', "berlin",placeholder = "example : laayoune"),
      submitButton(text = "search", icon = icon("search"), width = NULL)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("from"),
      textOutput("to"),
      textOutput("cords"),
      leafletOutput("mymap")
    )
  )
))
