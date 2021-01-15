install.packages("rasterdiv")
# R code to view biomass over the world and calculate changes in ecosystem functions
library(rasterdiv)
library(raster)

data(copNDVI)
plot(conNDVI)

# to remove the blue, removing the higher values
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# a long term picture is the mean of images of plenty of years 

# use rastervis for showing the level plot
# A level plot is a type of graph that is used to display a surface 
# in two rather than three dimensions
install.packages("rasterVis")
library(rastervis)
levelplot(copNDVI)

clymin <- colorRampPalette(c('yellow', 'red', 'blue'))(100)
plot(copNDVI, col=clymin)

clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)
plot(copNDVI, col=clymed)

clymax <- colorRampPalette(c('red', 'blue', 'yellow'))(100)
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue', 'red', 'yellow'))(100)
plot(copNDVI, col=clymax)

dev.off()

# zoom to italy y latitute x longitude c(x,y) xmin,xmax,ymin,ymax extension
italy_ext <- c(0,20,35,55)
copNDVI_Italy <- crop(copNDVI, italy_ext)
plot(copNDVI_Italy, col=clymax)
