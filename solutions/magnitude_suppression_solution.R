# Exercises for suppression of magnitude tables

# load relevant packages ----------------------------------------------

library(SSBtools)
library(GaussSuppression)


# load the data sets ------------------------------------------------------

load("data/overnights.RData")
load("data/sdc_cars.RData")


# Some help for inspecting output ----------------------------------------------------

# If you run the following code, you can use a Print function
# This function might make  inspecting the output of GaussSuppression
# easier by replacing FALSE with - in the suppressed and primary columns.

source("R/Print.R")

# Here are some examples of the functions we will use:
output1 <-
  SuppressFewContributors(sdc_cars,
                          numVar = "value",
                          formula = ~ months + sector,
                          maxN = 85)
output2 <-
  SuppressDominantCells(
    sdc_cars,
    numVar = "value",
    dimVar = "sector",
    n = 1,
    k = 5
  )

Print(output1)
Print(output2)

# The number of suppressed cells can be counted like this:
sum(output1$primary)
sum(output1$suppressed)

sum(output2$primary)
sum(output2$suppressed)



# Exercise 0 ---------------------------------------------------------------
# Recall that you can look at the documentation of SuppressFewContributors
# and SuppressDominantCells with  ?SuppressFewContributors and
# ?SuppressDominantCells.



# Exercise 1 ---------------------------------------------------------------

## 1a.
#  Based on the sdc_cars dataset, create a complete two-way table (that is, with
#  all marginals/totals) over municipality and sector. Use the dimVar interface.
#  Use the numerical variable "value" for building the magnitude table.
#  All cells consisting av at three or fewer contributions from the input data 
#  should be primary suppressed. 

# replace NULL and ... with relevant code
SuppressFewContributors(data = sdc_cars,
                        numVar = "value",
                        dimVar = c("municipality", "sector"),
                        maxN = 3)



## 1b
# In the previous exercise, each row in sdc_car was counted as a unique contributor.
# In business statistics, it is quite common to count contributions according to
# an identifier (a conglomerate can, for example, own multiple companies).

# We now wish to build the same table as in 1a, but primary suppress cells with
# 3 or fewer contributions based on car_brand. Use contributorVar to achieve this.


# replace  ... with relevant code
SuppressFewContributors(data = sdc_cars,
                        numVar = "value",
                        dimVar = c("municipality", "sector"),
                        contributorVar = "car_brand",
                        maxN = 3)

## 1c
# Repeat the same method using the formula interface to construct the table.

# replace  ... with relevant code.
SuppressFewContributors(data = sdc_cars,
                        numVar = "value",
                        formula = ~ municipality * sector,
                        contributorVar = "car_brand",
                        maxN = 3)


# Exercise 2 ---------------------------------------------------------------

## 2a.
#  Based on the sdc_cars data set, create a complete two-way table (that is, with
#  all marginals/totals) over municipality and sector. Use the formula interface.
#  Ensure that the following cells are primary suppressed:
#   - The largest contributor are more than 60% of a cell's value, or
#   - the two largest contributors are more than 80% of the cell's value.
# save the output in a new variable out1


# replace NULL and ... with relevant code
out1 <-
  SuppressDominantCells(
    data = sdc_cars,
    n = c(1,2),
    k = c(60, 80),
    numVar = "value",
    formula = ~ municipality * sector
  )


## 2b.
# Use the same suppression rules to suppress a complete two-way table over
# county and sector.
# save the output as a new variable out2



# replace  ... with relevant code
out2 <- SuppressDominantCells(
  data = sdc_cars,
  n = c(1,2),
  k = c(60, 80),
  numVar = "value",
  formula = ~ county * sector
)

## 2c.
# Use the formula interface to suppress the two tables in 2a and 2b simultaneously.
# Save the result as a new variable out3.

# replace  ... with relevant code
out3 <- SuppressDominantCells(
  data = sdc_cars,
  n = c(1,2),
  k = c(60, 80),
  numVar = "value",
  formula = ~ (county + municipality) * sector
)
## 2d.
# Use FormulaSelection (as described in the exercises about the formula interface)
# to extract the two tables in 2a and 2b from out3 created in 2c.


# replace  ...
FormulaSelection(out3, formula = ~ municipality * sector)
FormulaSelection(out3, formula = ~ county * sector)

#
# Do you see any differences between the results from 2a, 2b, and 2c? We shall
# investigate this more in the next exercises.

"There is a difference between cell suppressions in 2a and 2c, since in 2c the totals
(i.e. for county) are publised and thus the suppression pattern for municipality 
needs to take this into account. There is no difference between cell suppression in 2b and 2c."

# Exercise 3 ---------------------------------------------------------------


## 3a
# Based on the overnights data set:
# Create a one-way table that only contains totals for region and the population
# total. Use the formula interface, and sum the values in the overnights variable.
# All cells where the largest contributor has 85% of the cell value should be
# primary suppressed.

# Use org_name as the contributor variable.


# replace  ... with relevant code
SuppressDominantCells(data = overnights,
                      n = 1, 
                      k = 85, 
                      numVar = "overnights",
                      formula = ~ region, 
                      contributorVar = "org_name")

## 3b
# Repeat 3a, but create a one-way table of county instead of region.

# replace  ... with relevant code
SuppressDominantCells(data = overnights,
                      n = 1, 
                      k = 85, 
                      numVar = "overnights",
                      formula = ~ county, 
                      contributorVar = "org_name")

