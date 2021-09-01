#' Remove Agent
#' @param agentName The name of the agent to be removed
#' @param data The data which contains line of the output
#' @return The data which has been adjusted
removeAgentByName <- function(agentName, data){
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, pattern = agentName)){
      data <<- data[-1 * i]
      return(data)
    }
  }
}

#' Remove Agent by Start Coordinate
#' @param startCoordinate The coordinate's of the location to start.
#' @param data The data which contains line of the output
#' @return The data which has been adjusted

removeAgentByStartCoordinate <- function(startCoordinate, data){
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, pattern = startCoordinate)){
      data <<- data[-1 * i]
    }
  }
  return(data)
}
#' Remove Agent by Start End Coordinate
#' @param endCoordinate The coordinate's of the location to start.
#' @param data The data which contains line of the output
#' @return The data which has been adjusted

removeAgentByEndCoordinate <- function(endCoordinate, data){
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, pattern = endCoordinate)){
      data <<- data[-1 * i]
    }
  }
  return(data)
}


#' Remove Agent by Index
#' @param index The index of the line to delete
#' @param data The data, container of the lines
#' @return Adjusted data
removeAgentByIndex <- function(index, data){
  data <<- data[-1 * index]
  return(data)
}
#' Remove Agent by Array
#' @param index The indices array of the lines to delete
#' @param data The data, container of the lines
#' @return Adjusted data
removeAgentByArray <- function(indicesArray, data){
  data <<- data[-1 * indicesArray]
  return(data)
}
