\name{server}
\alias{server}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
server(input, output, session)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{input}{
%%     ~~Describe \code{input} here~~
}
  \item{output}{
%%     ~~Describe \code{output} here~~
}
  \item{session}{
%%     ~~Describe \code{session} here~~
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
function (input, output, session) 
{
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
            leafletProxy("leaflet_map") \%>\% clearMarkers() \%>\% 
                addMarkers(lng = click$lng, lat = click$lat, 
                  icon = circle_icon, popup = "<p class='popup-p'>I wanna know you more</p>")
            leafletProxy("leaflet_map") \%>\% setView(lng = click$lng, 
                lat = click$lat, zoom = input$leaflet_map_zoom)
            print(input$leaflet_map_zoom)
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
