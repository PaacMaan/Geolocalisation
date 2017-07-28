library(shiny)
library(leaflet)

geocodeAdddress <- function(address) {
  require(RJSONIO)
  url <- "http://maps.google.com/maps/api/geocode/json?address="
  url <- URLencode(paste(url, address, "&sensor=false", sep = ""))
  url
  x <- fromJSON(url, simplify = FALSE)
  if (x$status == "OK") {
    out <- c(x$results[[1]]$geometry$location$lng,
             x$results[[1]]$geometry$location$lat)
  } else {
    out <- NA
  }
  return(out)
}

shinyServer(function(input, output) {
    # get the value of starting point 
    output$from <- renderText({ 
      paste("You have selected", input$from, " as a start point")
    })

    
    #get the value of the destination point
    output$to <- renderText({ 
      paste("and", input$to, " as a destination")
    })
    
    output$mymap <- renderLeaflet({
      leaflet() %>%
        addTiles() %>%  # Add default OpenStreetMap map tiles
        addMarkers(lng=geocodeAdddress(input$from)[1], lat=geocodeAdddress(input$from)[2], popup="your starting point") %>%
        addMarkers(lng=geocodeAdddress(input$to)[1], lat=geocodeAdddress(input$to)[2], popup="destination")
    })
    
    

})
