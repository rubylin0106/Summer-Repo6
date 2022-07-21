# DS 413/613
# Functions  Chapters 15 and 17
 library(tidyverse)

# A function is a structured and sequenced set of commands 
# that process input values to produce output values efficiently.
# A function reduces repetitive calculations that often result 
# in mistakes, errors, and unneeded work.

# Consider the task of calculating the volume of twenty 
# cylinders with the given dimensions:
# Cylinder1  r = 4, h = 6      V = pi(4^2)(6)
# Cylinder2  r = 3, h = 10     V = pi(3^2)(10)
# Cylinder3  r = 2.5, h = 5    V = pi((2.5)^2)(5)
# Cylinder4  r = 12, h = 4     V = pi(12^2)(4)
# Cylinder5  r = 20, h = 14    V = pi(20^2)(16)
#            .
#            .
#            .
# Cylinder20 r = 12.25, h = 9  V = pi(12.25)(9)

# The formula V = pi(r^2)h would have to be applied correctly 
# 20 times, if you are to do these manually; one at a time.  
# There is certainly a high risk for errors i.e. data entry 
# or misuse of the formula for a problem.
 
# Were any errors committed in the executions above ?
 
# We now use a function for this problem to reduce repetitive
# calculations and possible errors
 
# Basic function structure:
 
# function_name <- function (argument/input variables) {
# statements/expression for calculation/equation          
#  }
## r, h is input variable #french braces  
# Call the function and evaluate


# Example 1 Write a function to find the volume of a cylinder

#  Volume = pi(r^2)h,  pi is approximately 3.14

volume_cylinder <- function(r, h) {
 pi*r^2*h
}

##name function <- function(input ,input ){
#formula #this should be next line(})
 
##call back the below 
volume_cylinder(4, 6)
volume_cylinder(3, 10)

# Now lets add a descriptive statement for the output

