#include<Rcpp.h>
#include <ctime>

double cppPisum(int limit){
    double t = 0.0;
    //because will use one more
    limit++;
    for (int k=1; k < limit; ++k) {
        t = t + 1.0/(k*k);
    }
    return t;
}

// [[Rcpp::export]]
Rcpp::NumericVector cppPisumWrap(Rcpp::NumericVector lim_){
    int limit = Rcpp::as<int> (lim_);

    //run pisum
    double t = cppPisum(limit);

    return Rcpp::NumericVector::create(t);
}


