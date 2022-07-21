
# Vectors / Iteration with purr / map functions
library(tidyverse)
library(dplyr)



# Review and Recall

# Write a function that will deliver the Volume, Surface Area,
# and the length of a diagonal of a Cube. (multiple executions)
## we need a input of function 
## To find the volume of cube 
Cube <- function(e) {
  Volume <- e^3
  SA <- 6*e^2
  DL <- e*sqrt(3)
  return(c(Volume = Volume, SA = SA, DL = DL))
}
Cube(10)
Cube(12)
Cube(6)

# Alternate method
## use data.frame will make it more clear (dataframe format )
Cube <- function(e) {
  Volume <- e^3
  SA <- 6*e^2
  DL <- e*sqrt(3)
  return(data.frame(Volume = Volume, SA = SA, DL = DL))
}

Cube(c(10,12,6))




# What is a Vector ?

# In physics and mathematics a vector is a quantity or
# phenomenon that has two independent properties; magnitude 
# and direction. Our definition or description however is 
# considerably less technical.For the purposes of this class, 
# a vector is simply a collection of "things" or objects.  
# Those "things" can be numbers, words, letters, or other 
# miscellaneous items.

# Vectors are of two types:
#   Atomic Vectors ## the object the same type 
#   Lists
# Examples of Atomic Vectors (the objects are of the same type)

V1 <- c(12, 33, 2, 82, 33)   # All objects are integers(same family they are all integer+>atomic )
V1

V2 <- c(.002, 3.6, 7.32, 4.5, 6.0) # All objects are doubles
V2

V3 <- c(FALSE,TRUE,TRUE,FALSE) # All objects are logical entries
V3

V4 <- c("JANE", "BILL", "JUAN", "EILEEN", "ANN") 
V4    # All objects are character strings

# Examples of Lists (objects can be of different types)
## integer double character logical ## can be in different type we can have list in a list like L2

L1 <- list(6, 3.8, "every", TRUE)
L1

L2 <- list(TRUE, 12, .0125, "cat", list(2:5)) # note that a list
L2
# can contain another list


# There are six types of Atomic Vectors: logical, integer, double,
# character, complex, and raw.  Integer and double vectors are
# commonly referred to as numeric vectors.

# An Atomic Vector is homogeneous. (the items in the vector are
# of the same type)

# The following are examples of Atomic Vectors.

# X <- c("Raymond","Twenty", "Boston", "Eastern")  All items in the
# vector are character strings

# Y <- c(121, 128, 89, 11, 56 )  All items in the  vector are
# integers

# A List is heterogeneous. A List therefore can contain items of
# different types. (and other lists)
# A <- list( 36, "big". TRUE, list(2,"two", FALSE) ),

# Finding the type and length of a Vector.  use the function
# "typeof" to identify the vector and use the function  
# "length" to determine the number of elements that the vector
# has.

typeof(c(11,15,20.5,37)) ## double can be an integer or 

length(c(11,15,20.5,37))

AA <- (c("apple", "grape", "peach", "plum", "banana"))
AA

typeof(AA)

length(AA)

# Finding the length of a List

M <- list("ALICE", 2:12, TRUE, 95)
M
## use the same way 

length(M)
# What happens when typeof is applied to M ?



# Naming , describing or listing the content of a vector. 
# Use the code set_names from the purr package.

set_names(c("Boston","Baltimore","Atlanta", "New York","Cleveland"))
##identify the content of the vector 
set_names(c(14,12,.003,6,20))

set_names(5:7, c("m", "n", "p")) ##5:7=567 and use c will 567 mnp

# Subsetting Vectors

X <- c("Boston","Baltimore","Atlanta", "New York","Cleveland")
X

# Extract the first string of the vector  (use brackets)
X[1] ## this should extract the first one from x  which will be Boston

# Extract the second and fourth strings of the vector
X[c(2,4)] ## extract the second and fourth  will be Baltimore and New York
X[c(1,4)] ## extract the first and fourth "Boston"   "New York"

# Extract the second string of the vector three times

X[c(2,2,2)]

# Drop a string from the vector. (Let's drop the string New York)
X[-4] 
## the vector is X <- c("Boston","Baltimore","Atlanta", "New York","Cleveland") 
##don't want newyork so use -4


# Another example

U <- c(10, 3, NA, 5, 8, 1, NA) ## number and missing value 
U

# Extract all missing values from the vector

U[is.na(U)] ## want NA to extract is.na we want missing value 

# Extract all values from the vector that are not missing ## this men we don't want missing value 

U[!is.na(U)] ## !(not) to mean I don't want the missing value except the missing value 

# Extract all values from the vector that are even (Extract only
# 10 and 8) ## we only want 10 and 8 even(divide by 2 ) value 


U <- c(10, 3, NA, 5, 8, 1, NA)
U


U[U %%2 == 0 & !is.na(U)] ##U %%2 == 0 mean the even number and 
## & !is.na(U) means we don't have the NA

