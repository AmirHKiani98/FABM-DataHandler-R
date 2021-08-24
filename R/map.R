library(shiny)
library(leaflet)
library(bslib)
library(showtext)
library(thematic)

my_theme <- bs_theme(
  bootswatch = "darkly",
  base_font = font_google("Righteous")
)

thematic_shiny(font = "auto")
ui <- bootstrapPage(
  # theme = my_theme,
  includeCSS("www/styles.css"),
  includeScript("www/main.js"),
  leafletOutput("leaflet_map", width = "100%", height = "100%"),
  absolutePanel(
    left = 10, top = 10,
    selectInput("agent_shape_select", "Agent Shape", c(
      "Circle" = "crc",
      "Square" = "sqr"
    )),
    textInput("agent_name", "Agent Shape"),
    tags$div(
      class = "coordinates_main_container",
      tags$div(class = "coordinates_container", textOutput("lat")),
      tags$div(class = "coordinates_container", textOutput("lan"))
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
        clearMarkers() %>%
        addMarkers(
          lan = click$lan,
          lat = click$lat,
          icon = circleIcon,
          popup = "<p class='popup-p'>I wanna know you more</p>"
        )
      leafletProxy("leaflet_map") %>% setView(
        lan = click$lan,
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
    output$lan <- renderText({
      return(click$lan)
    })
  })
}

shinyApp(ui, server)