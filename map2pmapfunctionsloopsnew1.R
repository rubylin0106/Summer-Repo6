library(tidyverse)

# A continuation of the usage of map functions 
# map2() ,  pmap()

# The map functions map2() and  pmap() make it possible to iterate over
# multiple arguments simultaneously and list items simultaneously.

# map2(.x, .y, .f, ...)  a function is applied or iterated over two arguments
# simultaneously.  .x and .y are vectors of the same length

# Example 1
##use special function method (map function )

x <- list(12, 14, 15, 18, 19)
y <- list(8, 14, 20, 22, 30)

# Finding iterative sums

## this is going to make 12+8 14+14 and so on....(vertical output )
map2(x,y, ~ .x + .y) 

## another way 
map2_dbl(x,y, ~ .x + .y) # answers are outputted horizontally
# or
map2_dbl(x,y,  `+`) ##`+` 

# Performing miscellaneous iterative calculations

x <- list(12, 14, 15, 18, 19)
y <- list(8, 14, 20, 22, 30)


map2(x,y,  ~ 2*.x - .y)   ##multiple x by 2 12*2-8 14*2-14 ## the pairing of y 

map2_dbl(x,y,  ~ 2*.x - .y)   ##  show horizontally 

map2_dbl(x,y, ~log(.x) + log(.y))



x <- list(12, 14, 15, 18, 19)
y <- list(8, 14, 20, 22, 30)

# Obtaining summary values
map2_dbl(x,y, min) ##get the min value take the x and y and compare x and y ex.12vs 8 it will be 8

map2_dbl(x,y, max)  ##get the max value take the x and y and compare x and y ex.12vs 8 it will be 12

map2_dbl(x,y, sum) ## x+y ,12+8=20 ....

map2_dbl(x,y, diff) ? # does not work !! ## r didn't know which should take 

# methods to find differences
  
map2_dbl(x,y,  ~.x - .y) ##  we can use x -y 12-8=4....

map2_dbl(x,y, ~.y - .x ) ##we can use y -x 8-12=-4....


x <- list(12, 14, 15, 18, 19)  
y <- list(8, 14, 20, 22, 30)


#iterate to find means

map2_dbl(x,y, mean)  # Is this working ? ##this is not working (12+8)/2 should be 10 
##we can create a function to get the mean 

# alternate coding

map2_dbl(x,y, ~ ((.x+.y)/2)) ##add a value and divide the value we have


# prerequisite work investigation of the function rnorm.
# rnorm(n, mu, sd)

rnorm(400,2,.5)->x  ##use often  apply to a sample size or sd (randomly sample value)
x


# Let's double check

mean(x)
sd(x)

# If the mean and the standard deviation are not indicated, they are understood
# to be 0 and 1 respectively

rnorm(400) -> k
k

mean(k)
sd(k)

# Another map2 application

mu <-list(5, 10, -3)
sigma <-list(1, 5, 10)

# Let's execute three sets 5 randomly selected values (normally distributed)
# , having the means and standard deviations indicated above

map2(mu, sigma, rnorm, n = 5)%>% ##we got different it is becuse we did not setseed
  str()


# pmap is a function is applied or iterated over multiple 
# arguments (more than two) simultaneously. Again, the vectors are of the same
# length.

# pmap(.l, .f, ...)

# Example 2

x <- list(12, 14, 15, 18, 19)
y <- list(8, 14, 20, 22, 30)
z <- list(10, 18, 28, 34, 40)

# Find iterative sums

pmap_dbl(list(x,y,z), sum) ## 12+8+10 ...

# Iteratively find minimum values
pmap_dbl(list(x,y,z), min) ##get the min value take the x and y and z compare x and y and z 
                           #ex.12vs 8 vs 10 it will be 8
pmap_dbl(list(x,y,z), max) ##get the min value take the x and y and z compare x and y and z 
                            #ex.12vs 8 vs 10 it will be 12
# Alternative coding

# Find the means
pmap_dbl(list(x,y,z), function(first, second, third) (first + second + third)/3) ##find the mean 

# Calculate output for a specialized function
pmap_dbl(list(x,y,z), function(first, second, third) 2*first + second + third) ## what is this finding ??


# Another application for pmap
# Using iterative code to write descriptions for observations of a data
# frame.

tribble( ~Student,  ~Gender, ~Age, ~GPA,
         "John",   "Male",    20,  3.012,
         "Alice",  "Female",  24,  2.891,
         "Juan",   "Male",    21,  3.772,
         "Beth",   "Female",  19,  3.004,
         "Denise", "Female",  22,  2.778
         ) -> A
A

A %>% 
  pmap_chr(~ str_glue("The student {..1} is a {..2} who is {..3} years old."))
## the student of each student name  is a (gender) who is (the age the number )

