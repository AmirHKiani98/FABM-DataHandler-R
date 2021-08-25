# FABM-DataHandler-R
Freight Agent-Based Model - Handling Data - R
This package made for adding and removing data (and also with graphically interfaces) to  handle data which is using for [this package which visualizes Freight Agent-Based models](https://github.com/AmirHKiani98/ABMFreight-Visualizer).

You are able to handle the data either directly in comman-line(scripts) or in [Map](#handle-data-in-map) which we provided for this purpose.

## Functions
### Add agent in command-line
with `addAgent()` function you are able to add new agent to the map.

The parameters required for this function are:

* `agentName` The name of the agent
* `agentShapeType` The type of agent's shape, could be circle, square, etc.
* `agentType` Type of agent, in order to classifying
* `startCoordinate` The coordinates of start-point
* `path` The path of the start and end point
* `agentColor` The color which agent will be shown by in the map
* `data` The data that contains the lines of files

### Handle data in map
this function provides a map(which actually is a leaflet map) to handle the data graphically.
To see the map enter `openMap(data)`, the data changes by adding and modifying the details in opened map.

The parameters required for this function are:
* data
