#' Parse and Read-In Statvar Output file
#'
#' @param output.filepath Output file path to read in (unit is probably cfs)
#'
#' @return output.output
#' @export

OutputRead <- function(output.filepath = paste0(getwd(), '/output/output.statvar')) {

  rawimport <- read.csv(output.filepath, header = FALSE, sep = " ", skip = 3, col.names = c("TimeStep", "Year", "Month", "Day", "Hour", "Min", "Sec", "Flow", "BasinPWEquiv", "NA"))

  Date <- as.Date(paste(rawimport$Year, rawimport$Month, rawimport$Day, sep = "-"), "%Y-%m-%d")

  output.output <- data.frame(Date, rawimport$Flow)

  return(output.output)
}
