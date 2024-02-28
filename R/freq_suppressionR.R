# Exercises for suppression of frequency tables

# Load the relevant packages ----------------------------------------------

library(SSBtools)
library(GaussSuppression)


# Load the data sets ------------------------------------------------------

load("data/tourism")
load("data/social.RData")
load("data/pregnant.RData")
load("data/pregnant_micro.RData")


# Exercise 0 ---------------------------------------------------------------
# Recall that you can always check the documentation of SuppressSmallCounts using
# the command ?SuppressSmallCounts.

# Exercise 1 ---------------------------------------------------------------

## 1a.
#  Based on the pregnant_micro data set, create a complete two-way frequency table
#  (that is, with all marginals) over the variables age and pregnant. Use the
#  dimVar interface.
#  Make sure that all cell values less than or equal to 3 are primary suppressed.

# replace NULL and ... with relevant code
SuppressSmallCounts(data = pregnant_micro,
                    dimVar = NULL,
                    ...)
## 1b.
#  Based on the pregnant_micro data set, create a complete two-way frequency table
#  (that is, with all marginals) over the variables age and pregnant. Use the
#  dimVar interface.
#  Make sure that all cell values greater than 0 and less than or equal to 3 are
#  primary suppressed.

# replace NULL og ... with relevant code
SuppressSmallCounts(data = pregnant_micro,
                    dimVar = NULL,
                    ...)

## 1c.
#  Inspect the results from 1a and 1b. Which of the two versions do you think is
#  better? Should one protect zeros? All zeros?
#  We will go into more detail around the challenges one faces with zeros later
#  in the course.


#####################################
#####      Linked tables       ######
#####################################

# Exercise 2 ---------------------------------------------------------------

## 2a.
#  Create a one-way frequency table over main_income in the social data set.
#  All cell values less than or equal to 3 should be primary suppressed.

# replace ... with relevant code
SuppressSmallCounts(data = social,
                    ...)

## 2b.
#  Create a two-way table over k_group and main_income without totals.
#  All cell values less than or equal to 3 should be primary suppressed.

# replace ... with relevant code
SuppressSmallCounts(data = social,
                    ...)

## 2c.
#  Can the tables from 2b and 2a be published together?

# Oppgave 3 ---------------------------------------------------------------

## 3a.
#  Based on the pregnant data set, create a complete two-way frequency table
#  (that is, with all marginals) over age and pregnant. Use the formula interface.
#  All cell values less than or equal to 3 should be primary suppressed. and save
#  both the formula and the result in their own variables.

# replace ... and NULL with relevant code
f1 <- NULL
t1 <- SuppressSmallCounts(data = pregnant,
                          formula = f1,
                          ...)
## 3b.
#  Based on the pregnant data set, create a three-way table over age, county, and
#  pregnant. The only totals to be published are the population total and the
#  county totals. Use the formula interface.
#  All cell values less than or equal to 3 should be primary suppressed. and save
#  both the formula and the result in their own variables.

# replace ... and NULL with relevant
f2 <- NULL
t2 <- SuppressSmallCounts(data = pregnant,
                          formula = f2,
                          ...)

## 3c.
#  We now wish to protect the tables from 3a and 3b at the same time. One way of
#  doing this is by creating all combinations of all variables (here: county, age,
#  and pregnant). Create this table, and ensure that all; cell values less than
#  or equal to 3 are primary suppressed. Save both the formula and the result in
#  their own variables.

# replace ... and NULL with relevant
f3 <- NULL
t3 <- SuppressSmallCounts(data = pregnant,
                          formula = f3,
                          ...)

## 3d.
#  Using the results from exercises 3a and 3b, create a linked table using a single
#  formula as we have seen earlier in this course.
#  All cell values less than or equal to 3 should be primary suppressed. and save
#  both the formula and the result in their own variables.

# replace ... and NULL with relevant code
f4 <- NULL
t4 <- SuppressSmallCounts(data = pregnant,
                          formula = f4,
                          ...)

# Here we can see the difference between running the methode containing exactly
# the cells we wish to publish, and running the method on all possible combinations:
cat("number suppressed in table 1, exercise 3c: ",
    sum(FormulaSelection(t3, f1)$suppressed),
    "\n")
cat("number suppressed in table 1, exercise 3d: ",
    sum(FormulaSelection(t4, f1)$suppressed),
    "\n")
cat("number suppressed in table 2, exercise 3c: ",
    sum(FormulaSelection(t3, f2)$suppressed),
    "\n")
cat("number suppressed in table 2, exercise 3d: ",
    sum(FormulaSelection(t4, f2)$suppressed),
    "\n")

# there are fewer suppressions in table 2 when running the method on exactly those
# cells that will be published!


# Exercise 4 ---------------------------------------------------------------

# In this exercise we will explore why it is important to protect linked tables
# simultaneously. Now we will consider any cell value less than or equal to 4
# as unsafe.

## 4a.
#  Define formulas for the following two tables over the tourism data set:
#   1. One two-way table over region og gender with all totals,
#   2. One two-way table over county og gender with all totals.

# replace NULL with correct formulas
f41 <- NULL
f42 <- NULL

## 4b.
#  Run  SuppressSmallCounts for each table separately. such that all values less
#  than or equal to 4 are primary suppressed.

# replace ... with relevant code
t41 <- SuppressSmallCounts(data = tourism,
                           ...)
t42 <- SuppressSmallCounts(data = tourism,
                           ...)

## 4c.
# Can the two tables in 4b be published together? Is it possible to use values
# from one table to disclose values in the other?
# Clue: look at county 50, and look at how county and region and connected.


## 4d.
#  Define a formula that generates these two tables simultaneously.

# replace NULL with the right formula
f43 <- NULL

## 4e.
#  Run method on the linked table defined in 4d. Does this table have the same
#  weaknesses as in 4c?
SuppressSmallCounts(data = tourism,
                    formula = f43,
                    ...)


# Exercise 5 --------------------------------------------------------------
# In this exercise, we will explore the differences between freqVar and numVar
# when suppressing small counts.

## 5a.
#  Based on the pregnant data set, create a complete two-way frequency table
#  (that is, with all marginals) over municipality and pregnant. All cell values less
#  than or equal to 3 should be primary suppressed.

# replace ... with suitable code
SuppressSmallCounts(data = pregnant,
                    freqVar = "freq",
                    ...)

# replace ... with suitable code
SuppressSmallCounts(data = pregnant,
                    numVar = "freq",
                    ...)

## 5b.
#  Look at the output of both variants of 5a. What is the difference, what is
#  happening?