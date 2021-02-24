setwd("/Users/francescovettore/Desktop/lab")

library(raster)
 
rlist <- list.files(pattern="EN")
rlist 
rlist_rast <- lapply(rlist,raster)
ENstack <- stack(rlist_rast)
# Stacking vectors concatenates multiple vectors into a single vector 
# along with a factor indicating where each observation originated

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100)

par(mfrow=c(1,2))
plot(EN01, col=cl) # january 2020 value of pollution in january
plot(EN13, col=cl) # march 2020 

# making the difference we have the increase / diminishing in pollution 
# between two periods of time on the same pixel

difno2 <- EN01 - EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100)
plot(difno2, col=cldif)
# highest difference will be in yellow 

# plot all the images 13 images 
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# make a stack 
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)
plot(EN, col=cl)

# plotRGB
# stretch = It will gather the columns into a long-format data frame
plotRGB(EN, red=EN13, green=EN07, blue=EN01, stretch="lin")

# boxplot xlab,ylab labels for the axis 
# boxplot = Produce box-and-whisker plot(s) of the given (grouped) values.
boxplot(EN, horizontal=T,axes=T,outline=F, xlab="NO2 - 8bit", ylab="Period")
