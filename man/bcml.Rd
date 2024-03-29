% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apis_functions.R
\name{bcml}
\alias{bcml}
\title{BCML estimator}
\usage{
bcml(
  dataset,
  yearStart,
  yearEnd,
  var.agg = "Cod_Provincia",
  eq,
  spatial = NULL,
  estimation = "analytical",
  corrBIAS = TRUE,
  WMAT = NULL
)
}
\arguments{
\item{dataset}{STFDF with the data}

\item{yearStart}{First year considered in the estimation}

\item{yearEnd}{Last Anno considered in the estimation}

\item{var.agg}{Index of the spatial units}

\item{eq}{Formula to be estimated. It excludes the spatial lag}

\item{spatial}{Radius to define neighbors}

\item{estimation}{Either 'analytical' or 'numerical'. If 'analytical' is specified the concentrated maximum likelihood is estimated and then the other parameters are obtained analytically. Otherwise, all parameters are obtained through numerical maximization of the log-likelihood function.}

\item{corrBIAS}{Boolean. If TRUE, the bias correction is applied.}

\item{WMAT}{The spatial weight matrix}
}
\value{
A list with two objects. The first object is the estimates table. The second object is the log-likelihood evaluated at its maximum
}
\description{
This function estimates a space time linear model according to the specified formula. It implements the BCML (or BCLSDV) estimator as in Elhorst (2010) \doi{10.1016/j.regsciurbeco.2010.03.003}.
}
\examples{
\donttest{
library(maxLik)
library(matrixcalc)

set.seed(123)
sd = sim_data_fe(dataset=regsamp,N=100,TT=8,
                 spatial = 80,Tau = -0.2,Rho = 0.4,
                 Beta = 2,sdDev = 2,startingT = 10,
                 LONGLAT = TRUE)
est_bcml = bcml(dataset = sd[[1]],yearStart = 3,yearEnd = 9,
                var.agg = 'Cod_Provincia',eq = Y~X1,
                  estimation = 'analytical',corrBIAS = TRUE,WMAT = sd[[2]])
est_bcml
}

}
