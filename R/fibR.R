#https://github.com/JuliaLang/julia/blob/master/test/perf/micro/perf.R
##fib##

fib = function(n) {
    if (n < 2) {
        return(n)
    } else {
        return(fib(n-1) + fib(n-2))
    }
}
