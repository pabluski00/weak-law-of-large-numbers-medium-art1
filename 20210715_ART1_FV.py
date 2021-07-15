###  P. KOWALSKI KUTZ
###  2021 / 07 / 15
###  ART1 
###  WEAK LAW OF LARGE NUMBERS (WLLN)

### IMPORTING THE NECESSARY BASIC MODULES
import os
import math
import numpy as np
import matplotlib.pyplot as plt
import statistics as sts

import rpy2.robjects as robjects
data = robjects.r("""
set.seed(123)
x <- runif(5000, 0, 1)""")

our_range = range(1, 5001)
uniform_objects = np.array(data)

plt.scatter(our_range, uniform_objects, marker=".", color="#000080", s=1)
plt.title("Uniform observations")
plt.xlabel("1:5000")
plt.ylabel("Observations' values")

def calculating_average(list1, n):
    return (sts.mean(list1[0:n]))

################################################################################
##########################     WEIBULL(1,1)     ################################

def inversefunction_weibull11(x):
    return (-math.log(1-x))
i = list(range(1,5001))
yi = i
for item in i:
    yi[item-1] = inversefunction_weibull11(uniform_objects[item-1])
sample_means = list(range(1,5001))
for item in sample_means:
    sample_means[item-1] = calculating_average(yi, item)


plt.plot(yi, 'o', color="#000080", markersize=1)
plt.title("Simulation of 5000 observations from Weibull(1,1)")
plt.xlabel("n")
plt.ylabel("$x_i$")

plt.scatter(our_range, sample_means, marker=".", color="#000080", s=1)
plt.axhline(y=1, color='r', linestyle='-', linewidth=1)
plt.title("Sample means of 5000 observations from Weibull(1,1)")
plt.xlabel("n")
plt.ylabel("Sample means")


################################################################################
#######################     RAYLEIGH(sigma=1)      #############################

def inversefunction_rayleigh1(x):
    return math.sqrt(-2*math.log(1-x))
i = list(range(1,5001))
yi = i
for item in i:
    yi[item-1] = inversefunction_rayleigh1(uniform_objects[item-1]) 
sample_means = list(range(1,5001))
for item in sample_means:
    sample_means[item-1] = calculating_average(yi, item)


plt.plot(yi, 'o', color="#000080", markersize=1)
plt.title("Simulation of 5000 observations from Rayleigh(1)")
plt.xlabel("n")
plt.ylabel("$x_i$")

plt.scatter(our_range, sample_means, marker=".", color="#000080", s=1)
plt.title("Sample means of 5000 observations from Rayleigh(1)")
plt.xlabel("n")
plt.ylabel("Sample means")
plt.axhline(y=math.sqrt(math.pi/2), color='r', linestyle='-', linewidth=1)

################################################################################
##########################     Cauchy(1,1)      ################################

def inversefunction_cauchy11(x):
    return (1 + math.tan((math.pi*(x-0.5))))
i = list(range(1,5001))
yi = i
for item in i:
    yi[item-1] = inversefunction_cauchy11(uniform_objects[item-1])
sample_means = list(range(1,5001))
for item in sample_means:
    sample_means[item-1] = calculating_average(yi, item)


plt.plot(yi, 'o', color="#000080", markersize=1)
plt.title("Simulation of 5000 observations from Cauchy(1,1)")
plt.xlabel("n")
plt.ylabel("$x_i$")

plt.scatter(our_range, sample_means, marker=".", color="#000080", s=1)
plt.title("Sample means of 5000 observations from Cauchy(1,1)")
plt.xlabel("n")
plt.ylabel("Sample means")