# Example 2
##print paste can be add comment like below
volume_cylinder <- function(r, h) {
  V = pi*r^2*h
  print(paste("The volume of a cylinder with a radius of 4 and
              a height of 6 is",V))
  
}

volume_cylinder(4, 6)

# Now lets produce an answer that is rounded to a specified value

# Example 3
##round  v to 3 digital 
##print paste (comment)
## if we want to time  have to use * we have to use 3*(4) instead of 3(4)
##if we use round(formula,digits))after decimal point)
volume_cylinder <- function(r, h) {
  V = pi*r^2*h
  print(paste("The volume of a cylinder with a radius of 4 and 
              a height of 6 is", 
              round(V, digits = 3)))
  
}

volume_cylinder(4, 6)


# Example 4

# function to print x raised to the power y
## pow (x,y) 8^2
# if we not declare it will default 
pow <- function(x, y) {
  result <- x^y
  print(paste(x,"raised to the power", y, "is", result))
}

pow(8, 2)
pow(2,8)
pow(x = 2, y = 8)
pow(y = 8, x = 2)
pow(x=8, 2)
pow(2, x = 8)
pow(y = 8, 2)
pow(2, y = 8)

pow <- function(x, y = 2) {
  # function to print x raised to the power y
  result <- x^y
  print(paste(x,"raised to the power", y, "is", result))
}
## 89 or 91 (lines from the old file ) pow(y = 8, x = 2) pow(2, x = 8)

pow(5)

pow(5,3)  # overrides the default assignment  ## 3 overrides y=2


# Example 5a

# Write a function that will create the first 10 squares of
# positive odd integers. That is your function will give you 
# the following output. 1, 9, 25, 49, ., 361 when you input 
# values 1 to 10.
# How do you write a positive odd integer?  2*x - 1 ,  where x 
# is positive integer

## odd integer 

# Method 1
## we only have 1 input variable  ##  we only the first ten squared 
C <- function(x) {
  (2*x - 1)^2
}

C(1:10) # 1column10
5^2 #squared 
5**2 # squared 

# Method 2
##return is another style to ?

C <- function(x) {
  (2*x - 1)^2
  return((2*x - 1)^2)
} 

C(1:10)


# Example 5b

# Create a data frame
## c1 c2 c3 each ( 50 values random generate, mean 5 ,sd =1.5)
## only show first 10 for tibble 
data_frame <- tibble(  
  c1 = rnorm(50, 5, 1.5), 
  c2 = rnorm(50, 5, 1.5),    
  c3 = rnorm(50, 5, 1.5),    
)
data_frame

## check mean(data_frame$c2)
## sd(data_frame$c2) I got different is it because is random ?
# check
mean(data_frame$c1)
sd(data_frame$c1)

# Let's normalize over a column. The following would have to be 
# done for each column, lets use column 1.

(data_frame$c1 - min(data_frame$c1)) / 
(max(data_frame$c1) - min(data_frame$c1))

# (The minimum value of c1 subtracted from each value of c1
# divided by the maximum value of c1 minus the minimum value
# of c1)

# This is a tedious task, for we would need similar calculations
# for every element of all three columns

mean(data_frame$c1)
min(data_frame$c1)
max(data_frame$c1)
data_frame$c1


# We shall construct a function that will reduce the repetitive 
# steps required.



(data_frame$c1 - min(data_frame$c1)) / 
(max(data_frame$c1) - min(data_frame$c1))

# Assign expression to a variable for easier recognition and 
# coding

##notation to make data_frame$c1 easy 
data_frame$c1 -> x
x

normalize <- function(x){
  # step 1: create the nominator (numerator)
  nominator <- x-min(x)
  # step 2: create the denominator
  denominator <- max(x)-min(x)
  # step 3: divide nominator (numerator) by denominator
  normalize <- nominator/denominator
  # return the value
  return(normalize)
}
normalize(x)

# Using our function how could we get results for C2 ?

data_frame$c1 -> x # change c1 to c2 or c3 and it will be work
x

normalize <- function(x){
  # step 1: create the nominator (numerator)
  nominator <- x-min(x)
  # step 2: create the denominator
  denominator <- max(x)-min(x)
  # step 3: divide nominator (numerator) by denominator
  normalize <- nominator/denominator
  # return the value
  return(normalize)
}
normalize(x)
###add question )
# let's write a function that will find a area(A) and the perimeter(P) of a square 
  # A = s^2 , P = 4s (4*s) same input variable is "s" and add {}
# our square has a side of 8 
#area of square 
## ? why we have to put c ?
Dimsquare  <-function(s) {
  A = s^2
  P = 4*s
  return(c(A = A, P = P))
}

Dimsquare(8)

# The If else statement

#if (condition) {
#  Expr1  (execute expression or command 1)
#} else {
#  Expr2  (execute expression or command 2)
#}


# Example 6

# Set the if-else statement
## so if q is greater 20 you print line 259 or if is not <20 something else  261 
quantity <- 13  # indicate a quantity to process
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')  
}

# Example 7  (Let's write a function that will test for 
# divisibility)

# Is 125 divisible by 3?

# Method 1
x<-125
if (x %% 3 == 0) {
  print("the number is divisible by 3")
} else {
  print("the number is not divisible by 3")
}


# Method 2
## only one input variable 
FunctionA <- function(x)  
  if (x %% 3 == 0) {
    print("the number is divisible by 3")
  } else {
    print("the number is not divisible by 3")
  }
  
FunctionA(125)

FunctionA(2112)

# Multiple Conditions  / else if

# if
# else if
# else

# Example 8
# Write a function that will give a result for three conditions: 
# x > 0, x < 0, and x = 0.

check <- function(x) {
  if (x > 0) {
    result <- "Positive"
  }
  else if (x < 0) {
    result <- "Negative"
  }
  else {
    result <- "Zero"
  }
  return(result)
}

check(-3)
check(32)
check(0)


# Example 9

# Create vector quantity
quantity <-  26
# Create multiple condition statement
if (quantity <20) {
  print('Not enough for today')
} else if (quantity > 20  & quantity <= 30) {
  print('Average day')
} else {
  print('What a great day!')
}



# Using for loops

#For (i in vector) {
#   Exp	
#   }

# Example 1  (Write a for loop that will cube each integer
#             from 1 to 4 inclusive)
## for in the sequence one to 4  each i raised to the power of 3 
for ( i in 1:4) {
  print (i^3)
  }
  
# Example 2  values are not consecutively ordered
# Write a for loop that will cube the following values
# -2,4,7,-1

## ?what is the difference between in and c ?

for (i in c(-2,4,7,-1)) {
  print (i^3)
}

# Example 3  

# Changing Kilometers to miles using a for loop
# Write a for loop that will convert km measurements
# of 12,20,45,80,and 110 to miles

## ?so for loops is a function ?
## know the knm vs miles 
for (km in c(12,20,45,80,110)) {
  print(c(km, .621371*km))
}
  
# Example 10 Using a function to extract items from a list.

multi_return <- function() {
  my_list <- list("color" = "red", "size" = 20, "shape" = "round")
  return(my_list) 
}

a <- multi_return()
 a$color
 
a<- multi_return()
 a$shape

 a<- multi_return()
 a$size
 

# Consider the following tibble. Use two methods to find 
# the median of each column.
 ## this in the book 
 ## 50 random mean=0 ,sd=1 by deafult 
 ## like to find the medain 

 df <- tibble(
   a = rnorm(50),
   b = rnorm(50),
   c = rnorm(50),
   d = rnorm(50)
 )
 df
 
 
 # method 1  
 
 median(df$a)
 median(df$b)
 median(df$c)
 median(df$d)
 
 
 
 
# method 2  The "Special For Loop Method" ## the way do in the book 
 
 output <- vector("double", ncol(df))  # 1. output
 for (i in seq_along(df)) {            # 2. sequence
   output[[i]] <- median(df[[i]])      # 3. body
 }
 output
 
 ## if we want sd just change median to sd
 
#  More examples of the "Special For Loop Method"
 ##seq_along is a function ?
 
 mtcars 
 
 
 output2 <- vector("double", ncol(mtcars))   # 1. output
 for (i in seq_along(mtcars)) {              # 2. sequence
   output2[[i]] <- median(mtcars[[i]])         # 3. body
 }
 output2
 
 
 
 
 
 diamonds ## is a good data to dplyr some of them are charterical 
 
 output3 <- vector("double", ncol(diamonds))  # 1. output
 for (i in seq_along(diamonds)) {            # 2. sequence
   output3[[i]] <- mean(diamonds[[i]])      # 3. body
 }
 output3
 
round(output3,digits = 2) # make the number less 
## what do you mean horizontal frame?

as.data.frame(output3) ## it will change horizontal to vertical 
  
  
  

q()
y

log#natural log 
log10 #common log
