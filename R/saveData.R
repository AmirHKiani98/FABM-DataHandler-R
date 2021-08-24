#' Saving the data to a file
#' @param path The destination path file
#' @param data The list of lines
#' @examples
#' data <- readData(path)
#' saveFile(newPath, data)
saveFile <- function(path, data){
  fileConnection <- file(path)
  writeLines(data, fileConnection)
  close(fileConnection)
}
