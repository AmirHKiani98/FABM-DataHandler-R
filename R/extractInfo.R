#' Extracting information from a single line of data
#' @param line A single line of data which to extract info
#' @return Extracted data as a list
#' @examples
#' data <- c();
#' addAgent("driver", "circle", "phase 1", "42.23 12.23", "no path", "blue", data)
#' extractInfo(data[1])
extractInfo <- function(line){
  splittedResult <- stringr::str_split(line, "\\|")[[1]]
  infoList <- list();
  infoList$agentType <- splittedResult[1]
  infoList$agentName <- splittedResult[2]
  infoList$startCoordinate <- splittedResult[3]
  infoList$endCoordinate <- splittedResult[4]
  infoList$agentShapeType <- splittedResult[5]
  infoList$agentColor <- splittedResult[6]
  return(infoList)
}

#' Extracting information from a single line of data by index
#' @param data The data to extract the information from
#' @param index The index of the line in the data array to extract.
#' @return Extracted data as a list
#' @examples
#' data <- c();
#' addAgent("driver", "circle", "phase 1", "42.23 12.23", "no path", "blue", data)
#' extractInfoByIndex(data, 1)
extractInfoByIndex <- function(data, index){
  splittedResult <- stringr::str_split(data[index], "\\|")[[1]]
  infoList <- list();
  infoList$agentType <- splittedResult[1]
  infoList$agentName <- splittedResult[2]
  infoList$startCoordinate <- splittedResult[3]
  infoList$endCoorinate <- splittedResult[4]
  infoList$agentShapeType <- splittedResult[5]
  infoList$agentColor <- splittedResult[6]
  return(infoList)
}
#' Extracting information from a single line of data by agentType and agentName
#' @param data The data to extract the information from
#' @param agentType agentType of the line supposed to be extracted
#' @param agentName agentName of the line supposed to be extracted
#' @return Extracted data as a list
#' @examples
#' data <- c();
#' addAgent("driver_1", "circle", "phase 1", "42.23 12.23", "no path", "blue", data)
#' extractInfoByIndex(data, "driver_1, "phase 1")
extractInfoByIndex <- function(data, agentType, agentName){
  if(length(data) == 0){
    return(FALSE)
  }else{
    for(i in 1:length(data)){
      line <- data[i]
      if(stringr::str_detect(line, agentType) && stringr::str_detect(line, agentName)){
        splittedResult <- stringr::str_split(line, "\\|")[[1]]
        infoList <- list();
        infoList$agentType <- splittedResult[1]
        infoList$agentName <- splittedResult[2]
        infoList$startCoordinate <- splittedResult[3]
        infoList$endCoorinate <- splittedResult[4]
        infoList$agentShapeType <- splittedResult[5]
        infoList$agentColor <- splittedResult[6]
        return(infoList)
      }
    }
  }
  return(FALSE)
}


