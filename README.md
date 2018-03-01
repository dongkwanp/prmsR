prmsR
-----

`prmsR` is a R wrapper of USGS's [Precipitation Runoff Modelling System
(PRMS)](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html) intended
to be used by [University of Massachusetts Amherst Hydrosystems Research
Group](http://blogs.umass.edu/hydrosystems/). The function of this
library is to:

1.  Integrate the PRMS Model within R's data and file systems
2.  Easier parallel computing runs of PRMS
3.  ????
4.  Profit

Questions? Comments? Concerns? Contact [Don](mailto:donpark@umass.edu).

Dependencies
------------

`prmsR` doesn't really require many dependencies besides for having the
`prms` model binary (which can be obtained
[here](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html)). However,
it also requires the `tidyr` library. This can be installed by:

    install.packages('tidyr')
    library('tidyr')

Installation Instructions
-------------------------

Installation of `prmsR` can be done through the git repository. Note
that the git repository is currently public but unlisted.

    install.packages('devtools')
    devtools::install_git('https://git.donpark.me/donpark/prmsR.git')

How to Use
----------

Call the library using the following command.

    library('prmsR')
    library('tidyr')
