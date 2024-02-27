
library(SSBtools)
library(GaussSuppression)

load("data/tourism.RData")
BuildTable <- function(data, ...) {
  SuppressSmallCounts(data, ..., maxN = NULL, primary = FALSE)
}


# Exercise 1 ---------------------------------------------------------------

## 1a.
#  Use formula create a two-way frequency table of people per municipality and
#  gender based on the tourism data set.

# replace formula = NULL
BuildTable(data = tourism, formula = NULL)

## 1b.
#  We have seen that multiplication (*) in formula generates a table that can
#  also be generated using dimVar. Create the same table as in 1a using dimVar

# replace dimVar = NULL
BuildTable(data = tourism, dimVar = NULL)


# Exercise 2 ---------------------------------------------------------------

# Create a table consisting of only the totals for municipality and gender using
# the torism data set. Which is better suited, dimVar or formula?

# replace either formula = NULL or dimVar = NULL
BuildTable(data = tourism, formula = NULL, dimVar = NULL)


# Oppgave 3 ---------------------------------------------------------------

# We now wish to create a table over municipality and region without any totals,
# i.e., no municipality total, gender total, or population total.

# replace formula = NULL
BuildTable(data = tourism, formula = NULL)

#####################################
#####      Linked tables       ######
#####################################

# If one can, one should always try to suppress all tables based
# on the same data at the same time: multiple tables can share cells. Suppressed
# cells should be consistent across tables, and tables should not be able
# to be used to disclose suppressed cells in other tables.

# In the following exercises we will practice defining multiple tables at the 
# same time using the interface used in GaussSuppression.


# Exercise 4 ---------------------------------------------------------------

# We wish to publish two tables based on the tourism data set:
#   1. One two-way table over municipality and gender,
#   2. One two-way table over county and gender.

## 4a.
# Define two model formulas, one for each of the tables. We shall use them later
# in the exercises, so save them as variables. Feel free to use the helper function
# BuildTables to check your solutions.

# replace NULL with suitable formulas
f1 <- NULL 
f2 <- NULL

BuildTable(data = tourism, formula = f1)
BuildTable(data = tourism, formula = f2)

## 4b.
# Define one model formula that combines both tables. We shall use the result
# in the following exercises, so save the result of BuildTable as a data.frame.

# replace NULL with a suitable formula
f3 <- NULL
linked1 <-
  BuildTable(data = tourism, formula = f3)

## 4c.
# The package SSBtools contains a useful function called FormulaSelection. This
# can be very helpful when defining multiple tables using a single model formula.
# It allows us to extract subtables generated via formula. The syntax is 
# FormulaSelection(data.frame, formula)

# Use FormulaSelection to retrieve the two tables defined in 4a using the linked
# table defined in 4b.


# Exercise 5 ---------------------------------------------------------------

# Experiment using the formula interface. Feel free to use the  `social` eller `pregnant` 
# data sets to see how it operates with aggregated data, or magnitude tables.
