context("Test Map")

test_that("Check Map Markers", {
  data <- c()
  addAgent(
    agentName = "driver_1",
    agentColor = "blue",
    agentType = "driver",
    agentShapeType = "circle",
    startCoordinate = "35.68 51.38",
    path = "Not",
    data = data
  )
  extractInfo(data[1])
  extractCoordinatesByLine(data[1])
  openMap(data)
})
