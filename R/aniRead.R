#' Parse and Read-In ani Output files
#'
#' Parses the animation file for data usage (either per sub-basin, hru, or others)
#'
#' @param output.filepath Output file path to read in
#'
#' @return output.output
#' @export

aniRead <- function(output.filepath = paste0(getwd(), '/output/output.out.nsub')) {

  conOutputFile <- file(output.filepath, open = 'r')

  lineCounter <- 1

  while (TRUE) # Probably could be better
    {

    fileLine <- readLines(conOutputFile, n = 1)

    if (substr(fileLine, 1, 1) == '#') {
      lineCounter <- lineCounter + 1
      next
    }

    else break
  }

  headers <- unlist(strsplit(fileLine, split = '\t'))
  lineCounter <- lineCounter + 1
  characterbreakdown <- unlist(strsplit(readLines(conOutputFile, n = 1), split = '\t'))

  close(conOutputFile)

  import.data <- read.csv(output.filepath, header = FALSE, sep = "", skip = lineCounter, col.names = headers)

  output.output <- list()


  for (i in 1:max(import.data$nhru)) {

    temp.ts <- dplyr::filter(import.data, get(headers[2]) == i)
    temp.ts <- temp.ts[,-2]
    temp.ts$timestamp <- as.Date(temp.ts$timestamp, '%Y-%m-%d')

    listname <- paste0(headers[2], i)

    output.output[[listname]] <- temp.ts

  }

  return(output.output)
}
