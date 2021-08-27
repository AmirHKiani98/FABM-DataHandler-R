#' Opening the map for graphically accesses
#' @param data The data which contains line of information
openMap <- function(data) {
  i <- 1


  ui <- bootstrapPage (
    # theme = my_theme,
    includeCSS("www/styles.css"),
    #includeCSS("www/bootstrap/bootstrap.min.css"),
    includeScript("www/main.js"),
    leafletOutput("leaflet_map", width = "100%", height = "100%"),
    absolutePanel(
      left = 10,
      top = 10,
      selectInput(
        "agent_shape_select",
        "Agent Shape",
        c("Circle" = "crc",
          "Square" = "sqr")
      ),
      textInput("agent_name", "Agent Name"),
      shiny::tags$div(
        class = "coordinates_main_container",
        shiny::tags$div(
          class = "coordinates_container",
          textOutput("lat") %>% tagAppendAttributes(class = "m-3 p-3")
        ),
        shiny::tags$div(
          class = "coordinates_container",
          textOutput("lng") %>% tagAppendAttributes(class = "m-3 p-3")
        )
      ),
      shiny::tags$div(
        class = "d-flex flex-column align-items-center",
        actionButton(inputId = "add_agent_button", "Add Agent", class = "btn btn-custom m-3 w-50"),
        actionButton(inputId = "go_to_mark_button", "Add Agent", class = "btn btn-custom m-3 w-50"),
      ),
      textOutput("check")
    )
  )
  circle <-
    system.file("extdata", "circle.png", package = "FABDataHandler")
  squre <-
    system.file("extdata", "square.png", package = "FABDataHandler")


  diamond <-
    system.file("extdata", "diamond.png", package = "FABDataHandler")
  circle_icon <- makeIcon(
    iconUrl = circle,
    iconWidth = 35,
    iconHeight = 35,
    iconAnchorX = 0,
    iconAnchorY = 0,
  )

  server <- function(input, output, session) {

    output$leaflet_map <- renderLeaflet({
      map <- leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
        addProviderTiles(providers$OpenStreetMap,
                         options = providerTileOptions(noWrap = TRUE)) %>%
        setView(53, 32, zoom = 5) %>%
        clearControls()

      for(line in data){
        coordinates <- extractCoordinatesByLine(line)
        newLat <- as.double(coordinates$lat)
        newLng <- as.double(coordinates$lng)
        print(newLat)
        leafletProxy("leaflet_map") %>% addMarkers(
          lng = newLng,
          lat = newLat,
          layerId = as.character(i),
          # popup = sprintf(
          #   "<p class='popup-p'>I wanna know you more</p><a class='delete-markdown' data-target-id='%s'>Delete Me<a>",
          #   as.character(i)
          # )
        )
        i <<- i+1
      }
      return(map)

    })
    observeEvent(input$leaflet_map_click, {
      click <- input$leaflet_map_click # typo was on this line
      if (is.null(click)) {
        return()
      } else {
        leafletProxy("leaflet_map") %>%
          #clearMarkers() %>%
          addMarkers(
            lng = click$lng,
            lat = click$lat,
            icon = circle_icon,
            layerId = as.character(i),
            # popup = sprintf(
            #   "<p class='popup-p'>I wanna know you more</p><a class='delete-markdown' data-target-id='%s'>Delete Me<a>",
            #   as.character(i)
            # )
          )
        leafletProxy("leaflet_map")
        i <<- i + 1
      }
      output$check <- renderText({
        return(input$time1)
      })
      # Lang and Lat
      output$lat <- renderText({
        return(round(click$lat, 2))
      })
      output$lng <- renderText({
        return(round(click$lng, 2))
      })
    })
    observeEvent(input$leaflet_map_marker_click, {
      if(is.null(input$leaflet_map_marker_click)){
        return()
      }else{
        leafletProxy("leaflet_map") %>% removeMarker(input$leaflet_map_marker_click$id)
      }
    })
    output$lng <- renderText({
      0
    })
    output$lat <- renderText({
      0
    })

  }
  shinyApp(ui, server)
}
