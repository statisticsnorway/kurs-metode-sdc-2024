

# Exercises with the SmallCountRounding package



### Exercise 1

Load the dataset `pregnant_micro`. Tip: `load("data/pregnant_micro.RData")`

Run this analysis:
```
PLSroundingPublish(pregnant_micro, 
                   roundBase = 3, 
                   formula = ~municipality*gender*pregnant)
```

Also try `removeEmpty = FALSE`

What is the difference?




### Exercise 2

Load the dataset `pregnant`. Tip: `load("data/pregnant.RData")`


Use this dataset and run the same analyses?

How should this be done?

What is the difference in the results?




### Exercise 3

Create a new dataset with this code:

```
pregnant2 <- SSBtools::Extend0(pregnant[-3])
```

How is the new data set?

Repeat Exercise 2 with this data set.



### Exercise 4

Look at the inner data sets obtained by 
`PLSroundingInner` instead of `PLSroundingPublish` in Exercises 1-3.

What are the differences?



### Exercise 5

Would you say it is safe or recommended to use `zeroCandidates = TRUE` in any of the analyses above?

This is a theory exercise. You do not need to run the analyses.
