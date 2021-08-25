server <-
function(input, output, session) {
  output$leaflet_map <- renderLeaflet({
    leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
      addProviderTiles(providers$Stamen.Toner,
        options = providerTileOptions(noWrap = TRUE)
      ) %>%
      setView(53, 32, zoom = 5) %>%
      clearControls()
  })
  observe({
    click <- input$leaflet_map_click # typo was on this line
    if (is.null(click)) {
      return()
    } else {
      leafletProxy("leaflet_map") %>%
        clearMarkers() %>%
        addMarkers(
          lng = click$lng,
          lat = click$lat,
          icon = circle_icon,
          popup = "<p class='popup-p'>I wanna know you more</p>"
        )
      leafletProxy("leaflet_map") %>% setView(
        lng = click$lng,
        lat = click$lat,
        zoom = input$leaflet_map_zoom
      )
      print(input$leaflet_map_zoom)
    }
    output$check <- renderText({
      return(input$time1)
    })
    # Lang and Lat
    output$lat <- renderText({
      return(click$lat)
    })
    output$lng <- renderText({
      return(click$lng)
    })
  })
}
