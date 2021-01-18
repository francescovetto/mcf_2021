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


########## deforestation example


library(raster)
library(RStoolbox)

setwd("/Users/francescovettore/Desktop/lab")

# A RasterBrick is a multi-layer raster object. 
defor1 <- brick("defor1_.jpg.png")  #defor1_.jpg.png
plotRGB(defor1, 1, 2, 3, stretch="Lin")

# import image defor2 
defor2 <- brick("defor2_.jpg.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

# par can be used to set or query graphical parameters.
# Three layers are combined such that they represent the red, green and blue channel.
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

dev.off()
# take the image defor1, link the image through the $ to the image of the NIR 
# and minus the band of the red channel 
# doing that we calculate the DVI for the 1st image, period

dvi1 <- defor1$defor1_.jpg.1 - defor1$defor1_.jpg.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
# specifying a color scheme
plot(dvi1, col=cl)

# dvi2
dvi2 <- defor2$defor2_.jpg.1 - defor2$defor2_.jpg.2

# the higher amount of yellow, the lower the capability of the system 
# to do photosynthesis, to produce oxygen, biomass 

# main, to put a label, a title to the image
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# dvi1 biomass before cut, dvi2 biomass after cut 
# the difference between 1 and 2
# if biomass was the same we'd have no difference
difdvi <- dvi1 - dvi2
# warning, images have a small difference in their extent 
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cldif)

cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difdvi, col=cldif, main="amount of energy lost!")

# histogram
# The generic function hist computes a histogram of the given data values
hist(difdvi, col="red")

par(mfrow=c(3,2))
# defor1 
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
# defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
# dvi1
plot(dvi1, col=cl, main="biomass before cut")
# dvi2
plot(dvi2, col=cl, main="biomass after cut")
# difdvi
plot(difdvi, col=cldif, main="amount of energy lost!")
# histogram
hist(difdvi, col="red")
