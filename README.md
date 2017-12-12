
<!-- README.md is generated from README.Rmd. Please edit that file -->
webwork: An R package for WeBWorK
=================================

[![Travis-CI Build Status](https://travis-ci.org/rpruim/webwork.svg?branch=master)](https://travis-ci.org/rpruim/webwork)

Installation
------------

You can install webwork from github with:

``` r
# install.packages("devtools")
devtools::install_github("rpruim/webwork")
```

Current functionality
---------------------

-   `crypt()` -- hashes passwords as per WeBWorK requirements (require `perl` currently)

-   `ww_roster()` -- generates a roster data frame that can be saved to to a CSV file (but named `.lst`) and uploaded to WeBWorK. Uses `crypt()` for the necessary password hashing.

-   `ww_read_gradebook()` -- a simple gradebook ingestor that process the 7 header lines of the files WeBWorK exports and returns a sane data frame for post processing. The goal of webwork is to ...
