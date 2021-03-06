% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prmsWrapper.R
\name{prmsWrapper}
\alias{prmsWrapper}
\title{Running PRMS and all important functions}
\usage{
prmsWrapper(prms.binaryPath, meta.baseDirectory, input.Control,
  input.Param, input.Data, input.removeAni = TRUE)
}
\arguments{
\item{prms.binaryPath}{Binary Path to PRMS Executable}

\item{meta.baseDirectory}{Base Directory (without trailing slash)}

\item{input.Control}{Inputs Control Variable for prmsR}

\item{input.Param}{Inputs Parameter Variable for prmsR}

\item{input.Data}{Inputs Data Variable for prmsR}

\item{input.removeAni}{removes ANI file after running (if applicable)}
}
\value{
output.prmsstatvar Outputs StatVar of PRMS Model
}
\description{
Takes input data file format, hydrologic models, and outputs data-frame time-series of all hydrologic models
}
