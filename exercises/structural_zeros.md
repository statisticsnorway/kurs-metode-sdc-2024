
# Exercises about Structural Zeros


If you run the following code, you can use a `Print` function
This function might make  inspecting the output of GaussSuppression
easier by replacing FALSE with - in the suppressed and primary columns.

`source("R/Print.R")`


### Exercise 1

Load the dataset `pregnant_micro` and take a look at it. Tip: `load("data/pregnant_micro.RData")`

Run this analysis:
`SuppressSmallCounts(pregnant_micro, maxN = 1, formula = ~county*gender*pregnant)`

Are you satisfied with the result?


### Exercise 2

Run the same analysis with the formula interface.
Is the result the same?



### Exercise 3

Run the analyzes in Exercise 1 and Exercise 2 again and enter the parameter `extend0 = FALSE`.

Why isn't the answer the same?

Are you happy with any of the results?



### Exercise 4

Still use `extend0 = FALSE`. Now, also try using the parameter`removeEmpty` parameter
which can be `TRUE` or `FALSE`.

Use the parameter to fix any problems in Exercise 3.



### Exercise 5


Still use `extend0 = FALSE`.

Run both interfaces as in Exercise 3.

Select parameter setting for `removeEmpty` which gives warning of the type
``Suppressed cells with empty input will not be protected. Extend input data with zeros?`

Add `structuralEmpty = TRUE` as extra parameter in addition to everything else.

Do you think the result is acceptable?



### Exercise 6


Find code in Exercise 4 where you think the result can be used.
Also find code in Exercise 5 where you think the result can be used.

Run the code again with a change where `county` is replaced by `municipality`. 

Look at the results for women from Drammen and Ullensaker.

What's going wrong here?



### Exercise 7

Load the dataset `pregnant` and take a look at it. Tip: `load("data/pregnant.RData")`

Here there is a frequency variable called `freq` and there are rows where `freq=0`.

Why are there only four rows in this data set with `pregnant=yes`?


Run analysis with the variables "municipality", "gender" and "pregnant" in a similar way as before.
But now use this frequency data set instead. Hint: Specify `freqVar`.
Use the parameters  `structuralEmpty` and `extend0` to achieve the desired output.

Do you see that the problem from Exercise 6 has now been solved?



### Exercise 8


Based on Exercise 7. Try different settings of `removeEmpty`.

What do you think is the right choice?


