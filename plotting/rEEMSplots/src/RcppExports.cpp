// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppEigen.h>
#include <Rcpp.h>

using namespace Rcpp;

// resistance_distance
Eigen::MatrixXd resistance_distance(const Eigen::MatrixXd& M);
RcppExport SEXP rEEMSplots_resistance_distance(SEXP MSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< const Eigen::MatrixXd& >::type M(MSEXP);
    __result = Rcpp::wrap(resistance_distance(M));
    return __result;
END_RCPP
}
// rcppstandardize_rates
Eigen::VectorXd rcppstandardize_rates(const Eigen::VectorXd& tiles, const Eigen::VectorXd& rates, const Eigen::MatrixXd& seeds, const Eigen::MatrixXd& marks, const std::string& distm);
RcppExport SEXP rEEMSplots_rcppstandardize_rates(SEXP tilesSEXP, SEXP ratesSEXP, SEXP seedsSEXP, SEXP marksSEXP, SEXP distmSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< const Eigen::VectorXd& >::type tiles(tilesSEXP);
    Rcpp::traits::input_parameter< const Eigen::VectorXd& >::type rates(ratesSEXP);
    Rcpp::traits::input_parameter< const Eigen::MatrixXd& >::type seeds(seedsSEXP);
    Rcpp::traits::input_parameter< const Eigen::MatrixXd& >::type marks(marksSEXP);
    Rcpp::traits::input_parameter< const std::string& >::type distm(distmSEXP);
    __result = Rcpp::wrap(rcppstandardize_rates(tiles, rates, seeds, marks, distm));
    return __result;
END_RCPP
}
// rcppdont_standardize_rates
Eigen::VectorXd rcppdont_standardize_rates(const Eigen::VectorXd& tiles, const Eigen::VectorXd& rates, const Eigen::MatrixXd& seeds, const Eigen::MatrixXd& marks, const std::string& distm);
RcppExport SEXP rEEMSplots_rcppdont_standardize_rates(SEXP tilesSEXP, SEXP ratesSEXP, SEXP seedsSEXP, SEXP marksSEXP, SEXP distmSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< const Eigen::VectorXd& >::type tiles(tilesSEXP);
    Rcpp::traits::input_parameter< const Eigen::VectorXd& >::type rates(ratesSEXP);
    Rcpp::traits::input_parameter< const Eigen::MatrixXd& >::type seeds(seedsSEXP);
    Rcpp::traits::input_parameter< const Eigen::MatrixXd& >::type marks(marksSEXP);
    Rcpp::traits::input_parameter< const std::string& >::type distm(distmSEXP);
    __result = Rcpp::wrap(rcppdont_standardize_rates(tiles, rates, seeds, marks, distm));
    return __result;
END_RCPP
}