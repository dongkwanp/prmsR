#' Read in Control File for PRMS
#'
#' @param control.filepath Control file path to read in
#'
#' @return output
#' @export

ControlRead <- function(control.filepath) {

  ## Initialization
  output <- list()
  control.con <- file(control.filepath, "r")

  output$description <- readLines(control.con, n = 1)

  # Disposing of initial "####"
  temp.line <- readLines(control.con, n = 1)

  # Setting Loop Flag
  control.LoopFlag <- TRUE

  while (control.LoopFlag) {

    control.newVariable <- readLines(control.con, n = 1)
    control.nrValues <- readLines(control.con, n = 1)
    control.dataType <- readLines(control.con, n = 1)
    control.Values <- readLines(control.con, n = control.nrValues)

    output[[control.newVariable]] <- list(control.nrValues, control.dataType, control.Values)

    if (length(readLines(control.con, n = 1)) == 0) {
      control.LoopFlag = FALSE
    }

  }

  close(control.con)

  return(output)
}
