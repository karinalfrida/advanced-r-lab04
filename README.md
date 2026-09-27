
# lab04

<!-- badges: start -->
<!-- badges: end -->

The goal of lab04 is to create a package for multiple regression, creating a linreg object from a formula and data, 
calculating regression statistics and providing relevant methods for the object to access the result.

## Installation

You can install the development version of lab04 from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("karinalfrida/advanced-r-lab04")
```

## Example

This is a basic example which shows you how the similarities with the lm() function:

``` r
library(lab04)
data(iris)

linreg_testobj <- linreg(formula =Petal.Length~Species, data = iris)

print.linreg(linreg_testobj)
resid.linreg(linreg_testobj)
pred.linreg(linreg_testobj)
coef(linreg_testobj)
```

