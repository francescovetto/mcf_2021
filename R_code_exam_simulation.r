# R code for the exam 
## put in github the code of the exam, with several comments but also every code of the course 


# nc data: we need library to read it ncdf4
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
# c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc
# c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc

install.packages("ncdf4")

library(ncdf4)
library(raster)

setwd("/Users/francescovettore/Desktop/lab")

tjan <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

# exercise: change the color ramp palette 
cltjan <- colorRampPalette(c('blue','yellow','red'))(100)
plot(tjan, col=cltjan)
dev.off()

toct <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)

dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(dift, col=cldif)

# difference on the soil temperature 
