# R spatial

library(sp) 
# to recall the sp package 
install.packages("sp") 
# to install the package, "" use those when we make use 
some additional component external to R

data(meuse)

head(meuse)

coordinates(meuse) = ~x+y
# just explain to R that we have coordinates for this dataset, 
# if we plot the dataset we'll see the set in space

plot(meuse)

# spplot is used to map layers, to plot elements like zinc, lead etc. spread in space
# first we state the dataset and we have to choose a variable, main= to put a title
spplot(meuse, "zinc", main="Concentration of zinc")

# plot the concentration of Copper, highest values on the west part of the plot
spplot(meuse, "copper", main="Concentration of copper")

# exercise: see copper and zinc, using the c symbol, the same solution we used
# primates <- c(1,5,10)
spplot(meuse, c("copper","zinc"), main="Concentration of copper and zinc")

# problem is that R uses the same legend for both the variable 

# rather than using colors, let's make use of bubbles
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead", col="red")

#### installing the ggplot2 library / package 

install.packages("ggplot")

library(ggplot2)

# ecological dataframe 
# biofuels
biofuels <- c(120, 200, 350, 570, 750) # array of values: c
# oxydative enzimes
oxydative <- c(1200, 1300, 21000, 34000, 50000) 

# dataframe
d <- data.frame (biofuels,oxydative)
d

# is it the same to do data.frame(biofuels,oxydative)? yes!
ggplot

# ggplot(data = NULL, mapping = aes())
# aes is related to the variables we are going to plot
# geom point, to explain to R that we want to use point as feature
# and what kind of geomerty we want to use, envinroment, color, size

ggplot(d, aes(x =biofuels, y = oxydative)) + geom_point(col="red", size=2)

# lines, instead of point, geom_line()
ggplot(d, aes(x =biofuels, y = oxydative)) + geom_line()
# points + lines
ggplot(d, aes(x =biofuels, y = oxydative)) + geom_point(col="red", size=2) + geom_line()

# polygons 
geom_polygon()

##### IMPORT DATA FROM AN EXTERNAL SOURCE

# setwd() is going to set the working directory
setwd("/Users/francescovettore/Desktop/lab")

covid <- read.table("covid_agg.csv", header=TRUE)

# header=TRUE means that each variable has a name

summary(covid)

# ggplot2
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point()

# changing the size of the data
ggplot(covid, aes(x = lon, y = lat, size = cases)) + geom_point()

