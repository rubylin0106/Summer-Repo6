
# Review of Basic Statistics

library(tidyverse)
#install.packages("Sleuth3")
library(Sleuth3)
library(broom)

# This is not an attempt to cover all important concepts in a standard statistics
# course, we will only focus on and feature key elements of statistics needed for
# our course

# Let's generate a normal curve

x <- seq(-3, 3, length=1000)
y <- dnorm(x, mean=0, sd=1)
plot(x, y, type="l", lwd= 2)

# what is the distant of -1 to 1 to the curve 
# 1 Find the height of the normal curve for an x value of -1
#dnorm ( the distance of a to b)
dnorm(x = -1, mean = 0, sd = 1) # the function dnorm produces the height of the
                                # the normal curve at a specified value. # will give the distant 


# note that the symmetric property of the normal curve will give the same
# answer for an x value of 2.

dnorm(x = 1, mean = 0, sd = 1)

# 2 The rnorm function will randomly produce a specified number of normally distri-
# buted values that are randomly selected, given a mean and a standard deviation.

rnorm(n = 550, mean = 1, sd = 1) # randomly produce 550 normal distributed 

rnorm(n = 200, mean = 3, sd = 2.75) # randomly produce 200 normal distributed 

# 3 The pnorm function will produce the area under the normal curve that is to the
# left of a given value.  This area is also a probability designation.

pnorm(q = 2, mean = 1, sd = 1) 

# 3a For a normal distribution with a mean of 40 and a standard deviation of 5,
#    Find the area under the curve that is less than or equal to 43.
pnorm(q = 43, mean = 40, sd = 5) # how much the curve is below 43

# 3b Test scores are normally distributed with a mean of 70 and a standard
# deviation of 4.75. Find the probability that a student will score above 79 on
# the test.
pnorm(q = 79, mean = 70, sd = 4.75) # this will give the probability of getting a
# score that is below 79. # this one is telling below 79

# Now subtract your answer from 1

1 - 0.9709364 # and this one is above 

# 3c Test scores are normally distributed with a mean of 70 and a standard
# deviation of 4.75. Find the probability that a student will score between 65 and
# 85 on the test.

#  Step 1  Find the probability for getting less than the upper bound
pnorm(q = 85, mean = 70, sd = 4.75)     # 0.9992054

#  Step 2  Find the probability for getting less than the lower bound
pnorm(q = 65, mean = 70, sd = 4.75)    # 0.1462549

# low q is 65 and high 1 is 85
#  Step 3  Subtract!!  Step 1 answer -  Step 2 answer  0.9992054 - 0.1462549

0.9992054 - 0.1462549 # and this one can tell us the area between lower bound  and higher bound


# 4 qnorm is called the quantile function. Given a mean and a standard deviation,
# it will give a value that an indicated probability (area) is to the left of.
qnorm(p = 0.8413, mean = 60, sd = 5) #is to the left of horizal x 

#4a  Test scores are normally distributed with a mean of 75 and a standard 
# deviation of 3.25. 65% of the scores are less than what score?
qnorm(p = 0.65, mean = 75, sd = 3.25) # what is the number of x

#4b  Test scores are normally distributed with a mean of 75 and a standard 
# deviation of 3.25. 65% of the scores are greater than what score?

 qnorm(p = 0.35, mean = 75, sd = 3.25) # less than case 


# T Distribution

 # The t-distribution shows up a lot in Statistics.
 
 # It is also bell-curved but has "thicker tails" (more extreme observations are 
 # more likely).
 # It is always centered at 0.
 # It only has one parameter, called the "degrees of freedom", which determines
 # how thick the tails are.
 # Smaller degrees of freedom mean thicker tails, larger degrees of freedom means
 # thinner tails.
 # If the degrees of freedom is large enough, the t-distribution is 
 # approximately the same as a normal distribution with mean 0 and variance 1.

