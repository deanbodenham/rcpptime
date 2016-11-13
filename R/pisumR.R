#https://github.com/JuliaLang/julia/blob/master/test/perf/micro/perf.R
## pi_sum ##

pisum <- function(lim) {
    t <- 0.0
    for (k in 1:lim) {
        t = t + 1.0/(k*k)
    }
    return(t)
}
