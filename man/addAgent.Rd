% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addAgent.R
\name{addAgent}
\alias{addAgent}
\title{Adding agent to the data}
\usage{
addAgent(
  agentName,
  agentShapeType,
  agentType,
  startCoordinate,
  path,
  agentColor,
  data
)
}
\arguments{
\item{agentName}{The name of the agent}

\item{agentShapeType}{The type of agent's shape, could be circle, square, etc.}

\item{agentType}{Type of agent, in order to classifying}

\item{startCoordinate}{The coordinates of start-point}

\item{path}{The path of the start and end point}

\item{agentColor}{The color which agent will be shown by in the map}

\item{data}{The data that contains the lines of files}
}
\value{
The new data
}
\description{
Adding agent to the data
}
\examples{
data <- readFile(pathToFIle)
data <- addAgent('Jim', 'Circle', 'driver', c(30.23, 34,23), c(c(30.23,34,24), c(30.30, 34,35)), 'blue', data)
saveData(newPath, data)
}
