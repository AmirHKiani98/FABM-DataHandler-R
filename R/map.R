#' Opening the map for graphically accesses
#' @param data The data which contains line of information
openMap <- function(data) {
  i <- 1
  temp_data_to_delete <- c()

  ###### UI ######
  ui <- bootstrapPage (
    includeCSS("www/styles.css"),
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
        actionButton(inputId = "apply_changes_button", "Apply Changes", class = "btn btn-custom m-3 w-50")
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


        startCoordinates <- extractStartCoordinatesByLine(line)
        endCoordinates <- extractEndCoordinatesByLine(line)
        startLat <- as.double(startCoordinates$lat)
        startLng <- as.double(startCoordinates$lng)
        endLat <- as.double(endCoordinates$lat)
        endLng <- as.double(endCoordinates$lng)
        leafletProxy("leaflet_map") %>% addMarkers(
          lng = startLng,
          lat = startLat,
          icon = markerIcon,
          layerId = sprintf("start_point_%s", as.character(i)),
        ) %>% addMarkers(
          lng = endLng,
          lat = endLat,
          icon = markerIcon,
          layerId = sprintf("end_point_%s", as.character(i)),
        )
        i <<- i + 1
      }
      return(map)

    })
    # Observe marker color
    observeEvent(input$agent_color, {
      agent_color_icon <<- makeIcon(
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
          addMarkers(
            lng = click$lng,
            lat = click$lat,
            icon = agent_color_icon,
            layerId = marker_type,
          )
        leafletProxy("leaflet_map")
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

    # Marker click observer
    observeEvent(input$leaflet_map_marker_click, {
      if (is.null(input$leaflet_map_marker_click)) {
        return()
      } else{
        layerId <- input$leaflet_map_marker_click$id
        splittedString <- stringr::str_split(layerId, '\\_')[[1]]
        if (length(splittedString) == 3) {
          id <- splittedString[3]
          leafletProxy("leaflet_map") %>%
            removeMarker(sprintf("start_point_%s", id)) %>%
            removeMarker(sprintf("end_point_%s", id))

          temp_data_to_delete <<- c(temp_data_to_delete, as.numeric(id))
        }
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
        if(input$agent_type == "" || input$agent_name == ""){
          showModal(modalDialog("One of the 'Agent Type' or 'Agent Name' is not defined"))
        }else{
          agent_shape <- input$agent_shape_select
          agent_name <- input$agent_name
          agent_type <- input$agent_type
          agent_color_main <- input$agent_color
          startLocationString <- paste(startLocation[1], startLocation[2], sep = " ")
          endLocationString <- paste(endLocation[1], endLocation[2], sep = " ")
          data <<- addAgent(
            agentName = agent_name,
            agentShapeType = agent_shape,
            agentType = agent_type,
            startCoordinate = startLocationString,
            endCoordinate = endLocationString,
            agentColor = agent_color_main,
            data = data
          )
          leafletProxy("leaflet_map") %>%
            addMarkers(
              lng = startLocation[2],
              lat = startLocation[1],
              icon = agent_color_icon,
              layerId = sprintf("start_location_%s", as.character(length(data))),
            ) %>%
            addMarkers(
              lng = endLocation[2],
              lat = endLocation[1],
              icon = agent_color_icon,
              layerId = sprintf("end_location_%s", as.character(length(data))),
            )
          startLocation <<- NULL
          endLocation <<- NULL
        }
      }
    })
    # Apply changes
    observeEvent(input$apply_changes_button, {
      data <<- removeAgentByArray(temp_data_to_delete, data)
      temp_data_to_delete <<- c()
    })


  }
  shinyApp(ui, server)
}

