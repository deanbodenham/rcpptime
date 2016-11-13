#include<Rcpp.h>
#include <ctime>

int sumCpp(int n){
    int total = 0;
    n++;
    for (int i=1; i < n; ++i){
        total += i;
    }
    return total;
}

// [[Rcpp::export]]
Rcpp::NumericVector sumCppWrap(Rcpp::NumericVector n_){
    int n = Rcpp::as<int> (n_);

    //do sum
    double total = sumCpp(n);

    return Rcpp::NumericVector::create(total);
}
