% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dsm.var.gam.R
\name{dsm.var.gam}
\alias{dsm.var.gam}
\title{Prediction variance estimation assuming independence}
\usage{
dsm.var.gam(dsm.obj, pred.data, off.set, seglen.varname = "Effort",
  type.pred = "response")
}
\arguments{
\item{dsm.obj}{a model object returned from running \code{\link{dsm}}.}

\item{pred.data}{either: a single prediction grid or list of prediction grids. Each grid should be a \code{data.frame} with the same columns as the original data.}

\item{off.set}{a a vector or list of vectors with as many elements as there are in \code{pred.data}. Each vector is as long as the number of rows in the corresponding element of \code{pred.data}. These give the area associated with each prediction cell. If a single number is supplied it will be replicated for the length of \code{pred.data}.}

\item{seglen.varname}{name for the column which holds the segment length (default value \code{"Effort"}).}

\item{type.pred}{should the predictions be on the "response" or "link" scale? (default \code{"response"}).}
}
\value{
a list with elements
        \tabular{ll}{\code{model} \tab the fitted model object\cr
                     \code{pred.var} \tab variance of the regions given
                     in \code{pred.data}.\cr
                     \code{bootstrap} \tab logical, always \code{FALSE}\cr
                     \code{model}\tab the fitted model with the extra term\cr
                     \code{dsm.object} \tab the original model, as above
                     }
}
\description{
If one is willing to assume the the detection function and spatial model are independent, this function will produce estimates of variance of predictions of abundance, using the result that squared coefficients of variation will add.
}
\details{
This is based on \code{\link{dsm.var.prop}} taken from code by Mark Bravington and Sharon Hedley.
}
\examples{
\dontrun{
 library(Distance)
 library(dsm)

 # load the Gulf of Mexico dolphin data (see ?mexdolphins)
 data(mexdolphins)

 # fit a detection function and look at the summary
 hr.model <- ds(distdata, max(distdata$distance),
                key = "hr", adjustment = NULL)
 summary(hr.model)

 # fit a simple smooth of x and y
 mod1 <- dsm(count~s(x, y), hr.model, segdata, obsdata)

 # Calculate the variance
 # this will give a summary over the whole area in mexdolphins$preddata
 mod1.var <- dsm.var.gam(mod1, preddata, off.set=preddata$area)
}
}
\author{
David L. Miller
}
