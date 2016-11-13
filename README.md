# rcpptime

A quick comparison between Rcpp and R implementations for the following algorithms:
- fibonacci
- pisum
- sum (naive implementation, for loop adding up terms in a vector)
- sum (R's `sum` function)

- Ideas for benchmarks from [julialang.org](http://julialang.org/)

## Requirements:
- `microbenchmark` R package, available [on CRAN](https://CRAN.R-project.org/package=microbenchmark)



## Running the simulation

After 
```
git clone https://github.com/deanbodenham/rcpptime.git
```


In R, 

```
require(microbenchmark)
devtools::document() #to load package, otherwise install it and use 'library'

useMicrobenchmarkRvsRcpp()
```


## Results


Algorithm      | Speed-up using Rcpp
---------------|--------------------
Fibonacci      | ~300 times
Pisum          | ~100 times
sum (naive)    | ~3500 times
sum (internal) | ~0.12 times


Note that while there are large speed-ups for the first three implementations, R's internal `sum` is faster than my simple Rcpp implementation.

