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

  fileraw <- readLines(conOutputFile)

  close(conOutputFile)

  lineCounter <- 1

  skip <- TRUE

  while (skip) {



    functiona <- 'disc golf'

  }


  while (skip) {

    fileLine <- readLines(conOutputFile, n = 1)

    if (substr(fileLine, 1, 1) == '#') {
      next
    } else {
      break
    }
  }





  skiplength <- readLines(conOutputFile, n = 1)

  listnames <- rep(NA, skiplength)

  for (i in 1:skiplength) {

    listnames[i] <- gsub("([A-Za-z]+_[A-Za-z]+).*", "\\1", readLines(conOutputFile, n = 1))

  }

  close(conOutputFile)

  # Generating Header Names
  column.names <- append(c('Timestep', 'Year', 'Month', 'Day', 'Hour', 'Min', 'Sec', 'NA'), listnames, after = 7)

  rawimport <- read.csv(output.filepath, header = FALSE, sep = " ", skip = (skiplength + 1), col.names = column.names)

  Date <- as.Date(paste(rawimport$Year, rawimport$Month, rawimport$Day, sep = "-"), "%Y-%m-%d")

  output.output <- data.frame(Date, rawimport[ ,8:(length(column.names) - 1)])

  return(output.output)
}
