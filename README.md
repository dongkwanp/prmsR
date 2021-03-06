prmsR
-----

`prmsR` is a R wrapper of USGS’s [Precipitation Runoff Modelling System
(PRMS) Version 4](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html) 
used by [University of Massachusetts Amherst](https://umass.edu) [Hydrosystems Research
Group](http://blogs.umass.edu/hydrosystems/). The function of this
library is to:

1.  Integrate the PRMS Model within R’s data and file systems
2.  The ability for easier parallel computing runs of PRMS

Support for Version 5 is possible but currently is not actively developed.  

Questions? Comments? Concerns? Submit an issue.

Dependencies
------------

`prmsR` will automatically install the required dependencies when
installed. However, manual installation of dependencies are possible by
executing the following command:

    install.packages('tidyr')

In addition, the `prms` binary (which can be obtained
[here](https://www.usgs.gov/software/precipitation-runoff-modeling-system-prms-0))
is necessary.

Installation Instructions
-------------------------

`prmsR` is in constant development. Therefore, using the most up-to-date
version of the library is recommended. This library can be accessed via
HTTPS or SSH. Both options are outlined below. You only need to follow
one method that works for you.

### Access via HTTPS

Within R, execute the following lines in order to install `prmsR`.

    install.packages(c('devtools', 'git2r'))
    devtools::install_git('https://github.com/dongkwanp/prmsR.git')

### Access via SSH

    install.packages(c('git2r', 'devtools'))
    devtools::install_git("git@github.com:dongkwanp/prmsR.git")

How to Use
----------

Call the library using the following command.

    library('prmsR')

Troubleshooting
---------------

`prmsR` has been tested and is in regular use on the Linux environment.
However, the code should be platform neutral and work with Windows or
MacOS systems as well. If there are any issues or problems, feel free to
open an issue in our [issue
tracker](https://github.com/dongkwanp/prmsR/issues).

PRMS Questions
--------------

The USGS has a copy of the [PRMS-IV
manual](https://pubs.er.usgs.gov/publication/tm6B7) available on their
site.
