#' PRMS Run Wrapper
#'
#' @param binary.filepath Filepath to the PRMS Binary (Relative or Absolute)
#' @param control.filepath Filepath to the control file (Relative or Absolute)
#'
#' @return NULL
#'
#' @export


prmsRun <- function(binary.filepath, control.filepath) {

  system(paste(binary.filepath, control.filepath, sep = " "), intern = TRUE)

}
