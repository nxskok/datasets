
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datasets

<!-- badges: start -->

<!-- badges: end -->

The goal of datasets is to provide a home for data sets for my courses,
from various textbooks. I favour text files, but I grab what I can.

## example

Load Tidyverse first, and `gdata` to read in old Excel spreadsheets
(`read_excel` doesn’t appear to do it):

``` r
library(tidyverse)
#> ── Attaching packages ────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──
#> ✓ ggplot2 3.3.0     ✓ purrr   0.3.3
#> ✓ tibble  3.0.0     ✓ dplyr   0.8.5
#> ✓ tidyr   1.0.2     ✓ stringr 1.4.0
#> ✓ readr   1.3.1     ✓ forcats 0.5.0
#> ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(gdata)
#> gdata: read.xls support for 'XLS' (Excel 97-2004) files ENABLED.
#> 
#> gdata: read.xls support for 'XLSX' (Excel 2007+) files ENABLED.
#> 
#> Attaching package: 'gdata'
#> The following objects are masked from 'package:dplyr':
#> 
#>     combine, first, last
#> The following object is masked from 'package:purrr':
#> 
#>     keep
#> The following object is masked from 'package:stats':
#> 
#>     nobs
#> The following object is masked from 'package:utils':
#> 
#>     object.size
#> The following object is masked from 'package:base':
#> 
#>     startsWith
```

The data set `deprived` from Utts and Heckard is from a survey of
students from a statistics class. Each student was asked whether they
generally felt sleep-deprived or not, and also how many hours they
usually slept per night:

``` r
my_url <- "utts-heckard/deprived.XLS"
deprived <- read.xls(my_url)
deprived %>% as_tibble()
#> # A tibble: 86 x 2
#>    Deprived SleepHrs
#>    <fct>       <int>
#>  1 No              8
#>  2 No              6
#>  3 No              7
#>  4 Yes             6
#>  5 Yes             6
#>  6 Yes             7
#>  7 Yes             6
#>  8 Yes             7
#>  9 No              9
#> 10 No              7
#> # … with 76 more rows
```

One would imagine that sleep-deprived people got less sleep:

``` r
ggplot(deprived, aes(x=Deprived, y=SleepHrs)) + geom_boxplot()
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

There are outliers in both groups, but the answer appears to be yes. Is
that significant?

``` r
t.test(SleepHrs~Deprived, data=deprived, alternative="greater")
#> 
#>  Welch Two Sample t-test
#> 
#> data:  SleepHrs by Deprived
#> t = 4.0975, df = 79.624, p-value = 4.99e-05
#> alternative hypothesis: true difference in means is greater than 0
#> 95 percent confidence interval:
#>  0.6627109       Inf
#> sample estimates:
#>  mean in group No mean in group Yes 
#>          7.057143          5.941176
```

Yes, although it might be good to be concerned about the outliers.
