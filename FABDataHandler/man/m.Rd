\name{m}
\alias{m}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("m")}
\format{
  The format is:
List of 8
 $ x            :List of 3
  ..$ options:List of 1
  .. ..$ crs:List of 5
  .. .. ..$ crsClass       : chr "L.CRS.EPSG3857"
  .. .. ..$ code           : NULL
  .. .. ..$ proj4def       : NULL
  .. .. ..$ projectedBounds: NULL
  .. .. ..$ options        : Named list()
  .. .. ..- attr(*, "class")= chr "leaflet_crs"
  ..$ calls  :List of 2
  .. ..$ :List of 2
  .. .. ..$ method: chr "addTiles"
  .. .. ..$ args  :List of 4
  .. .. .. ..$ : chr "//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ :List of 13
  .. .. .. .. ..$ minZoom     : num 0
  .. .. .. .. ..$ maxZoom     : num 18
  .. .. .. .. ..$ tileSize    : num 256
  .. .. .. .. ..$ subdomains  : chr "abc"
  .. .. .. .. ..$ errorTileUrl: chr ""
  .. .. .. .. ..$ tms         : logi FALSE
  .. .. .. .. ..$ noWrap      : logi FALSE
  .. .. .. .. ..$ zoomOffset  : num 0
  .. .. .. .. ..$ zoomReverse : logi FALSE
  .. .. .. .. ..$ opacity     : num 1
  .. .. .. .. ..$ zIndex      : num 1
  .. .. .. .. ..$ detectRetina: logi FALSE
  .. .. .. .. ..$ attribution : chr "&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap</a> contributors, <a href=\"http://creativecommons.or"| __truncated__
  .. ..$ :List of 2
  .. .. ..$ method: chr "addMarkers"
  .. .. ..$ args  :List of 13
  .. .. .. ..$ : num -36.9
  .. .. .. ..$ : num 175
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ :List of 9
  .. .. .. .. ..$ interactive : logi TRUE
  .. .. .. .. ..$ draggable   : logi FALSE
  .. .. .. .. ..$ keyboard    : logi TRUE
  .. .. .. .. ..$ title       : chr ""
  .. .. .. .. ..$ alt         : chr ""
  .. .. .. .. ..$ zIndexOffset: num 0
  .. .. .. .. ..$ opacity     : num 1
  .. .. .. .. ..$ riseOnHover : logi FALSE
  .. .. .. .. ..$ riseOffset  : num 250
  .. .. .. ..$ : chr "The birthplace of R"
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ : NULL
  .. .. .. ..$ :List of 9
  .. .. .. .. ..$ interactive: logi FALSE
  .. .. .. .. ..$ permanent  : logi FALSE
  .. .. .. .. ..$ direction  : chr "auto"
  .. .. .. .. ..$ opacity    : num 1
  .. .. .. .. ..$ offset     : num [1:2] 0 0
  .. .. .. .. ..$ textsize   : chr "10px"
  .. .. .. .. ..$ textOnly   : logi FALSE
  .. .. .. .. ..$ className  : chr ""
  .. .. .. .. ..$ sticky     : logi TRUE
  .. .. .. ..$ : NULL
  ..$ limits :List of 2
  .. ..$ lat: num [1:2] -36.9 -36.9
  .. ..$ lng: num [1:2] 175 175
 $ width        : NULL
 $ height       : NULL
 $ sizingPolicy :List of 6
  ..$ defaultWidth : chr "100%"
  ..$ defaultHeight: num 400
  ..$ padding      : num 0
  ..$ viewer       :List of 6
  .. ..$ defaultWidth : NULL
  .. ..$ defaultHeight: NULL
  .. ..$ padding      : NULL
  .. ..$ fill         : logi TRUE
  .. ..$ suppress     : logi FALSE
  .. ..$ paneHeight   : NULL
  ..$ browser      :List of 5
  .. ..$ defaultWidth : NULL
  .. ..$ defaultHeight: NULL
  .. ..$ padding      : NULL
  .. ..$ fill         : logi TRUE
  .. ..$ external     : logi FALSE
  ..$ knitr        :List of 3
  .. ..$ defaultWidth : NULL
  .. ..$ defaultHeight: NULL
  .. ..$ figure       : logi TRUE
 $ dependencies : NULL
 $ elementId    : NULL
 $ preRenderHook:function (widget)  
 $ jsHooks      : list()
 - attr(*, "class")= chr [1:2] "leaflet" "htmlwidget"
 - attr(*, "package")= chr "leaflet"
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(m)
## maybe str(m) ; plot(m) ...
}
\keyword{datasets}
