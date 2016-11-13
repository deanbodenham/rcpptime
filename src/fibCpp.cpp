#include<Rcpp.h>

int fibCpp(int n){
    if (n < 2){
        return(n);
    } else {
        return( fibCpp(n-1) + fibCpp(n-2) );
    }
}

//wrapper for (recursive) cpp function fibCpp
// [[Rcpp::export]]
Rcpp::NumericVector fibCppWrap(Rcpp::NumericVector n_){
    //conversion
    int n = Rcpp::as<int> (n_);

    //do fib
    int fibVal = fibCpp(n);

    //convert back
    return( Rcpp::NumericVector::create(fibVal) );
}