# Plotting a T distribution
 
 t.values <- seq(-4,4,.1)
 plot(x = t.values,y = dt(t.values, 2), type = "l", lwd = 2,
      ylim = c(0,.4), xlab = "t", ylab = "f(t)")
 
 # or
 
 t.values <- seq(-4,4,.1)
 plot(x = t.values,y = dt(t.values, 2), type = "l", lty = "dotted", lwd =2,
      ylim = c(0,.4), xlab = "t", ylab = "f(t)")
 
 # Let's find distances for t distribution values to the curve !!
 
 dt(x = -2, df = 2) # find -2 to the curve 
 
 
 dt(x = 0, df =2)
 
 # Finding t distribution probabilities
 
 pt(q = 2, df = 2) # the area of beneath to 2
 
 
 # Finding t distribution values
 
 qt(p = 0.9082, df = 2)
 
 # Hypothesis Testing (T test)
 
 #  Population                #  Sample
 #    4000                        250
 
 #One sample t test example # take home exam 
 # A random sample from a population has been obtain. Should we reject the
 # Null hypothesis that the mean of the population is 100?

 
 c(119,131,115,107,125,96,128,99,103,103,105,109)->k
 k
 
 # Lets check common conditions for using a t test for Hypothesis Testing
 # Check for outliers in the sample by looking at the boxplot.
 boxplot(k)
 
 # Check for normality
 qqnorm(k)
 qqline(k)
 
 
 # H(0) :  population mean = 100
 # H(A) :  population mean does not equal 100
 
 t.test(k,mu=100, alternative = "less", conf.level = .95)
 t.test(k,mu=100, alternative = "greater", conf.level = .95)
 #Two Sample T test
 
 # Pop A                     Pop B
 
 # is the pop mean for A = pop mean for B
 
 # Two sample t test example
 # Two random samples from different populations have been obtain.Should we 
 # reject the Null hypothesis that the means of the populations are equal?
 
 # Assume that the required conditions for executing this test have been met.
 
 # We have two populations PoP L and  PoP D
 
 # H(O) : population mean for L = population mean for D  (Null hypothesis)
 # H(A) : population mean for L does not equal the population mean for D
 #        (Alternative Hypothesis)
 
 # The two samples are given below
 
 c(119,131,115,107,125,96,128,99,103,103,105,109)->SL
 SL
 
 c(120,140,112,109,114,116,99,108,109,111,109,131,117,101)->SD
 SD
 
 t.test(SL,SD, mu = 0, var.equal=FALSE,)
 
 # If your p value is > than .05 you cannot reject the Null hypothesis
 # If 0 is in your confidence interval you cannot reject the Null hypothesis.
 
 
 
 # ANOVA (Analysis of Variance)  One Way
 
 # Analysis of Variance (ANOVA) is an inferential method
 # used to test the equality of three or more population means.
 
 # Requirements to Perform a One-Way ANOVA Test
 #   1) There must be k simple random samples, one from each of
 # the k populations
 #   2) The k samples must be independent of each other
 #   3) The populations must be normally distributed
 #   4) The populations must have the same variance
 
 # Example
 # three random samples from three populations
 
 #    a        b          c
 
 #    4        7          10
 #    5        8          10
 #    6        9          11
 #    6        7          11
 #    4        9          13
 
 #  null hypothesis: The three population means are equal 
 #  Mua = Mub = Muc
 #  alternative hypothesis:  At least one of the means is
 #  different from the others
 
 # We will conduct the F test in order to determine if
 # null hypothesis should be rejected or not.
 #  n = 15, k = 3,  c = 5
 
 # Step 1  find the mean for the entire data set.
 #  (4+5+6+6+4+7+8+9+7+9+10+10+11+11+13) / 15 = 8
 
 # Step 2  Find the sample mean for each sample
 #  y(bar)a= 25/5 = 5   y(bar)b = 40/5 = 8   y(bar)c = 55/5 = 11
 
 # Step 3  Find each sample variance
 # sample variance for a :  ((4-5)^2 + (5-5)^2 + (6-5)^2 + (6-5)^2 + 
 # (4-5)^2))/ (5-1) =  1
 # sample variance for b :  ((7-8)^2 + (8-8)^2 + (9-8)^2 + (7-8)^2 + 
 # (9-8)^2))/ (5-1) =  1
 # sample variance for c :  ((10-11)^2 + (10-11)^2 + (11-11)^2 + 
 # (11-11)^2 + (13-11)^2))/ (5-1) = 1.5
 
 # Step 4  Compute the Sum of Squares due to Treatment SST
 #         (the number of elements of the group multiplied by the
 #          square of the difference between the group mean and 
 #          the total mean)  Find the sum of each case
 #         SST = 5(5-8)^2 + 5(8-8)^2 + 5(11-8)^2  = 90
 
 #         Compute the Sum of Squares due to Errors   SSE
 #         (degrees of freedom for each group multiplied by each
 #          variance.  Find the sum of the cases)
 #         
 #         SSE = (5-1)1 + (5-1)1 + (5-1)(1.5)  =  14
 
 # Step 5  Compute the Mean Square due to Treatment MST
 #         MST =  SST/(k-1)   90/(3-1) = 45
 #         Compute the Mean Square due to Error  MSE
 #         MSE =  SSE/(n-k) = 14/(15-3) = 1.1667
 # Step 6  Compute the F statistic  MST/MSE = 45/1.1667 = 38.57
 
 #  Your results are typically organized in a table as follows:
 
 #  Source of Variation      Sum of Squares    Degrees of Freedom   Mean Square   F-Test Statistic
 #        Treatment                90                  2                45             38.57
 #        Error                    14                  12               1.1667
 #        Total                    104                 14
 # Step 7  Find the F critical value by using the degrees of freedom
 # the F distribution table.
 #         If F-Test Statistic > F critical, you are to reject 
 #         the null hypothesis.
 #         If F-Test Statistic < F critical, you fail to reject 
 #         the null hypothesis.
 
 # Step 8  When you go to the standard F distribution table,
 # using the degrees of freedom of 2 and  12 you find that the
 # F critical = 3.89
 
 # Since F-Test Statistic > F critical you reject the null hypothesis.
 
 # Now use R to get the same result.
 
 #    a        b          c
 
 #    4        7          10
 #    5        8          10
 #    6        9          11
 #    6        7          11
 #    4        9          13
 
 a<- c(4,5,6,6,4)
 a
 
 b<- c(7,8,9,7,9)
 b
 
 c<- c(10,10,11,11,13)
 c
 
 CombindGroups <- data.frame(cbind(a,b,c))
 CombindGroups
 
 StackedGroups <-stack(CombindGroups)
 StackedGroups
 
 aov(values~ind, data = StackedGroups) ->Are
 Are
 summary(Are)
 
 # Since your p value is less than .05, we will reject the
 # null hypothesis.
 
 
q()
y
