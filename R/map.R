library(shiny)
library(leaflet)
library(bslib)
library(showtext)
library(thematic)
library(shinythemes)

openMap <- function(data){
  i <- 1;
  my_theme <- bs_theme(
    bootswatch = "darkly",
    base_font = font_google("Righteous")
  )

  thematic_shiny(font = "auto")
  ui <- bootstrapPage(
    # theme = my_theme,
    includeCSS("www/styles.css"),
    #includeCSS("www/bootstrap/bootstrap.min.css"),
    includeScript("www/main.js"),
    leafletOutput("leaflet_map", width = "100%", height = "100%"),
    absolutePanel(
      left = 10, top = 10,
      selectInput("agent_shape_select", "Agent Shape", c(
        "Circle" = "crc",
        "Square" = "sqr"
      )),
      textInput("agent_name", "Agent Name"),
      tags$div(
        class = "coordinates_main_container",
        tags$div(class = "coordinates_container", textOutput("lat") %>% tagAppendAttributes(class = "m-3 p-3")),
        tags$div(class = "coordinates_container", textOutput("lng") %>% tagAppendAttributes(class = "m-3 p-3"))
      ),
      tags$div(
        class= "d-flex flex-column align-items-center",
        actionButton(inputId = "add_agent_button", "Add Agent", class = "btn btn-custom m-3 w-50"),
        actionButton(inputId = "go_to_mark_button", "Add Agent", class = "btn btn-custom m-3 w-50"),
      ),
      textOutput("check")
    )
  )
  circle <- system.file("extdata", "circle.png", package = "FABDataHandler")
  squre <- system.file("extdata", "square.png", package = "FABDataHandler")


  diamond <- system.file("extdata", "diamond.png", package = "FABDataHandler")
  circle_icon <- makeIcon(
    iconUrl = circle,
    iconWidth = 35, iconHeight = 35,
    iconAnchorX = 0, iconAnchorY = 0,
  )

  server <- function(input, output, session) {
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
          #clearMarkers() %>%
          addMarkers(
            lng = click$lng,
            lat = click$lat,
            icon = circle_icon,
            layerId = as.character(i),
            popup = "<p class='popup-p'>I wanna know you more</p>"
          )
        leafletProxy("leaflet_map") %>% setView(
          lng = click$lng,
          lat = click$lat,
          zoom = input$leaflet_map_zoom
        )
        i <<- i+1;

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
    output$lng <- renderText({
      0
    })
    output$lat <- renderText({
      0
    })
  }
  shinyApp(ui, server)
}
openMap(null)
