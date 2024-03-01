

# Exercises about hierarchies, removeEmpty and removeCodes


If you run the following code, you can use a `Print` function
This function might make  inspecting the output of GaussSuppression
easier by replacing FALSE with - in the suppressed and primary columns.

`source("/R/Print.R")`



### Exercise 1

Load the dataset `sdc_cars` and take a look at it. Tip: `load("data/sdc_cars.RData")`

Run this analysis:

```
  SuppressDominantCells(sdc_cars, 
                        n = 1:2, k = c(85, 95), 
                        numVar = "value", 
                        dimVar = c("sector", "k_group"), 
                        contributorVar = "car_brand")
```

How many rows are in the output?


### Exercise 2

Run the same analysis with the formula interface.
Does it appear that the output is the same?



### Exercise 3

Run the analyzes in Exercise 1 and 2 again and include the `removeEmpty` parameter. 
This can be `TRUE` or` FALSE`. 
Use the parameter in such a way that you do not get the same answer as before.



### Exercise 4

Continue with formula interface using `"sector"` and `"k_group"`, but now switch to `SuppressFewContributors` with `maxN = 2`.
Also include `removeEmpty = FALSE`.

Do you see that you get the same answer as in Exercise 3?



### Exercise 5


Run one of the analyzes from Exercises 1-3 again, but make a change in `k` so that you get a different result for the suppression.



### Exercise 6

We will continue with roughly the same problems

Run this analysis:

```
  SuppressFewContributors(sdc_cars, 
                          maxN = 2, 
                          numVar = "value", 
                          dimVar = c("sector", "k_group"), 
                          contributorVar = "car_brand")
```                          

What is the difference between the numbers in `freq`, `nRule` and `nAll`?



### Exercise 7

Make a change in the analysis in Exercise 6 that takes into account that all the figures from Tesla and Hyundai are openly available. Use the `removeCodes` parameter for this.

What is the difference between the numbers in `nRule` and `nAll` now?



### Exercise 8


Run the analysis in Exercise 1 again with a modification where you no longer use the `dimVar` parameter, but instead use `hierarchies`. What you need for the `hierarchies` parameter can be generated with either `FindDimLists` or `FindHierarchies` in the `SSBtools` package. 

How should `FindDimLists` or `FindHierarchies` be executed?

Take a look at the results from `FindDimLists` or `FindHierarchies`. 
Do you see that the output from `SuppressDominantCells` is the same as in Exercise 1?

