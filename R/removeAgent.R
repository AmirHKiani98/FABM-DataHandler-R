#' Remove Agent
#' @param agentName The name of the agent to be removed
#' @param data The data which contains line of the output
#' @return The data which has been adjusted
removeAgentByName <- function(agentName, data){
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, pattern = agentName)){
      if(i != 1){
        return(c(data[1:i-1],data[i+1:length(data)]))
      }else{
        return(data[2:length(data())])
      }
    }
  }
}

#' Remove Agent
#' @param startCoordinate The coordinate's of the location to start.
#' @param data The data which contains line of the output
#' @return The data which has been adjusted

removeAgentByStartCoordinate <- function(startCoordinate, data){
  for(i in 1:length(data)){
    line <- data[i]
    if(stringr::str_detect(line, pattern = startCoordinate)){
      if(i != 1){
        return(c(data[1:i-1],data[i+1:length(data)]))
      }else{
        return(data[2:length(data())])
      }
    }
  }
}
