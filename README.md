# FABM-DataHandler-R
This package is made to add and remove data (and also with graphically interfaces) which is used for [this package visualizer for freight agent-based models](https://github.com/AmirHKiani98/ABMFreight-Visualizer).

You can handle the data either directly in command-line(scripts) or in [Map](#handle-data-in-map) which we provided for this purpose.

By the end of this journey, you will have learnt how to make data file for the other sub-packages.

<!-- <img src ="./readme files/map_gif.gif" alt="Loading Gif"> -->
<a href="https://colab.research.google.com/drive/1KBMvzO4X0vVCrM3Tz1WtCO5TeJs72mNg?usp=sharing"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a>


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

### Remove agent
In this section, there are a few ways to remove an agent from the data list.
#### Remove Agent by Name
`removeAgentByName()` will remove an agent from `data` array by using the name of the agent.
* `agentName` The name of the agent to be removed
* `data` The data which contains line of the output

#### Remove Agent by Start Coordinate
`removeAgentByStartCoordinate()` will remove an agent by using the start point of the agent(s). The end point can be different in some decimal numbers. This means that using *53.23* will delete both *52.23* and *52.2342* but not *52.2*
* `startCoordinate` The coordinate's of the location to start.
* `data` The data which contains line of the output

#### Remove Agent by End Coordinate
`removeAgentByEndCoordinate()` will remove an agent by using the end point of the agent(s). The end point can be different in some decimal numbers. This means that using *53.23* will delete both *52.23* and *52.2342* but not *52.2*
* `endCoordinate` The coordinate's of the location to start.
* `data` The data which contains line of the output

#### Remove Agent by Index of The Line
`removeAgentByIndex()` will remove an agent by using the index of the line in data array.
* `index` The index of the line to delete
* `data` The data which contains line of the output

#### Remove Agents by Array
`removeAgentByArray()` will remove a series of agents by their index. e.g. if you pass c(1,2,3,4) as indicesArray to this function, this will delete lines with indices of 1, 2, 3 and 4.
* `indicesArray` The index of the line to delete
* `data` The data which contains line of the output

### Handle data in map
This function provides a map(which actually is a leaflet map) to handle the data graphically.
To see the map enter `openMap(data)`, the data changes by adding and modifying the details in opened map.

The parameters required for this function are:
* `data` The array which contains the lines of information

The GIF below provides a little bit information about how it works. At the time you are installing this package, it may have changed in graphical interfaces but the main idea should be still the same.

![GIF file cannot be loaded](https://github.com/AmirHKiani98/FABM-DataHandler-R/blob/main/assets/map.gif?raw=true)

## Load and Save
### Load Data File
You can load a data file from your local machine by just using `readData` which only takes one parameter.
* `path` The file path
This function returns the data has been saved into the file
### Save Data File
After changing and add agents to a variable, let's name it `data`, you can save the contents of this array of lines into a text file by using `saveFile` function. This function gets two parameters:
* `path` The destination path file
* `data` The array of lines


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
