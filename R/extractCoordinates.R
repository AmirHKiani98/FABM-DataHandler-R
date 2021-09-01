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


#' Extract start coordinates by line
#' @param line the line to extract start coordinates from
#' @return A list which contains lat and lang as attributes
extractStartCoordinatesByLine <- function(line){
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

#' Extract end coordinate by line
#' @param line the line to extract end coordinate from
#' @return A list which contains lat and lang as attributes
extractEndCoordinatesByLine <- function(line){
  info <- extractInfo(line)
  wholeCoordinates <- info$endCoordinate
  separatedCoordinates <- stringr::str_split(wholeCoordinates, "\ ")[[1]]
  lat <- separatedCoordinates[1]
  long <- separatedCoordinates[2]
  wholeCoordinates <- list()
  wholeCoordinates$lat <- lat
  wholeCoordinates$lng <- long
  return(wholeCoordinates)
}


