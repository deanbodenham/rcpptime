#https://github.com/JuliaLang/julia/blob/master/test/perf/micro/perf.R

require(compiler)

assert = function(bool) {
    if (!bool) stop('Assertion failed')
}

timeit = function(name, f, ..., times=10) {
    tmin = Inf
    f = cmpfun(f)
    sumTime <- 0
    for (t in 1:times) {
        t = system.time(f(...))["elapsed"]
        if (t < tmin) tmin = t
#        print(t)
        sumTime <- sumTime + t
    }
#    cat(sprintf("r,%s,%.8f\n", name, tmin*1000))
    #time is in seconds, so multiply by 1000 to get milliseconds 
    #Cpp returns time in milliseconds
    avTime <- as.numeric(sumTime / times) * 1000
    cat(sprintf("r,%s,%.8f\n", name, avTime))
    return(avTime)
}
