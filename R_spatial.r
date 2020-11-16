# R spatial

library(sp) 
# to recall the sp package 
install.packages("sp") 
# to install the package, "" use those when we make use 
some additional component external to R

data(meuse)

head(meuse)

coordinates(meuse) = ~x+y
# just explain to R that we have coordinates for this dataset, 
if we plot the dataset we'll see the set in space

plot(meuse)

# spplot is used to map layers, to plot elements like zinc, lead etc. spread in space
# first we state the dataset and we have to choose a variable, main= to put a title
spplot(meuse, "zinc", main="Concentration of zinc")

# plot the concentration of Copper, highest values on the west part of the plot
spplot(meuse, "copper", main="Concentration of copper")

# exercise: see copper and zinc, using the c symbol, the same solution we used
# primates <- c(1,5,10)
spplot(meuse, c("copper","zinc"), main="Concentration of copper and zinc")

# problem is that R uses the same legend for both the variable 

# rather than using colors, let's make use of bubbles
bubble(meuse, "zinc")

# do the same for lead
bubble(meuse, "lead", col="red")
