context("Test Map")

test_that("Check Map Markers", {
  data <- c()
  addAgent(
    agentName = "driver_2",
    agentColor = "black",
    agentType = "driver",
    agentShapeType = "circle",
    startCoordinate = "36.68 51.38",
    path = "Not",
    data = data
  )
  filter(removeAgentByName("driver_2", data = data), !is.na(removeAgentByName("driver_2", data = data)))
  extractInfo(data[1])
  extractCoordinatesByLine(data[1])
  openMap(data)
})
