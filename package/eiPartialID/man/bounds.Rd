% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{bounds}
\alias{bounds}
\title{Compute and evaluate bounds according to Jiang et al. 2019, illustrating usage.}
\usage{
bounds(x, t, n, trueBetaB = NULL)
}
\arguments{
\item{x}{Numeric (double-precision) vector. Contains the proportion of variable X in each precinct (or analagous geographic unit)}

\item{t}{Numeric (double-precision) vector. Contains the proportion of variable T in each precinct (or analagous geographic unit)}

\item{n}{Numeric (double-precision) vector. Contains the number of elements (people/households/etc.) in each precinct (or analagous geographic unit)}

\item{trueBetaB}{Numeric (double-precision) vector. Contains the true conditional values (beta_i) in each precinct (or analagous geographic unit).
Optional. Default NULL.}
}
\value{
List object with the CI_0.5 bounds:

 CI_0.5_lower CI_0.5 lower bound

 CI_0.5_upper CI_0.5 upper bound

 CI_0.5_isSelected If FALSE, proposed bound was not rejected by the heuristic (if TRUE, bounds are reverted to the DD bounds)

 CI_0.5_widthRatio |CI_x|/|DD|

 CI_0.5_nominalCoverage Nominal coverage (1-pnorm(-0.5))


 Optional: CI_0.5_truthCaptured If true district Beta is provided as an argument to bounds(), then this variable contains a boolean for whether or not the
  true value was captured in the proposed CI_0.5.
}
\description{
\code{bounds()} calculates district-level bounds across varying coverage probabilities, after applying the heuristics presented in Jiang et al. 2019. This is a
simple wrapper around calling generateBounds() followed by evaluateBounds(). Here, the returned object only contains the CI_0.5 bounds.
}
\examples{
library("MASS")
library("eco")
data("census")
inputDataSet <- census
x <- inputDataSet$X
t <- inputDataSet$Y
n <- inputDataSet$N
trueBetaB <- inputDataSet$W1
outputList <- bounds(x, t, n, trueBetaB=trueBetaB)
print(outputList)

# > print(outputList)
# $CI_0.5_lower
# [1] 0.5893336
#
# $CI_0.5_upper
# [1] 0.8262426
#
# $CI_0.5_isSelected
# [1] TRUE
#
# $CI_0.5_widthRatio
# [1] 0.5404046
#
# $CI_0.5_nominalCoverage
# [1] 0.6914625
#
# $CI_0.5_truthCaptured
# [1] TRUE

}
