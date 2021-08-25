context("Test Data Handling")
library("FABDataHandler")

test_that("Add data to test data", {
  data <- c();
  addAgent("driver", "circle", "phase 1", "42.23 12.23", "no path", "blue", data)
  expect_equal(data, c("phase 1|driver|42.23 12.23|no path|circle|blue"))
})
