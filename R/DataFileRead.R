#' Reads Data File
#'
#' @param datainput.path Input data file path
#'
#' @return NULL
#' @export

DataFileRead <- function(datainput.path) {

  # Initialization
  output <- list()
  output$param <- list()
  datainput.con <- file(datainput.path, "r")

  output$meta$description <- readLines(datainput.con, n = 1)

  #####
  ## Param Section
  param.loopFlag <- TRUE
  commentlinecounter <- 1
  linecounter <- 1

  while (param.loopFlag) {

    temp.line <- readLines(datainput.con, n = 1)
    linecounter <- linecounter + 1

    # Comment Section
    if (substr(temp.line, start = 1, stop = 2) == '//') {

      output$comment[commentlinecounter] <- temp.line
      commentlinecounter <- commentlinecounter + 1

      next
    }

    if (sub(' .*', '', temp.line) == 'tmax' | sub(' .*', '', temp.line) == 'tmin' | sub(' .*', '', temp.line) == 'precip' | sub(' .*', '', temp.line) == 'runoff' | sub(' .*', '', temp.line) == 'snowdepth') {

      output$param[sub(' .*', '', temp.line)] <- sub( ' .*', '', sub('\\D{3,10}\\s', '', temp.line))

      next
    }

    if (substr(temp.line, start = 1, stop = 4)  == '####') {
      param.loopFlag <- FALSE
    }

  }

  close(datainput.con)

  #####
  ## Data Section

  output$data <- read.table(datainput.path, header = FALSE, sep = " ", skip = linecounter)
  output$data <- unite(output$data, 'Date', c('V1', 'V2', 'V3'))
  output$data$Date <- as.Date(output$data$Date, '%Y_%m_%d')

  return(output)
}
