#' Extrcat coordinates by coordinates
#' @param wholeCoordinate the latitude and longitude separated by a white space
#' @return A list which contains lat and long as attributes
#' @exmaples
extractCoordinates <- function(wholeCoordinates){
  separatedCoordinates <- stringr::str_split(wholeCoordinates, "\ ")[[1]]
  lat <- separatedCoordinates[1]
  long <- separatedCoordinates[2]
  wholeCoordinates <- list()
  wholeCoordinates$lat <- lat
  wholeCoordinates$lng <- long
  return(wholeCoordinates)
}


#' Extract coordinates by line
#' @param line the line to extract coordinates from
#' @return A list which contains lat and long as attributes
extractCoordinatesByLine <- function(line){
  info <- extractInfo(line)
  wholeCoordinates <- info$startCoordinate
  separatedCoordinates <- stringr::str_split(wholeCoordinates, "\ ")[[1]]
  lat <- separatedCoordinates[1]
  long <- separatedCoordinates[2]
  wholeCoordinates <- list()
  wholeCoordinates$lat <- lat
  wholeCoordinates$lng <- long
  return(wholeCoordinates)
}


