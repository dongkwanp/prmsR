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
[here](https://wwwbrr.cr.usgs.gov/projects/SW_MoWS/PRMS.html)). The
library also requires the `tidyr` library. `tidyr` can be installed by:

    install.packages('tidyr')

Installation Instructions
-------------------------

`prmsR` is in constant development. Therefore, using the most up-to-date
version of the library is recommended. However, as `prmsR` currently is
in an internal repository that requires authentication, there are some
additional steps required before using it. This library can be accessed
via HTTPS or SSH. Both options are outlined below. You only need to
follow one method that works for you.

### Access via HTTPS

Change `<username>` with your GitLab username and execute the following
lines of code to download the latest version of `prmsR`.

    install.packages(c('devtools', 'getPass', 'git2r'))
    devtools::install_git(
      'https://projects.cloudwaterlab.com/UMass/prmsR.git', 
      credentials = git2r::cred_user_pass('<username>', getPass::getPass())
    )

### Access via SSH

Placing your [Public SSH
Key](https://projects.cloudwaterlab.com/profile/keys) into our system
first is necessary in order to access the Git repository. Replace the
location of `id_rsa.pub` and `id_rsa` with known locations.

    install.packages(c('git2r', 'devtools'))
    creds = git2r::cred_ssh_key("~\\.ssh\\id_rsa.pub",
                                "~\\.ssh\\id_rsa")
    devtools::install_git("git@projects.cloudwaterlab.com:UMass/prmsR.git",
                          credentials = creds)

How to Use
----------

Call the library using the following command.

    library('prmsR')
    library('tidyr')
