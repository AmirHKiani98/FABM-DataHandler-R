context("Test Map")

test_that("Check Map Markers", {
  data <- c()
  addAgent(
    agentName = "driver_2",
    agentColor = "blue",
    agentType = "driver",
    agentShapeType = "circle",
    startCoordinate = "32.68 51.38",
    endCoordinate = "36.68 50.38",
    data = data
  )
  filter(removeAgentByName("driver_2", data = data), !is.na(removeAgentByName("driver_2", data = data)))
  extractInfo(data[1])
  extractCoordinatesByLine(data[1])
  openMap(data)
})
