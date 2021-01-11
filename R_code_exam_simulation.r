# R code for the exam 

# nc data: we need library to read it ncdf4
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
# c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc
# 

install.packages("ncdf4")

library(ncdf4)
library(raster)

setwd("/Users/francescovettore/Desktop/lab")

tjan <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

# exercise: change the color ramp palette 
# cltjan <- colorRampPalette(c('black','grey','light grey'))(100)


