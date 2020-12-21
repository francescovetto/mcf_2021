install.packages("vegan")
library(vegan)

load("biomes_multivar.RData")

ls()

# plot for species matrix

head(biomes)

# detrended correspondence analysis, see how this species are related to each other
# species that are living together, are closed to each other in the plot 
multivar <- decorana(biomes)
multivar

plot(multivar)

# biomes names in the graph
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green", "blue"), kind = "ehull", lwd = 3 )
# applied to the multivar analysis we are going to see the colomun type 
# enclosing, the ellipse is passing for al of the plots for a certain byome
# names with the function 

ordispider(multivar, type, col=c("black","red","green", "blue"), label = T )

# export the file
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green", "blue"), kind = "ehull", lwd = 3 )
ordispider(multivar, type, col=c("black","red","green", "blue"), label = T )
dev.off()

