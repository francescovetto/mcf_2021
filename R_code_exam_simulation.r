# R code for the exam 

# nc data: we need library 
# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
# c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc

# install.packages("ncdf4")

library(ncdf4)
library(raster)

tjan <- raster("c_gls_LST10-DC_202012210000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)


