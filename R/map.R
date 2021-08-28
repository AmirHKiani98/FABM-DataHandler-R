#' Opening the map for graphically accesses
#' @param data The data which contains line of information
openMap <- function(data) {
  i <- 1

  ###### UI ######
  ui <- bootstrapPage (
    #theme = my_theme,
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
      selectInput(
        "agent_color",
        "Agent Color",
        c(
          "Blue" = "blue",
          "Gold" = "sqr",
          "Red" = "red",
          "Green" = "green",
          "Orange" = "orange",
          "Yellow" = "yellow",
          "Violet" = "violet",
          "Black" = "black"
        )
      ),
      textInput("agent_name", "Agent Name"),
      textInput("agent_type", "Agent Type"),
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
      prettyRadioButtons(
        inputId = "marker_type",
        label = "Choose the type of the point:",
        choices = c("Start Point", "End Point"),
        icon = icon("check"),
        bigger = TRUE,
        status = "info",
        animation = "jelly"
      ),
      shiny::tags$div(
        class = "d-flex flex-column align-items-center",
        actionButton(inputId = "add_agent_button", "Add Agent", class = "btn btn-custom m-3 w-50"),
        actionButton(inputId = "go_to_marker_button", "Go to Marker", class = "btn btn-custom m-3 w-50"),
        actionButton(inputId = "remove_selection", "Apply Changes", class = "btn btn-custom m-3 w-50")
      ),
      textOutput("check")
    )
  )
  ###### UI #######
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

  agent_color_icon <- makeIcon(
    iconUrl = system.file("extdata/markers", "blue.png", package = "FABDataHandler"),
    shadowUrl = system.file("extdata", "shaddow.png", package = "FABDataHandler"),
    iconHeight = 41,
    iconWidth = 25,
    iconAnchorX = 12,
    iconAnchorY = 41,
    popupAnchorX = 1,
    popupAnchorY = -34,
    shadowWidth = 41,
    shadowHeight = 41
  )
  server <- function(input, output, session) {
    dataToRemove <- c()
    startLocation <- NULL
    endLocation <- NULL
    output$leaflet_map <- renderLeaflet({
      map <- leaflet(options = leafletOptions(zoomControl = FALSE)) %>%
        addProviderTiles(providers$OpenStreetMap,
                         options = providerTileOptions(noWrap = TRUE)) %>%
        setView(53, 32, zoom = 5) %>%
        clearControls()
      map
      for (line in data) {
        info <- extractInfo(line)
        color <- info$agentColor
        markerIcon <- makeIcon(
          iconUrl = system.file("extdata/markers", sprintf("%s.png", color), package = "FABDataHandler"),
          shadowUrl = system.file("extdata", "shaddow.png", package = "FABDataHandler"),
          iconHeight = 41,
          iconWidth = 25,
          iconAnchorX = 12,
          iconAnchorY = 41,
          popupAnchorX = 1,
          popupAnchorY = -34,
          shadowWidth = 41,
          shadowHeight = 41
        )
        icon <- awesomeIcons(
          icon = 'ios-close',
          iconColor = 'black',
          library = 'ion',
          markerColor = "blue"
        )

        coordinates <- extractCoordinatesByLine(line)
        newLat <- as.double(coordinates$lat)
        newLng <- as.double(coordinates$lng)
        print(newLat)
        leafletProxy("leaflet_map") %>% addMarkers(
          lng = newLng,
          lat = newLat,
          icon = icon,
          layerId = as.character(i),
        )
        i <<- i + 1
      }
      return(map)

    })
    # Observe marker color
    observeEvent(input$agent_color, {
      agent_color <<- makeIcon(
        iconUrl = system.file(
          "extdata/markers",
          sprintf("%s.png", input$agent_color),
          package = "FABDataHandler"
        ),
        shadowUrl = system.file("extdata", "shaddow.png", package = "FABDataHandler"),
        iconHeight = 41,
        iconWidth = 25,
        iconAnchorX = 12,
        iconAnchorY = 41,
        popupAnchorX = 1,
        popupAnchorY = -34,
        shadowWidth = 41,
        shadowHeight = 41
      )
    })

    # Observe click on map
    observeEvent(input$leaflet_map_click, {
      click <- input$leaflet_map_click # typo was on this line
      if (is.null(click)) {
        return()
      } else {
        if (input$marker_type == "End Point") {
          marker_type <- "end_point"
          endLocation <<- c(click$lat, click$lng)
        } else{
          marker_type <- "start_point"
          startLocation <<- c(click$lat, click$lng)
        }
        leafletProxy("leaflet_map") %>%
          #clearMarkers() %>%
          addMarkers(
            lng = click$lng,
            lat = click$lat,
            icon = agent_color_icon,
            layerId = marker_type,
            # popup = sprintf(
            #   "<p class='popup-p'>I wanna know you more</p><a class='delete-markdown' data-target-id='%s'>Delete Me<a>",
            #   as.character(i)
          )

        leafletProxy("leaflet_map")
        # i <<- i + 1
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
      if (is.null(input$leaflet_map_marker_click)) {
        return()
      } else{
        print(input$leaflet_map_marker_click$id)
        #leafletProxy("leaflet_map") %>% removeMarker(input$leaflet_map_marker_click$id)
      }
    })
    output$lng <- renderText({
      0
    })
    output$lat <- renderText({
      0
    })

    # Go to marker observer
    observeEvent(input$go_to_marker_button, {
      if (length(markerLocation) == 0) {
        showModal(
          modalDialog(
            "No marker put on the map. Try to choose a coordinate first then try again",
            easyClose = TRUE,
            footer = NULL,
          )
        )
      } else{
        leafletProxy("leaflet_map") %>% setView(
          lat = markerLocation[1],
          lng = markerLocation[2],
          zoom = input$leaflet_map_zoom
        )
      }
    })
    # Add Agent observer
    observeEvent(input$add_agent_button, {
      if (is.null(startLocation) || is.null(endLocation)) {
        showModal(modalDialog("One of the 'Start' or 'End' points is not defined"))
      } else{
        agent_shape <- input$agent_shape_select
        agent_name <- input$agent_name
        agent_type <- input$agent_type
        agent_color_main <- input$agent_color
        addAgent(
          agentName = agent_name,
          agentShapeType = agent_shape,
          agentType = agent_type,
          startCoordinate = startLocation,
          endCoorinate = endLocation,
          agentColor = agent_color_main
        )
        leafletProxy("leaflet_map") %>% removeMarker("to_add")
        addMarkers(
          lng = markerLocation[2],
          lat = markerLocation[1],
          icon = agent_color_icon,
          layerId = sprintf("start_location_%s", as.character(length(data))),
          # popup = sprintf(
          #   "<p class='popup-p'>I wanna know you more</p><a class='delete-markdown' data-target-id='%s'>Delete Me<a>",
          #   as.character(i)
        )
        addMarkers(
          lng = markerLocation[2],
          lat = markerLocation[1],
          icon = agent_color_icon,
          layerId = sprintf("end_location_%s", as.character(length(data))),
          # popup = sprintf(
          #   "<p class='popup-p'>I wanna know you more</p><a class='delete-markdown' data-target-id='%s'>Delete Me<a>",
          #   as.character(i)
        )
        markerLocation <<- c()

      }

    })

  }
  shinyApp(ui, server)
}
