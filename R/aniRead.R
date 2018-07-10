#' Parse and Read-In ani Output files
#'
#' Parses the animation file for data usage (either per sub-basin, hru, or others)
#'
#' @param output.filepath Output file path to read in
#'
#' @return output.output
#' @export

aniRead <- function(output.filepath = paste0(getwd(), '/output/output.out.nsub')) {

  # Determining Header Names
  conOutputFile <- file(output.filepath, open = 'r')

  lineCounter <- 1

  while (skip) {

    fileLine <- readLines(conOutputFile, n = 1)

    if (substr(fileLine, 1, 1) == '#') {
      lineCounter <- lineCounter + 1
      next
    }

    else break
  }

  # Delineate Headers
  headers <- unlist(strsplit(fileLine, split = '\t'))
  lineCounter <- lineCounter + 1
  characterbreakdown <- unlist(strsplit(readLines(conOutputFile, n = 1), split = '\t'))

  close(conOutputFile)

  import.data <- read.csv(output.filepath, header = FALSE, sep = "", skip = lineCounter, col.names = headers)

  import.data$timestamp <- as.Date(import.data$timestamp, "%Y-%m-%d")

  return(import.data)
}
