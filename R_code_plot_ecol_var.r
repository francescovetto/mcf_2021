# here you can write everything! this is a comment

# R code for plotting the relationship among ecoogical variables

# install.packages is used to install packages
install.packages("sp")
library(sp) 

# without breakets beacuse we are already into R

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
