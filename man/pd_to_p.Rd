% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert_pd_to_p.R
\name{pd_to_p}
\alias{pd_to_p}
\alias{p_to_pd}
\alias{convert_p_to_pd}
\alias{convert_pd_to_p}
\title{Convert between Probability of Direction (pd) and p-value.}
\usage{
pd_to_p(pd, direction = "two-sided", ...)

p_to_pd(p, direction = "two-sided", ...)

convert_p_to_pd(p, direction = "two-sided", ...)

convert_pd_to_p(pd, direction = "two-sided", ...)
}
\arguments{
\item{pd}{A Probability of Direction (pd) value (between 0 and 1).}

\item{direction}{What type of p-value is requested or provided. Can be \code{"two-sided"} (default, two tailed) or \code{"one-sided"} (one tailed).}

\item{...}{Arguments passed to or from other methods.}

\item{p}{A p-value.}
}
\description{
Enables a conversion between Probability of Direction (pd) and p-value.
}
\examples{
pd_to_p(pd = 0.95)
pd_to_p(pd = 0.95, direction = "one-sided")
}