## 3c
# Create the tables in 3a and 3b simultaneously using the formula interface, and
# suppress using the same rules as 3a and 3b.

# replace  ... with relevant code
SuppressDominantCells(data = overnights,
                      n = 1, 
                      k = 85, 
                      numVar = "overnights",
                      formula = ~ region + county, 
                      contributorVar = "org_name")

# Can you see a difference between the results from 3c and 3a and 3b? Why is it 
# unsafe to publish the results from 3a and 3b together?

"The tables produced in 3a and 3b are linked, and can not be published together. 
The suppressed values in region 5014 can be calculated if one subtract the 
published values of the regions inclued in county 50 (all with region name of the form 50XX)
from the publised total of county 50."


# Exercise 4 ---------------------------------------------------------------

# In these exercises we will use a smaller version of the overnights data set, 
# which we create with the following code:

overnights1 <-
  overnights[overnights$type4 == "1" &
               overnights$month %in% c("7", "8", "9"),]



## 4a
# Based on the new data set overnights1:
# Simultaneously create and suppress the following tables:
# 1. a one-way table containing the totals for municipality
# 2. a complete two-way table for tourism_region and month.

# Use the formula interface. 
# The following cells should be primary suppressed:
#  - the largest contribution is more than 60% of the cell value "overnight", or
#  - the two largest contributions are more than 70% of the cell value "overnight".
# As in the previous exercise, contributions are counted per organization (org_name)


# replace  ... with relevant code
# 1.
SuppressDominantCells(data = overnights1, 
                      numVar = "overnights",
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = "overnights",
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")

## 4b
# Create the same tables as in 4a, however the primary suppression should be as
# follows:
#  - the largest contribution is more than 60% of the cell value "revenue", or
#  - the two largest contributions are more than 70% of the cell value "revenue".

# Did the suppression change?



# replace  ... with relevant code
# 1.
SuppressDominantCells(data = overnights1, 
                      numVar = "revenue",
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = "revenue",
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")


"When the dominance rule is applied to the revenue variable, we obtain a table 
that contains more suppressions compared to the table that sum up the overnights variable"

## 4c

# Create the same tables as before (see 4a), but make sure that both "overnights"
# and "revenue" are summed up with a single function call.
# Hint: numVar can include multiple variable names


# replace  ... with relevant code
# 1.
SuppressDominantCells(data = overnights1, 
                      numVar = c("overnights", "revenue"),
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = c("overnights", "revenue"),
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      contributorVar = "org_name")



## 4d
# Now repeat the suppression from 4a, but include both "revenue" and "overnights"
# as numerical variables in numVar. What happens?

# erstatt  ... med mer kode
SuppressDominantCells(data = overnights1, ...)

"The function will sum up both variables, but apply suppression only to the first of them."


#####################################
#####     Bonus exercises       #####
#####################################


# Exercise 5 ---------------------------------------------------------------


## 5a
# Repeat exercise 4, but remove contributorVar and add allDominance = TRUE.

#  allDominance = TRUE adds more information to the output, but works best without
#  contributorVar.

# What is the danger of not using contributorVar? 

SuppressDominantCells(data = overnights1, 
                      numVar = "overnights",
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = "overnights",
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)



# 1.
SuppressDominantCells(data = overnights1, 
                      numVar = "revenue",
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = "revenue",
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)



# 1.
SuppressDominantCells(data = overnights1, 
                      numVar = c("overnights", "revenue"),
                      formula = ~ municipality,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)

# 2. 
SuppressDominantCells(data = overnights1, 
                      numVar = c("overnights", "revenue"),
                      formula = ~ tourism_region * month,
                      n = c(1, 2), 
                      k = c(60, 70), 
                      allDominance = TRUE)


"The danger of not using contributorVar is that organizations that contribute to 
overnights and revenue in multiple municipalities (which is the most detailed 
geographical variable) may be dominant when summing overnights/revenue at higher 
levels of geographical areas (region/tourism_region/county). The same is true for 
organizations that own multiple accommodations within the same municipality."

## 5b
# Based on the output from 5a, change the dominance parameters slightly to experiment
# with the primary suppression and its effects.


# Exercise 6 ---------------------------------------------------------------

# Even if you are using SuppressDominantCells, you can add more primary rules,
# such as the few contributors rule.
#
# To do this, you must add 
#     primary = c(DominanceRule, NContributorsRule)
# to the function call. You must also add a maxN threshold for the few contributors
# rule.

# Repeat some of the above exercises with these changes.

SuppressDominantCells(
  data = overnights1,
  numVar = "overnights",
  formula = ~ tourism_region * month,
  n = c(1, 2),
  k = c(60, 70),
  allDominance = TRUE,
  primary = c(DominanceRule, NContributorsRule),
  maxN = 6
)


# Exercise 7 --------------------------------------------------------------

# You can also apply the p% rule when using the SuppressDominantCells function.
# In the future, the p% might get its own function in the GaussSuppression package.
# In order to use the p% rule, for example for p = 10, you provide the parameter
# pPercent = 10. For example:
# SuppressDominantCells(
#   data = overnights,
#   formula = ~ municipality,
#   numVar = "overnights",
#   pPercent = 10
# )

# Repeat some of the previous exercises, but use the p% rule instead of
# the dominance rule.

# Exercise 8 ---------------------------------------------------------------

# Experiment! Feel free to use other data sets, and change parameters to see how
# this affects the suppression.