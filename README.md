
# bayestestR <img src='man/figures/logo.png' align="right" height="139" />

[![Build
Status](https://travis-ci.org/easystats/bayestestR.svg?branch=master)](https://travis-ci.org/easystats/bayestestR)
[![codecov](https://codecov.io/gh/easystats/bayestestR/branch/master/graph/badge.svg)](https://codecov.io/gh/easystats/bayestestR)
[![HitCount](http://hits.dwyl.io/easystats/bayestestR.svg)](http://hits.dwyl.io/easystats/bayestestR)
[![Documentation](https://img.shields.io/badge/documentation-bayestestR-orange.svg?colorB=E91E63)](https://easystats.github.io/bayestestR/)
[![DOI](https://zenodo.org/badge/165641861.svg)](https://zenodo.org/badge/latestdoi/165641861)

`bayestestR` is a lightweight package providing utilities to describe
posterior distributions and Bayesian models.

## Installation

Run the following:

``` r
install.packages("devtools")
devtools::install_github("easystats/bayestestR")
```

``` r
library("bayestestR")
```

## Documentation

The package documentation can be found
[**here**](https://easystats.github.io/bayestestR/). Check-out these
posts:

  - [Indices
    Description](https://easystats.github.io/bayestestR/articles/IndicesDescription.html)
  - [Comparison of
    Point-Estimates](https://easystats.github.io/bayestestR/articles/2_IndicesEstimationComparison.html)
  - [Comparison of Indices of Effect
    Existence](https://easystats.github.io/bayestestR/articles/3_IndicesExistenceComparison.html)
  - [Reporting
    Guidelines](https://easystats.github.io/bayestestR/articles/4_Guidelines.html)

# Functions

## Posterior Description

### HDI - The *Credible* Interval (CI)

**`hdi()`** computes the Highest Density Interval (HDI) of a posterior
distribution, *i.e.*, the interval which contains all points within the
interval have a higher probability density than points outside the
interval. The HDI is used in the context of Bayesian posterior
characterisation as **Credible Interval (CI)**. By default, hdi()
returns the 90% intervals, deemed to be more stable than, for instance,
95% intervals (Kruschke, 2015).

``` r
hdi(posterior = rnorm(1000), CI = 90)
```

### MAP estimate

### MAP Estimate

**`map_estimate()`** finds the Highest Maximum A Posteriori (MAP)
estimate of a posterior. It corresponds to the ‘peak’ of the posterior
distribution.

``` r
map_estimate(rnorm(1000, 1, 1))
```

### ROPE

**`rope()`** computes the proportion (in percentage) of the HDI (default
to the 90% HDI) of a posterior distribution that lies within a region of
practical equivalence. Statistically, the probability of a posterior
distribution of being different from 0 does not make much sense (the
probability of it being different from a single point being infinite).
Therefore, the idea underlining ROPE is to let the user define an area
around the null value enclosing values that are equivalent to the null
value for practical purposes (2010, 2011, 2014). Kruschke (2018)
suggests that such null value could be set, by default, to the -0.1 to
0.1 range of a standardized parameter (negligible effect size according
to Cohen). This could be generalized: For instance, for linear models,
the ROPE could be set as 0 +/- .1 \* sd(y). Kruschke (2010, 2011, 2014)
suggest using the proportion of the 95% (or 90%, considered more stable)
*HDI* that falls within the ROPE as an index for “null-hypothesis”
testing (as understood under the Bayesian framework, see `rope_test`).
Besides the ROPE-based decision criteria, the proportion of the 95% CI
that falls in the ROPE can be used as a continuous index.

``` r
rope(posterior = rnorm(1000, 1, 1), bounds = c(-0.1, 0.1))
```

## Null-Hypothesis Significance Testing (NHST)

### Equivalence test

**`equivalence_test()`** performs a Test for Practical Equivalence based
on the “HDI+ROPE decision rule” (Kruschke, 2018) to check whether
parameter values should be accepted or rejected against an explicitly
formulated “null hypothesis”.

``` r
equivalence_test(posterior = rnorm(1000, 1, 1), bounds = c(-0.1, 0.1))
```

### ROPE-based probability

**`p_rope()`** computes the ROPE-based p-value that represents the
maximum percentage of HDI that does not contain (positive values) or is
entirely contained (negative values) in the negligible values space
defined by the ROPE. It differs from the ROPE, *i.e.*, the proportion of
a given CI in the ROPE, by representing the maximum CI to reach a ROPE
proportion of 0% (positive values) or 100% (negative values). A
ROPE-based p of 97% means that there is a probability of .97 that a
parameter (described by its posterior distribution) is outside the ROPE.
On the contrary, a ROPE-based p of -97% means that there is also a
probability of 0.97 that the parameter is inside the ROPE.

``` r
p_rope(posterior = rnorm(1000, 1, 1), bounds = c(-0.1, 0.1))
```

### Probability of Direction (*p*d)

**`p_direction()`** computes the Probability of Direction (*p*d, also
known as the Maximum Probability of Effect - MPE). It varies between 50%
and 100% and can be interpreted as the probability (expressed in
percentage) that a parameter (described by its posterior distribution)
is strictly positive or negative (consistently with the median’s sign).
It is defined as the proportion of the posterior distribution that is of
the median’s sign. Altough differently expressed, this index is fairly
similar to the frequentist p-value (*i.e.*, is strongly correlated).

``` r
p_direction(rnorm(1000, mean = 1, sd = 1))
```

### MAP-based *p*-value

**`p_map()`** computes a Bayesian equivalent of the p-value, related to
the odds that a parameter (described by its posterior distribution) has
against the null hypothesis (h0) using Mills’ (2014, 2017) Objective
Bayesian Hypothesis Testing paradigm. It is mathematically based on the
density at the Maximum A Priori (MAP). It corresponds to the density
value at 0 divided by the density of the highest density point.

``` r
p_map(posterior = rnorm(1000, 1, 1))
```

## Utilities

### Perfect Normal Distribution

**`rnorm_perfect()`**: Generate a sample of size n with a near-perfect
normal distribution.

``` r
rnorm_perfect(n = 10)
```

### Probability of a Value

**`density_at()`**: Compute the density of a given point of a
distribution.

``` r
density_at(posterior = rnorm(1000, 1, 1))
```

## Credits

You can cite the package as following:

  - Makowski, D. (2019). *Understand and Describe Bayesian Models and
    Posterior Distributions using BayestestR*. Available from
    <https://github.com/easystats/bayestestR>.
    <DOI:10.5281/zenodo.2556486>.