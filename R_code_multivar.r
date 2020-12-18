install.packages("vegan")
library(vegan)

load("biomes_multivar.RData")

ls()

# plot for species matrix

head(biomes)

# detrended correspondence analysis, see how this species are related to each other
# species that are living together, in the same are are closed in the plot 
multivar <- decorana(biomes)
multivar
