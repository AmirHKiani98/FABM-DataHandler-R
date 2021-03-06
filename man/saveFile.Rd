% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/saveData.R
\name{saveFile}
\alias{saveFile}
\title{Saving the data to a file}
\usage{
saveFile(path, data)
}
\arguments{
\item{path}{The destination path file}

\item{data}{The list of lines}
}
\description{
Saving the data to a file
}
\examples{
data <- readData(path)
saveFile(newPath, data)
}
