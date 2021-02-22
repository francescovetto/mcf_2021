# here you can write everything! this is a comment

# R code for plotting the relationship among ecoogical variables

# install.packages is used to install packages
install.packages("sp") # always put brackets "" when you recall something outside R to bring it inside
library(sp) # without breakets beacuse we are already into R

# data is used to recall datsets
data(meuse)

# look inside the set
meuse

# View(meuse) doesn't work for mac
solution is to install https://www.xquartz.org

head(meuse)

# exercise: mean of all of the variables
summary(meuse)

# exercise: plot zinc (y) against cadmium (x)
# error
plot(cadmium, zinc)
# Error in h(simpleError(msg, call)) : error in evaluating the argument 'x' in selecting a method for function 'plot': object 'cadmium' not found

# $ used to link in R different parts
plot(meuse$cadmium,meuse$zinc)

attach(meuse) 
# from now on we don't need to use the $
plot(cadmium,zinc)

plot(cadmium,lead)

# how to impress your supervisor
# scatterplot matrices
pairs(meuse)

# question 
# pairing only the elements part of the dataset: how to do that?
# only with cadmium, copper, lead, zinc..

#########

# lecture #2 on ecological variables

# exercise
# recall the package sp, recall the dataset meuse

head(meuse)

# cadmium copper lead zinc
# pairs with soil variables
# from column 3 to column 6
pairs(meuse[,3:6])

# let's use the names of the columns
pairs(~ cadmium + copper + lead + zinc, data=meuse)
#in mac tilde is alt + 5 

# let's prettify the graph
# exercise: change the colour 
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red")

# exercise
# change symbol triangles: pch, increase the size of the triangles cex=3
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)
