prmsR
-----

`prmsR` is a R wrapper of USGS's [Precipitation Runoff Modelling System
(PRMS)](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html) intended
to be used by [University of Massachusetts Amherst Hydrosystems Research
Group](http://blogs.umass.edu/hydrosystems/). The function of this
library is to:

1.  Integrate the PRMS Model within R's data and file systems
2.  The ability for easier parallel computing runs of PRMS

Questions? Comments? Concerns? Contact [Don](mailto:donpark@umass.edu).

Dependencies
------------

`prmsR` doesn't really require many dependencies besides for having the
`prms` model binary (which can be obtained
[here](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html)). `prmsR`
also requires the `tidyr` library. However, this is automatically
installed through the `prmsR` installation process.

Installation Instructions
-------------------------

`prmsR` is in constant development. Therefore, using the most up-to-date
version of the library is recommended. This library can be accessed via
HTTPS or SSH. Both options are outlined below. You only need to follow
one method that works for you.

### Access via HTTPS

Change `<username>` with your GitLab username and execute the following
lines of code to download the latest version of `prmsR`.

    install.packages(c('devtools', 'git2r'))
    devtools::install_git('https://projects.cloudwaterlab.com/UMass/prmsR.git')

### Access via SSH

    install.packages(c('git2r', 'devtools'))
    devtools::install_git("git@projects.cloudwaterlab.com:UMass/prmsR.git")

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
tracker](https://projects.cloudwaterlab.com/UMass/prmsR/issues).
