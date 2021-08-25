\name{openMap}
\alias{openMap}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
openMap(data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
%%     ~~Describe \code{data} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data) 
{
    i <- 1
    my_theme <- bs_theme(bootswatch = "darkly", base_font = font_google("Righteous"))
    thematic_shiny(font = "auto")
    ui <- bootstrapPage(includeCSS("www/styles.css"), includeScript("www/main.js"), 
        leafletOutput("leaflet_map", width = "100\%", height = "100\%"), 
        absolutePanel(left = 10, top = 10, selectInput("agent_shape_select", 
            "Agent Shape", c(Circle = "crc", Square = "sqr")), 
            textInput("agent_name", "Agent Name"), tags$div(class = "coordinates_main_container", 
                tags$div(class = "coordinates_container", textOutput("lat") \%>\% 
                  tagAppendAttributes(class = "m-3 p-3")), tags$div(class = "coordinates_container", 
                  textOutput("lng") \%>\% tagAppendAttributes(class = "m-3 p-3"))), 
            tags$div(class = "d-flex flex-column align-items-center", 
                actionButton(inputId = "add_agent_button", "Add Agent", 
                  class = "btn btn-custom m-3 w-50"), actionButton(inputId = "go_to_mark_button", 
                  "Add Agent", class = "btn btn-custom m-3 w-50"), 
                ), textOutput("check")))
    circle <- system.file("extdata", "circle.png", package = "FABDataHandler")
    squre <- system.file("extdata", "square.png", package = "FABDataHandler")
    diamond <- system.file("extdata", "diamond.png", package = "FABDataHandler")
    circle_icon <- makeIcon(iconUrl = circle, iconWidth = 35, 
        iconHeight = 35, iconAnchorX = 0, iconAnchorY = 0, )
    server <- function(input, output, session) {
        output$leaflet_map <- renderLeaflet({
            leaflet(options = leafletOptions(zoomControl = FALSE)) \%>\% 
                addProviderTiles(providers$Stamen.Toner, options = providerTileOptions(noWrap = TRUE)) \%>\% 
                setView(53, 32, zoom = 5) \%>\% clearControls()
        })
        observe({
            click <- input$leaflet_map_click
            if (is.null(click)) {
                return()
            }
            else {
                leafletProxy("leaflet_map") \%>\% addMarkers(lng = click$lng, 
                  lat = click$lat, icon = circle_icon, layerId = as.character(i), 
                  popup = "<p class='popup-p'>I wanna know you more</p>")
                leafletProxy("leaflet_map") \%>\% setView(lng = click$lng, 
                  lat = click$lat, zoom = input$leaflet_map_zoom)
                i <<- i + 1
            }
            output$check <- renderText({
                return(input$time1)
            })
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
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
