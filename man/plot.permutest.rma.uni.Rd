\name{plot.permutest.rma.uni}
\alias{plot.permutest.rma.uni}
\title{Plot Method for 'permutest.rma.uni' Objects}
\description{
   Plot method for objects of class \code{"permutest.rma.uni"}.
}
\usage{
\method{plot}{permutest.rma.uni}(x, beta, alpha, QM=FALSE, QS=FALSE,
     breaks="Scott", freq=FALSE, col="lightgray", border=NULL,
     col.out=rgb(1,0,0,0.5), col.ref="black", col.density="blue",
     adjust=1, lwd=c(2,0,0,4), layout, \dots)
}
\arguments{
   \item{x}{an object of class \code{"permutest.rma.uni"} obtained with \code{\link{permutest}}.}
   \item{beta}{optional vector of indices to specify which (location) coefficients should be plotted.}
   \item{alpha}{optional vector of indices to specify which scale coefficients should be plotted. Only relevant for location-scale models (see \code{\link{rma.uni}}).}
   \item{QM}{logical to specify whether the permutation distribution of the omnibus test of the (location) coefficients should be plotted (the default is \code{FALSE}).}
   \item{QS}{logical to specify whether the permutation distribution of the omnibus test of the scale coefficients should be plotted (the default is \code{FALSE}). Only relevant for location-scale models (see \code{\link{rma.uni}}).}
   \item{breaks}{argument to be passed on to the corresponding argument of \code{\link{hist}} to set (the method for determining) the (number of) breakpoints.}
   \item{freq}{logical to indicate whether frequencies or probability densities should be plotted (the default is \code{FALSE} to plot densities).}
   \item{col}{character string to specify the color for the bars (the default is a light gray).}
   \item{border}{character string to specify the color for the border around the bars (the default is \code{NULL} to use the standard foreground color).}
   \item{col.out}{character string to specify the color for the bars that are more extreme than the observed test statistic (the default is a semi-transparent shade of red).}
   \item{col.ref}{character string to specify the color of the theoretical reference/null distribution that is superimposed on top of the histogram (the default is black).}
   \item{col.density}{character string to specify the color of the kernel density estimate of the permutation distribution that is superimposed on top of the histogram (the default is blue).}
   \item{adjust}{numeric value to be passed on to the corresponding argument of \code{\link{density}} (for adjusting the bandwidth of the kernel density estimate).}
   \item{lwd}{numeric vector to specify the width of the vertical lines corresponding to the value of the observed test statistic, of the reference/null distribution, of the density estimate, and of the vertical line at 0. Note: by default, the reference/null distribution and the density estimate have a line width of 0 and are therefore not plotted.}
   \item{layout}{optional vector of two numbers to specify the number of rows and columns for the layout of the figure.}
   \item{\dots}{other arguments.}
}
\details{
   The function plots the permutation distribution(s) of the model coefficient(s) as histograms.

   For models with moderators, one can choose via argument \code{beta} which coefficients to plot (by default, all permutation distributions except that of the intercept are plotted). One can also choose to plot the permutation distribution of the omnibus test of the model coefficients (by setting \code{QM=TRUE}).

   Arguments \code{breaks}, \code{freq}, \code{col}, and \code{border} are passed on to the \code{\link{hist}} function for the plotting.

   Argument \code{col.out} is used to specify the color for the bars that are more extreme than the observed test statistic. The p-value of a permutation test corresponds to the area of these bars.

   One can superimpose the theoretical reference/null distribution on top of the histogram (i.e., the distribution as assumed by the model). The p-value for the standard (i.e., non-permutation) test is the area that is more extreme than the observed test statistic under this reference/null distribution.

   A kernel density estimate of the permutation distribution can also be superimposed on top of the histogram (as a smoothed representation of the permutation distribution).

   Note that the theoretical reference/null distribution and the kernel density estimate of the permutation distribution are only shown when setting the line width for these elements greater than 0 via the \code{lwd} argument.

   For location-scale models (see \code{\link{rma.uni}} for details), one can also use arguments \code{alpha} and \code{QS} to specify which scale coefficients to plot and whether to also plot the permutation distribution of the omnibus test of the scale coefficients (by setting \code{QS=TRUE}).
}
\author{
   Wolfgang Viechtbauer \email{wvb@metafor-project.org} \url{https://www.metafor-project.org}
}
\references{
   Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. \emph{Journal of Statistical Software}, \bold{36}(3), 1--48. \verb{https://doi.org/10.18637/jss.v036.i03}
}
\seealso{
   \code{\link{permutest.rma.uni}} for the function to create \code{permutest.rma.uni} objects.
}
\examples{
### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model
res <- rma(yi, vi, data=dat)
res

\dontrun{
### permutation test (exact)
set.seed(1234) # for reproducibility
permres <- permutest(res, exact=TRUE)
permres

### plot of the permutation distribution
### dashed horizontal line: the observed value of the test statistic (in both tails)
### black curve: standard normal density (theoretical reference/null distribution)
### blue curve: kernel density estimate of the permutation distribution
plot(permres, lwd=c(2,3,3,4))

### mixed-effects model with two moderators (absolute latitude and publication year)
res <- rma(yi, vi, mods = ~ ablat + year, data=dat)
res

### permutation test (approximate)
set.seed(1234) # for reproducibility
permres <- permutest(res, iter=10000)
permres

### plot of the permutation distribution for absolute latitude
### note: the tail area under the permutation distribution is larger
### than under a standard normal density (hence, the larger p-value)
plot(permres, beta=2, lwd=c(2,3,3,4), xlim=c(-5,5), ylim=c(0,.4))
}
}
\keyword{hplot}
