library(SSBtools)
library(GaussSuppression)


load("data/social.RData")
load("data/tourism.RData")
load("data/overnights.RData")
load("data/pregnant.RData")


# Exercise 0 ---------------------------------------------------------------

# Explore the data sets. Which are microdata, and which are already aggregated?
#
# Open the documentation of SuppressSmallCounts by running
# ?SuppressSmallCounts. It is OK not to understand everything, but it contains
# a lot of useful information for the future.

# In the following exercises we will explore using dimVar for building tables.
# How we then protect them with cell suppression, we will explore in later
# exercises.

# The functions in GaussSuppression can also be useful for simply defining
# tables without any cell suppression. To do this, we simply need to set that
# no cells should be primary suppressed. To make our lives a little easier for
# these exercises, we do this by defining the following function.
BuildTable <- function(data, ...) {
  SuppressSmallCounts(data, ..., maxN = NULL, primary = FALSE)
}

# Exercise 1 ---------------------------------------------------------------

# Use dimVar to create a frequency table with two spanning variables:
# municipality and main_income based on the social data set.

# replace dimVar = NULL
BuildTable(data = social,
           dimVar = NULL)


# Exercise 2 ---------------------------------------------------------------

# Use dimVar to create a frequency table with the following spanning
# variables based on the tourism data set: municipality, tourism_region, age, and gender.
# How many spanning variables does the resulting table have?

# replace dimVar = NULL
BuildTable(data = tourism,
           dimVar = NULL)



# Exercise 3 ---------------------------------------------------------------

# Use dimVar to create a two way magnitude table over the overnights data set.
# The spanning variables should be county and type2, and the response variable
# (the numerical variable to be summed up per cell) should be revenue.

# replace dimVar = NULL and numVar = NULL
BuildTable(data = overnights,
           dimVar = NULL,
           numVar = NULL)


# Exercise 4 ---------------------------------------------------------------

# Use dimVar to create a frequency table over county and gender based on the 
# pregnant data set. What happens you provide freqVar as a parameter?

# replace dimVar = NULL and freqVar = NULL
BuildTable(data = pregnant,
           dimVar = NULL,
           freqVar = NULL)

# replace dimVar = NULL
BuildTable(data = pregnant,
           dimVar = NULL)


# Exercise 5 ---------------------------------------------------------------

# Let us add a new variable to the social data set:
social$main_income2 <-
  ifelse(social$main_income == "wages", "work", "nowork")

# GaussSuppression can detect multiple complex hierarchical relationships between
# variables.
# Use dimVar to create a frequency table of number of people per county,
# municipality, k_group, main_income, and the new variable main_income2 based on
# the social data set.

# replace dimVar = NULL
BuildTable(data = social,
           dimVar = NULL)