A %>% 
  pmap_chr(~ str_glue("{..1} is a {..2} student whose GPA is {..4} 
                      and whose age is {..3}")) 
 

# Practice 

# Generate code that will produce the statement below and similar statement for
# the remaining four students.

# "John's GPA of 3.012 is greater than 2.5" 
## my way
A %>% 
  pmap_chr(~ str_glue("{..1}'s GPA of {..4} is greater than 2.5 }")) 
##professor way 
A %>% 
  pmap_chr(~ str_glue("{..1}s GPA of {..4} is greater than 2.5 }")) 

# using pmap on tribbles

tribble( ~mean, ~sd,  ~n,
        5,       1,   15,
        
        10,      5,   10,
        -3,      10,  20
        ) -> parameters
parameters
## produce value 

pmap(parameters, rnorm) ## I also get the different value it is also not set seed (random ?)



# While loops / nested loops


i <- 1 # start with 1 and  until the i is less than 6 
while (i < 6) {#in seq one to the i you keep add 1  while the i is less than 6 
  print(i)  ## the because we want less than 6 and that is why ut stop at 5
  i = i+1 ## because is while so it will stop at 5 
}


i <- 1
while (i^2 < 100) {#i is going to be squared  so we have to stop at 9 because if 10^2 will be over 100
  print(i)
  i = i+1
}


# Write a for loop that uses the break command to 
# end outputs values after 6 values
x <- 1:11 # we want to get to 11 but we will not get to 11
for (val in x) {
  if (val == 7){
    break #for the for loop it will stop at 7 so it will show 6
  }
  print(val)
}


# Write a for loop that uses the next command to skip over the output value
# of 7 and then continues the output sequence.

x <- 1:11
for (val in x) {
  if (val == 7){
    next #we will jump over 7 we will still reach to 11 but jump over 7 and continue to 11
  }
  print(val)
}

# Nested Loops

# A nested loop is a loop within a loop. Sounds simple, but there are a 
# variety of ways you can create nested loops. Let's check some out and
# remember that proper indentation is key.

# Here is the general format of a nested loop:

# loop (condition) {
#   block of instructions
#   loop (condition) {
#     block of instructions
#   }
# }

# Nested Loop 1

for (k in 1:3) {#k is going from  1to 3 seq  k1 goes to l1 k1 goes to l2 
  for (l in 1:2) {#i is go from 1 to 2 
    print(paste("k =", k, "l = ", l))# one will to one 
  }#the realtionship between k element  and l element 
}

# Interpretation:
# k->l   k->l   k->l   k->l   k->l   k->l
# 1->1,  1->2,  2->1,  2->2,  3->1,  3->2


# Nested Loop 2

for(i in 1:4)# seq one to 4
{
  for(j in 1:4)  # Interpretation: 1*1, 1*2, 1*3, 1*4, 2*1, 2*2, 2*3,
                 #...4*1,4*2,4*3,4*4 ##seq one to 4
  {
    print(i*j)#mutilple 
  }
}

# Nested Loop 3

num_vector<-c(1,2,3)# one will be assoicate abc and 2, 3 will als0 do that 
num_vector

alpha_vector<-c("a", "b", "c")
alpha_vector

for(num in num_vector) { # outer loop 
  print(num) 
  for(letter in alpha_vector) # inner loop
    print(letter)
}



# Nested loops to create a matrix
# Let's create a 4 by 4 matrix whose row and column entries are products.

#  What is a matrix ?

#  A matrix is a rectangular array of values, characterized by rows and
#  columns

# Below is a 3 by 4 matrix (3 rows and 4 columns)


#     2   4   -3   6
#     1   3    5  -1
#     6   0    3   8

#1

matrix1 = matrix(nrow=4, ncol=4) # create a 4 x 4 matrix(4 rows and 4 columns)
for(i in 1:nrow(matrix1))        #// Assigned a variable 'i' for each row
{
  for(j in 1:ncol(matrix1))      #// Assigned a variable 'j' for each column
  {
    matrix1[i,j] = i*j # how to generate the matrix           #// calculating product of two indexes
  }
}
print(matrix1)


matrix1 = matrix(nrow=4, ncol=3) # create a 4 x 3 matrix(4 rows and 3 columns)
for(i in 1:nrow(matrix1))        #// Assigned a variable 'i' for each row
{
  for(j in 1:ncol(matrix1))      #// Assigned a variable 'j' for each column
  {
    matrix1[i,j] = i-j # how to generate the matrix           #// calculating product of two indexes
  }
}
print(matrix1)
#2 (professor recommand )

# What are the characteristics of the matrix produced by the 
# coding below?

z <- matrix( nrow = 3, ncol = 3)# how many rows and columns 3 by 3
for (m in 1:3) {#3 by 3 
  for (n in 1:3) {#3 by 3
    z[m, n] <- -1*(m + n)# 1+1*-1 2+2*-1
  }
}
print(z)




q()
y
