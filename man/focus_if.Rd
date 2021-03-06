% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reshape.R
\name{focus_if}
\alias{focus_if}
\title{Conditionally focus correlation data frame}
\usage{
focus_if(x, .predicate, ..., mirror = FALSE)
}
\arguments{
\item{x}{Correlation data frame or object to be coerced to one via
\code{\link{as_cordf}}.}

\item{.predicate}{A predicate function to be applied to the columns. The
columns for which .predicate returns TRUE will be included as variables in
\code{\link{focus}}.}

\item{...}{Additional arguments to pass to the predicate function if not anonymous.}

\item{mirror}{Boolean. Whether to mirror the selected columns in the rows or
not.}
}
\value{
A tibble or, if mirror = TRUE, a correlation data frame.
}
\description{
Apply a predicate function to each colum of correlations. Columns that
evaluate to TRUE will be included in a call to \code{\link{focus}}.
}
\examples{
library(dplyr)
any_greater_than <- function(x, val) {
  mean(abs(x), na.rm = TRUE) > val
}

x <- correlate(mtcars)

x \%>\% focus_if(any_greater_than, .6)
x \%>\% focus_if(any_greater_than, .6, mirror = TRUE) \%>\% network_plot()
}
