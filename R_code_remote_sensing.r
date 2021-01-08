# R code fore remote sensing data analysis to monitor ecosystem changes in space

# install.packages(c("raster", "RStoolbox"))

library(raster)
library(RStoolbox)


p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
par(mfrow=c(2,2)) 
# par is used to query graphical parameters
# now set color ramp palett for the 4 different images

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100)
plot(p224r63_2011$B1_sre, col=clb)
# plot just one image, the $ to attach the right one

# do the same for the others bands

clg <- colorRampPalette(c('dark green','green','light green'))(100)
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','orange'))(100)
plot(p224r63_2011$B3_sre, col=clr)

# plot the final band, namely the NIR, band number 4

clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(p224r63_2011$B4_sre, col=clnir)

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

# how to use band number 4, put the nir infra red in the red component of the rgb, 
# all the vegetation are now in red, some blank points refers to human infrastructure 
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