# Extract all values from the vector that are greater than 2 
# and the missing values
U[U > 2] ## greater than 2 and also NA (the will appear by default )

# Practice !!

U <- c(10, 3, NA, 5, 8, 1, NA)
U

#1  The following subsetting code will extract What elements ?
U[!(U > 5) & !is.na(U)] ## not greater than 5 or equal than 3 5 1 



#2  What does the following code produce ?
U[] ## use all U 


# LISTS

# Recall that lists can contain different object types.

Y <- list("ball", 25, 12.25, FALSE, b = 1:5, c = list(-1, "west"))
Y

# Use the command  str  to categorize each object
str(Y)

# Subsetting on a List

# using [[ ]] to subset a single object
## use [[ ]]

Y <- list("ball", 25, 12.25, FALSE, b = 1:5, c = list(-1, "west"))
Y

str(Y[[1]]) ## first 
str(Y[[4]])## forth 
str(Y[[6]])  ## sixth
str(Y[['c']]) ## the  list of 2 

# Using $ to subset a single object ## is not absolte 
Y$c   ## extract the object c   

Y$b ## it will extract the 1:5

# Lets extract the object "ball" using the $ sign

Y <- list("ball", 25, 12.25, FALSE, b = 1:5, c = list(-1, "west"))
Y

# note that Y$1 does not work !!
Y$1 ## has to be assigned the character like k below

# note that Y$"ball" does not work !!
Y$"ball" ## has to be assigned the character like k below

# Solution: assign the character string to a variable, and then apply $
# to the variable

Y <- list(k = "ball", 25, 12.25, FALSE, b = 1:5, c = list(-1, "west"))
Y
Y$k


# Subsetting to get a list from a list  (Use  str([ ]))

Y <- list(z="ball", 25, q=12.25, FALSE, b = 1:5, c = list(-1, "west"))
Y

str(Y[1:3]) ## we want the first 3 element 

str(Y[5:6]) ## it will give the fifth and sixth

str(Y[ ])

# Extract the 2nd and the the forth elements using R coding 
(Y[c(2,4)])
# suppose you want the 1st object the third object
str(Y[c(1,3)])

# Using the purr package map functions.

# Example 1

# Lets consider the previously learned code and method for finding
# the median of every column of mtcars

mtcars

#  brute force
median(mtcars$mpg)
median(mtcars$cyl)
median(mtcars$disp)
median(mtcars$hp)
median(mtcars$drat)
median(mtcars$wt)
median(mtcars$qsec)
median(mtcars$vs)
mean(mtcars$am)  
# two more



# Lets use the special for loop ## want every median from mtcars
output2 <- vector("double", ncol(mtcars))  # 1. output
for (i in seq_along(mtcars)) {            # 2. sequence
  output2[[i]] <- median(mtcars[[i]])      # 3. body ##[[i]]? why we have to use [[i]]
}
output2

# Now lets use one of the map functions to get the same results ##map from purr

map_dbl(mtcars, median)  
##map_dbl is only for sd max median ? or it can also use this to replace the fuction ?

# Suppose we wanted to use a map function to get the standard 
# deviation for each variable of the mtcars data table.

map_dbl(mtcars, sd)

mtcars

# Lets round each result to the nearest tenth

# method 1
map_dbl(mtcars, sd) -> X
X

round(X, digits = 1)

# method 2
round(map_dbl(mtcars, sd), digits = 1)


# What will the following code produce from the mtcars data table?

map_dbl(mtcars, max)



# Lets use the piping procedure to apply map functions

mtcars

# Find the mean of each column

mtcars %>%
  map_dbl(median)


# Find the minimum of each column

mtcars %>%
  map_dbl(min)

# Lets modify the value of each column (Add 3 to each column )## add each number to each column 

mtcars

mtcars %>%
  map(~. + 3) #. each column 

# lets take the square root of each number of each column
mtcars %>%
  map(~.^(.5)) -> w # ~ this is going to be behind the~
w 
round(w$wt,digits = 1)
round(w, digits = 1)

# Textbook example

# Lets find a linear model for each type of cylinder categories for 
#vehicles in the mtcars data set. (We will use weight to predict 
# miles per gallon)

# How many cylinder types are there ?
mtcars

factor(mtcars$cyl)

# So we want R coding that will produce a linear model for 4 cylinder
# vehicles, 6 cylinder vehicles, and 8 cylinder vehicles.

models <- mtcars %>%
  split(.$cyl) %>%
  map(~lm(mpg ~ wt, data = .)) 
models

# Now lets get more detailed information for each model.

models %>%
  map(summary) 

# Lets find a particular value of the summary:  We will find Rsquared

# method 1
models %>%
  map(summary) %>% 
  map_dbl(~.$r.squared)


# method 2
models %>%
  map(summary) %>% 
  map_dbl("r.squared")


# How can we find r (the correlation coefficient) for each model?
models %>%
  map(summary) %>% 
  map_dbl(~.$r.squared) -> models1
models1

# method 1
models1 -> xx
xx

xx^.5

# method 2
sqrt(models1)




q()
y
