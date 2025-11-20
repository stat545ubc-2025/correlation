
<!-- README.md is generated from README.Rmd. Please edit that file -->

# correlation

`correlation` is a small R package that provides the function
`linear_summary()`, which fits a simple linear regression between two
numeric variables. The function returns the slope, intercept, and
R-squared value in a tidy tibble. This package offers a quick and
lightweight way to explore relationships between two variables.

## Installation

You can install the development version of correlation from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2025/correlation", ref = "0.1.0")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(correlation)

# Relationship between horsepower and miles-per-gallon
linear_summary(mtcars, "hp", "mpg")
#> # A tibble: 1 × 5
#>   predictor response   slope intercept r_squared
#>   <chr>     <chr>      <dbl>     <dbl>     <dbl>
#> 1 hp        mpg      -0.0682      30.1     0.602

# Another example using the iris dataset
linear_summary(iris, "Sepal.Length", "Petal.Length")
#> # A tibble: 1 × 5
#>   predictor    response     slope intercept r_squared
#>   <chr>        <chr>        <dbl>     <dbl>     <dbl>
#> 1 Sepal.Length Petal.Length  1.86     -7.10     0.760
```

### What the package does

- Fits a simple linear model between two numeric columns
- Returns a tibble containing slope, intercept, and R-squared
- Includes error handling for missing or non-numeric inputs
- Useful for quick exploratory data analysis

## Development

This package was created as part of an assignment on building R
packages.  
It includes roxygen2 documentation and formal tests using the testthat
framework.
