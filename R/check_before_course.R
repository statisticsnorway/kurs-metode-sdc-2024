
# Check whether the GaussSuppression package works

# This code should run without errors.
library(GaussSuppression)
dataset <- SSBtoolsData("sprt_emp_withEU")
SuppressSmallCounts(data = dataset, 
                    dimVar = c("age", "geo"), 
                    maxN = 3)
# The result should be a dataset with 12 rows. 




# Check that the data can be loaded
# For example: 
load("data/social.RData")

# Now you should be able to run the following code:  
SuppressSmallCounts(data = social, 
                    dimVar = c("county", "main_income"), 
                    maxN = 20)
# The result should be a dataset with 15 rows.

# check whether the SmallCountRounding package works
library(SmallCountRounding)

# the following should produe a dataset with 15 rows.
PLSroundingPublish(data = social,
            dimVar = c("county", "main_income"))

