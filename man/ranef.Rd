\name{ranef}
\alias{ranef}
\alias{ranef.rma.uni}
\alias{ranef.rma.mv}
\title{Best Linear Unbiased Predictions for 'rma.uni' and 'rma.mv' Objects}
\description{
   The function computes best linear unbiased predictions (BLUPs) of the random effects for objects of class \code{"rma.uni"} and \code{"rma.mv"}. Corresponding standard errors and prediction interval bounds are also provided. \loadmathjax
}
\usage{
\method{ranef}{rma.uni}(object, level, digits, transf, targs, \dots)
\method{ranef}{rma.mv}(object, level, digits, transf, targs, verbose=FALSE, \dots)
}
\arguments{
   \item{object}{an object of class \code{"rma.uni"} or \code{"rma.mv"}.}
   \item{level}{numeric value between 0 and 100 to specify the prediction interval level. If unspecified, the default is to take the value from the object.}
   \item{digits}{optional integer to specify the number of decimal places to which the printed results should be rounded. If unspecified, the default is to take the value from the object.}
   \item{transf}{optional argument to specify a function to transform the predicted values and interval bounds (e.g., \code{transf=exp}; see also \link{transf}). If unspecified, no transformation is used.}
   \item{targs}{optional arguments needed by the function specified under \code{transf}.}
   \item{verbose}{logical to specify whether output should be generated on the progress of the computations (the default is \code{FALSE}).}
   \item{\dots}{other arguments.}
}
\value{
   For objects of class \code{"rma.uni"}, an object of class \code{"list.rma"}. The object is a list containing the following components:
   \item{pred}{predicted values.}
   \item{se}{corresponding standard errors.}
   \item{pi.lb}{lower bound of the prediction intervals.}
   \item{pi.ub}{upper bound of the prediction intervals.}
   \item{\dots}{some additional elements/values.}

   The object is formatted and printed with the \code{\link[=print.list.rma]{print}} function.

   For objects of class \code{"rma.mv"}, a list of data frames with the same components as described above.
}
\note{
   For best linear unbiased predictions that combine the fitted values based on the fixed effects and the estimated contributions of the random effects, see \code{\link{blup}}.

   For predicted/fitted values that are based only on the fixed effects of the model, see \code{\link[=fitted.rma]{fitted}} and \code{\link[=predict.rma]{predict}}.

   Equal-effects models do not contain random study effects. The BLUPs for these models will therefore be 0.

   When using the \code{transf} argument, the transformation is applied to the predicted values and the corresponding interval bounds. The standard errors are then set equal to \code{NA} and are omitted from the printed output.

   By default, a standard normal distribution is used to construct the prediction intervals. When the model was fitted with \code{test="t"} or \code{test="knha"}, then a t-distribution with \mjseqn{k-p} degrees of freedom is used.

   To be precise, it should be noted that the function actually computes empirical BLUPs (eBLUPs), since the predicted values are a function of the estimated variance component(s).
}
\author{
   Wolfgang Viechtbauer \email{wvb@metafor-project.org} \url{https://www.metafor-project.org}
}
\references{
   Kackar, R. N., & Harville, D. A. (1981). Unbiasedness of two-stage estimation and prediction procedures for mixed linear models. Communications in Statistics, Theory and Methods, \bold{10}(13), 1249--1261. \verb{https://doi.org/10.1080/03610928108828108}

   Raudenbush, S. W., & Bryk, A. S. (1985). Empirical Bayes meta-analysis. \emph{Journal of Educational Statistics}, \bold{10}(2), 75--98. \verb{https://doi.org/10.3102/10769986010002075}

   Robinson, G. K. (1991). That BLUP is a good thing: The estimation of random effects. \emph{Statistical Science}, \bold{6}(1), 15--32. \verb{https://doi.org/10.1214/ss/1177011926}

   Searle, S. R., Casella, G., & McCulloch, C. E. (1992). \emph{Variance components}. Hoboken, NJ: Wiley.

   Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. \emph{Journal of Statistical Software}, \bold{36}(3), 1--48. \verb{https://doi.org/10.18637/jss.v036.i03}
}
\seealso{
   \code{\link{rma.uni}} and \code{\link{rma.mv}} for functions to fit models for which BLUPs of the random effects can be computed.

   \code{\link{predict.rma}} and \code{\link{fitted.rma}} for functions to compute the predicted/fitted values based only on the fixed effects and \code{\link{blup.rma.uni}} for a function to compute BLUPs that combine the fitted values and predicted random effects.
}
\examples{
### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(yi, vi, data=dat)

### BLUPs of the random effects
ranef(res)
}
\keyword{models}
