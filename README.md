# FABM-DataHandler-R
This package made to add and remove data (and also with graphically interfaces) which is used for [this package that visualizes freight agent-based models](https://github.com/AmirHKiani98/ABMFreight-Visualizer).

You can handle the data either directly in command-line(scripts) or in [Map](#handle-data-in-map) which we provided for this purpose.

## Functions
### Add agent in command-line
`addAgent()` function make you able to add new agent to the map.

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
* `data` The array which contains the lines of information

The GIF below provides a little bit information about how it works. At the time you are installing this package, it may have changed in graphical interfaces but the main idea should be still the same.

![GIF file cannot be loaded](https://s18.picofile.com/file/8440166068/map.gif)

## How to install
First, you need to install `devtools` package, (if you haven't done yet). You can do this with running:
```r
install.packages("devtools")
```
Then, you should load the library to have access to its functions
```r
library(devtools)
```
Finally, you can install any R package which served on the Github. For example, you can now install FABMDataHandler package with this line of code:
```r
install_github("AmirHKiani98/FABM-DataHandler-R")
```
Hooray!
