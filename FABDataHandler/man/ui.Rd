\name{ui}
\alias{ui}
\docType{data}
\title{
%%   ~~ data name/kind ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("ui")}
\format{
  The format is:
List of 3
 $ : NULL
 $ : NULL
 $ :List of 4
  ..$ :List of 3
  .. ..$ name    : chr "style"
  .. ..$ attribs :List of 1
  .. .. ..$ type: chr "text/css"
  .. ..$ children:List of 1
  .. .. ..$ : 'html' chr "html,\nbody {\n    width: 100%!important;\n    height: 100%!important;\n}\n\n:root {\n    --mainFontColor: rgb("| __truncated__
  .. .. .. ..- attr(*, "html")= logi TRUE
  .. ..- attr(*, "class")= chr "shiny.tag"
  ..$ :List of 3
  .. ..$ name    : chr "script"
  .. ..$ attribs : Named list()
  .. ..$ children:List of 1
  .. .. ..$ : 'html' chr "$(document).on(\"shiny:connected\", () => {\n  Shiny.setInputValue(\"time1\", \"\");\n  //console.log(Shiny)\n})"
  .. .. .. ..- attr(*, "html")= logi TRUE
  .. ..- attr(*, "class")= chr "shiny.tag"
  ..$ :List of 1
  .. ..$ :List of 3
  .. .. ..$ name    : chr "div"
  .. .. ..$ attribs :List of 3
  .. .. .. ..$ id   : chr "leaflet_map"
  .. .. .. ..$ style: chr "width:100%; height:100%; "
  .. .. .. ..$ class: chr "leaflet html-widget html-widget-output"
  .. .. ..$ children: list()
  .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. ..- attr(*, "class")= chr [1:2] "shiny.tag.list" "list"
  .. ..- attr(*, "html_dependencies")=List of 8
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "htmlwidgets"
  .. .. .. ..$ version   : chr "1.5.3"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/htmlwidgets/www"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "htmlwidgets.js"
  .. .. .. ..$ stylesheet: NULL
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi TRUE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "jquery"
  .. .. .. ..$ version   : chr "1.12.4"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/lib/jquery"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "jquery.min.js"
  .. .. .. ..$ stylesheet: NULL
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi TRUE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "leaflet"
  .. .. .. ..$ version   : chr "1.3.1"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/lib/leaflet"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "leaflet.js"
  .. .. .. ..$ stylesheet: chr "leaflet.css"
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi TRUE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "leafletfix"
  .. .. .. ..$ version   : chr "1.0.0"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/lib/leafletfix"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : NULL
  .. .. .. ..$ stylesheet: chr "leafletfix.css"
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi TRUE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "proj4"
  .. .. .. ..$ version   : chr "2.6.2"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/plugins/Proj4Leaflet"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "proj4.min.js"
  .. .. .. ..$ stylesheet: NULL
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi FALSE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "Proj4Leaflet"
  .. .. .. ..$ version   : chr "1.0.1"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/plugins/Proj4Leaflet"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "proj4leaflet.js"
  .. .. .. ..$ stylesheet: NULL
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi FALSE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "rstudio_leaflet"
  .. .. .. ..$ version   : chr "1.3.1"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets/lib/rstudio_leaflet"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : NULL
  .. .. .. ..$ stylesheet: chr "rstudio_leaflet.css"
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi TRUE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  .. .. ..$ :List of 10
  .. .. .. ..$ name      : chr "leaflet-binding"
  .. .. .. ..$ version   : chr "2.0.4.1"
  .. .. .. ..$ src       :List of 1
  .. .. .. .. ..$ file: chr "F:/Softwares/R-4.0.5/library/leaflet/htmlwidgets"
  .. .. .. ..$ meta      : NULL
  .. .. .. ..$ script    : chr "leaflet.js"
  .. .. .. ..$ stylesheet: NULL
  .. .. .. ..$ head      : NULL
  .. .. .. ..$ attachment: NULL
  .. .. .. ..$ package   : NULL
  .. .. .. ..$ all_files : logi FALSE
  .. .. .. ..- attr(*, "class")= chr "html_dependency"
  ..$ :List of 3
  .. ..$ name    : chr "div"
  .. ..$ attribs :List of 1
  .. .. ..$ style: chr "top:10px;left:10px;position:absolute;cursor:inherit;"
  .. ..$ children:List of 4
  .. .. ..$ :List of 3
  .. .. .. ..$ name    : chr "div"
  .. .. .. ..$ attribs :List of 1
  .. .. .. .. ..$ class: chr "form-group shiny-input-container"
  .. .. .. ..$ children:List of 2
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "label"
  .. .. .. .. .. ..$ attribs :List of 3
  .. .. .. .. .. .. ..$ class: chr "control-label"
  .. .. .. .. .. .. ..$ id   : chr "agent_shape_select-label"
  .. .. .. .. .. .. ..$ for  : chr "agent_shape_select"
  .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. ..$ : chr "Agent Shape"
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "div"
  .. .. .. .. .. ..$ attribs : Named list()
  .. .. .. .. .. ..$ children:List of 2
  .. .. .. .. .. .. ..$ :List of 3
  .. .. .. .. .. .. .. ..$ name    : chr "select"
  .. .. .. .. .. .. .. ..$ attribs :List of 1
  .. .. .. .. .. .. .. .. ..$ id: chr "agent_shape_select"
  .. .. .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. .. .. ..$ : 'html' chr "<option value=\"crc\" selected>Circle</option>\n<option value=\"sqr\">Square</option>"
  .. .. .. .. .. .. .. .. .. ..- attr(*, "html")= logi TRUE
  .. .. .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. .. .. ..$ :List of 3
  .. .. .. .. .. .. .. ..$ name    : chr "script"
  .. .. .. .. .. .. .. ..$ attribs :List of 3
  .. .. .. .. .. .. .. .. ..$ type         : chr "application/json"
  .. .. .. .. .. .. .. .. ..$ data-for     : chr "agent_shape_select"
  .. .. .. .. .. .. .. .. ..$ data-nonempty: chr ""
  .. .. .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. .. .. ..$ : 'html' chr "{\"plugins\":[\"selectize-plugin-a11y\"]}"
  .. .. .. .. .. .. .. .. .. ..- attr(*, "html")= logi TRUE
  .. .. .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. ..- attr(*, "html_dependencies")=List of 1
  .. .. .. .. ..$ :function ()  
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag.function"
  .. .. ..$ :List of 3
  .. .. .. ..$ name    : chr "div"
  .. .. .. ..$ attribs :List of 1
  .. .. .. .. ..$ class: chr "form-group shiny-input-container"
  .. .. .. ..$ children:List of 2
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "label"
  .. .. .. .. .. ..$ attribs :List of 3
  .. .. .. .. .. .. ..$ class: chr "control-label"
  .. .. .. .. .. .. ..$ id   : chr "agent_name-label"
  .. .. .. .. .. .. ..$ for  : chr "agent_name"
  .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. ..$ : chr "Agent Name"
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "input"
  .. .. .. .. .. ..$ attribs :List of 4
  .. .. .. .. .. .. ..$ id   : chr "agent_name"
  .. .. .. .. .. .. ..$ type : chr "text"
  .. .. .. .. .. .. ..$ class: chr "form-control"
  .. .. .. .. .. .. ..$ value: chr ""
  .. .. .. .. .. ..$ children: list()
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. ..$ :List of 3
  .. .. .. ..$ name    : chr "div"
  .. .. .. ..$ attribs :List of 1
  .. .. .. .. ..$ class: chr "coordinates_main_container"
  .. .. .. ..$ children:List of 2
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "div"
  .. .. .. .. .. ..$ attribs :List of 1
  .. .. .. .. .. .. ..$ class: chr "coordinates_container"
  .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. ..$ :List of 3
  .. .. .. .. .. .. .. ..$ name    : chr "div"
  .. .. .. .. .. .. .. ..$ attribs :List of 2
  .. .. .. .. .. .. .. .. ..$ id   : chr "lat"
  .. .. .. .. .. .. .. .. ..$ class: chr "shiny-text-output"
  .. .. .. .. .. .. .. ..$ children: list()
  .. .. .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. ..$ :List of 3
  .. .. .. .. .. ..$ name    : chr "div"
  .. .. .. .. .. ..$ attribs :List of 1
  .. .. .. .. .. .. ..$ class: chr "coordinates_container"
  .. .. .. .. .. ..$ children:List of 1
  .. .. .. .. .. .. ..$ :List of 3
  .. .. .. .. .. .. .. ..$ name    : chr "div"
  .. .. .. .. .. .. .. ..$ attribs :List of 2
  .. .. .. .. .. .. .. .. ..$ id   : chr "lng"
  .. .. .. .. .. .. .. .. ..$ class: chr "shiny-text-output"
  .. .. .. .. .. .. .. ..$ children: list()
  .. .. .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. .. ..$ :List of 3
  .. .. .. ..$ name    : chr "div"
  .. .. .. ..$ attribs :List of 2
  .. .. .. .. ..$ id   : chr "check"
  .. .. .. .. ..$ class: chr "shiny-text-output"
  .. .. .. ..$ children: list()
  .. .. .. ..- attr(*, "class")= chr "shiny.tag"
  .. ..- attr(*, "class")= chr "shiny.tag"
 - attr(*, "class")= chr [1:2] "shiny.tag.list" "list"
 - attr(*, "html_dependencies")=List of 1
  ..$ :function ()  
  .. ..- attr(*, "class")= chr "shiny.tag.function"
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
data(ui)
## maybe str(ui) ; plot(ui) ...
}
\keyword{datasets}
