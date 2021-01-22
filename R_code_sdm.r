# R code sdm

install.packages("sdm")
library(sdm)
library(raster)
library(rgdal)

# import species data which are in the sdm package 

file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file) # readOGR to ext species 
species

plot(species, pch=17)
# we should subdivide the points with presence and thos with absence 

species$Occurrence
plot(species[species$Occurrence == 1,], col='blue', pch=17)
# points to add points to the previous plot 
points(species[species$Occurrence == 0,], col='red', pch=17)

# predictors: all of 4 variables elevation, precipitation, temperature, biomass
path <- system.file("external", package="sdm")
# list od the predictors 
lst <- list.files(path=path,pattern='asc$',full.names = T) # ascii extension
lst

preds <- stack(lst)
# we can plot the data all together since they are in a stack
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,],pch=17)

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,],pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,],pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,],pch=17)

###### model 

# set the data for the sdm 
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# model
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature 
+ vegetation, data=datasdm, methods = "glm")
m1

# make the raster output layer 
p1 <- predict(m1,newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,],pch=17)

# probability of distribution of the species 

# add to the stack 
s1 <- stack(preds,p1)
plot(s1, col=cl, main='probability')


















