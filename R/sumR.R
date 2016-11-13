##sum## - my own test

sumR <- function(n){
    total <- 0
    for (i in seq_len(n)){
        total <- total + i
    }
    return(total)
}

