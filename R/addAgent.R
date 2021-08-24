#' Adding agent to the data
#' @param agentName The name of the agent
#' @param agentShapeType The type of agent's shape, could be circle, square, etc.
#' @param agentType Type of agent, in order to classifying
#' @param startCoordinate The coordinates of start-point
#' @param path The path of the start and end point
#' @param agentColor The color which agent will be shown by in the map
#' @param data The data that contains the lines of files
#' @return The new data
#' @examples
#' data <- readFile(pathToFIle)
#' data <- addAgent('Jim', 'Circle', 'driver', c(30.23, 34,23), c(c(30.23,34,24), c(30.30, 34,35)), 'blue', data)
#' saveData(newPath, data)
addAgent <- function(agentName ,agentShapeType, agentType, startCoordinate , path, agentColor, data){
  if(missing(agentShapeType)){
    agentShapeType <- "circle"
  }
  if(missing(agentColor)){
    agentColor <- "yellow"
  }
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, agaentType)){
      toAppend <- paste(agentType, " ", agentName, " " , startCoordinate, " ", path, " " , agentShapeType, " ",agentColor)
      return(append(data, toAppend, i))
    }
  }
}
