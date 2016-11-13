#' Compare R and Rcpp implementations
#'
#' Use the \code{microbenchmark} package to compare the performance (speed)
#' of (pure) R and Rcpp implementations of a couple of algorithms. 
#' 
#' 
#' @param showBoxplot A boolean to decide whether or not to show boxplots
#'                    of the times (in microseconds) of the different 
#'                    implementations.
#' 
#' 
#' @details The algorithms are \code{fibonacci} and \code{pisum} from the
#'          Julia \url{http://julialang.org/} benchmarks, as well as 
#'          \code{sum}, which is just the sum of the first \code{n} integers.
#'          Each algorithm is run 100 times.
#'
#'
#' @examples
#' \dontrun{
#' useMicrobenchmarkRvsRcpp()
#'
#' useMicrobenchmarkRvsRcpp(showBoxplot=TRUE)
#' }
#'
#' @export
useMicrobenchmarkRvsRcpp <- function(showBoxplot=FALSE){
    require(microbenchmark)
    #unit in microseconds, but doesn't really make a difference
    unit <- "us"


    cat("===========================================================\n")
    cat("Comparing algorithms implements in R, and using Rcpp\n")
    cat("===========================================================\n\n")
    #Fibonacci trials:
    #-------------------------------------------------------------------------#
    fibtrials <- 100L
    cat("Fibonacci:\n")
    cat("-----------------------------------------------------------\n")
    cat("Number of trials for microbenchmark: ", fibtrials, "\n")
    cat("(speed up compares ratio of median times)\n\n")

    N <- 20
    m1 <- microbenchmark(fib(n=N), fibCppWrap(n=N), times=fibtrials, unit=unit)
    fibres <- summary(m1)
    fibRmedian <- fibres$median[1]
    fibCppmedian <- fibres$median[2]
    cat("Fibonacci (", N, "), Speed up using Rcpp: ", fibRmedian/fibCppmedian, "\n", sep="")
    
    ##using n=30 is a lot slower...
#    m <- microbenchmark(fib(n=30), fibCppWrap(n=30), times=fibtrials, unit=unit)
#    fibres <- summary(m)
#    fibRmedian <- fibres$median[1]
#    fibCppmedian <- fibres$median[2]
#    cat("Fibonacci (30), Speed up using Rcpp: ", fibRmedian/fibCppmedian, "\n")
    #-------------------------------------------------------------------------#
    cat("-----------------------------------------------------------\n")
    cat("\n")


    #pisum trials
    #-------------------------------------------------------------------------#
    pisumtrials <- 100L
    cat("Pisum:\n")
    cat("-----------------------------------------------------------\n")
    cat("Number of trials for microbenchmark: ", pisumtrials, "\n")
    cat("(speed up compares ratio of median times)\n\n")

    N <- 10000
    m2 <- microbenchmark(pisum(N), cppPisumWrap(N), times=pisumtrials, unit=unit)
    pisumres <- summary(m2)
    pisumRmedian <- pisumres$median[1]
    pisumCppmedian <- pisumres$median[2]
    cat("Pisum (", N, "), Speed up using Rcpp: ", pisumRmedian/pisumCppmedian, "\n", sep="")
    cat("-----------------------------------------------------------\n")
    #-------------------------------------------------------------------------#
    cat("\n")

    #sum trials
    #-------------------------------------------------------------------------#
    sumtrials <- 100L
    cat("Sum: \n")
    cat("-----------------------------------------------------------\n")
    cat("Number of trials for microbenchmark: ", sumtrials, "\n")
    cat("(speed up compares ratio of median times)\n\n")

    N <- 100000
#    N <- 1000000
    m3 <- microbenchmark(sumR(N), sumCppWrap(N), times=pisumtrials, unit=unit)
    sumres <- summary(m3)
    sumRmedian <- sumres$median[1]
    sumCppmedian <- sumres$median[2]
    cat("Sum (", N, "), Speed up using Rcpp: ", sumRmedian/sumCppmedian, "\n", sep="")

    m <- microbenchmark(sum(N), sumCppWrap(N), times=pisumtrials, unit=unit)
    sumres <- summary(m)
    sumRmedian <- sumres$median[1]
    sumCppmedian <- sumres$median[2]
    cat("\n")
    cat("now comparing R's implementation of sum to my naive Rcpp implementation\n")
    cat("Sum (", N, "), Speed up using Rcpp: ", sumRmedian/sumCppmedian, "\n", sep="")
    cat("-----------------------------------------------------------\n")
    #-------------------------------------------------------------------------#

    if (showBoxplot){
        cat("\ncreating boxplots; times in microseconds\n")
#        dev.new(width=8, height=6)
#        boxplot(m1)
#        dev.new(width=8, height=6)
#        boxplot(m2)
#        dev.new(width=8, height=6)
#        boxplot(m3)
#        par(mfcol=c(1,3)) 
#        dev.new(width=8, height=6)
# par(mfrow=c(3,1)) 
 par(mfrow=c(1,3), pin=c(2, 2)) 
        boxplot(m1)
        boxplot(m2)
        boxplot(m3)

    }



}
