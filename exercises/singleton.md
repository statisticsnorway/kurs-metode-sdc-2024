

# Exercises about singleton, aggregation and weightVar


If you run the following code, you can use a `Print` function
This function might make  inspecting the output of GaussSuppression
easier by replacing FALSE with - in the suppressed and primary columns.

`source("/R/Print.R")`



### Exercise 1
Load the dataset `sdc_cars`. Tip: `load("data/sdc_cars.RData")`

Run this analysis:
```
  SuppressDominantCells(sdc_cars, 
                        n = 1:2, k = c(50, 60), 
                        numVar = "value", 
                        dimVar = c("months", "k_group"), 
                        contributorVar = "car_brand")
```

Also run a corresponding analysis where you enter `singletonMethod = "none"`.

Do you see that the answer was different?

Are you able to understand the disclosure that can be found at `singletonMethod = "none"`.





### Exercise 2


In Exercise 1, the total value for `k_group` 3 is suppressed. Suppose it is very important that this does not happen.

Use the `weightVar` parameter to ensure that the suppression will be different.



### Exercise 3

Run this analysis:

```
  SuppressDominantCells(sdc_cars, 
                        n = 1:2, k = c(85, 95), 
                        numVar = "value", 
                        dimVar = c("sector", "k_group"), 
                        contributorVar = "car_brand")
```

See that the combination of `other` and `k_group 3` is suppressed. Suppose it is very important that this does not happen.

Use the `weightVar` parameter to ensure that the suppression will be different.



### Exercise 4

By using the output parameter it is possible to get other datasets as output.

We now modify the analysis above and create two data frames by the code:

```
  data1 <- SuppressDominantCells(sdc_cars, 
                        n = 1:2, k = c(85, 95), 
                        numVar = "value", 
                        dimVar = c("sector", "k_group"), 
                        contributorVar = "car_brand", output = "inner")
                    
  
  data2 <- SuppressDominantCells(sdc_cars, 
                        n = 1:2, k = c(85, 95), 
                        numVar = "value", 
                        dimVar = c("sector", "k_group"), 
                        contributorVar = "car_brand", output = "all")$inner
                        
```

Can you explain what kind of data this is?

Can you explain all the variables in `data2`?



### Exercise 5

First run this analysis

```
SuppressDominantCells(sdc_cars,
                       n = 1:2, k = c(85, 95),
                       numVar = "value",
                       formula = ~municipality + k_group*months + sector*county,
                       contributorVar = "car_brand")
```

Assume that all the data for `Skiptvet` is openly available.
Try to use what you have learned to take this into account.
Look at the result.
What was it that happened?



### Exercise 6

Load the dataset `social`. Tip: `load("data/social.RData")`


Run this analysis where only the first 50 data rows are used:

```
SuppressSmallCounts(social[1:50, ], 
                    dimVar = c("municipality", "main_income"), 
                    maxN=1)

```

Also run a corresponding analysis where you enter `singletonMethod = "none"`.

Can you explain the difference between these two analyzes?


By looking at the output, are you able to explain which the suppression pattern is different?

