# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#' Loading ABM data file
#' @param path The file path
#' @return A list of files' lines
#' @examples
#' data <- readData(myPath)
#' data[5]
readData <- function(path){
  lines <- c()
  data <- read.delim(path, header = TRUE, sep = "\n")
  lines <- c(lines, colnames(data)[1])
  for(line in data){
    lines <- c(lines, line);
  }
  return(lines);
}

