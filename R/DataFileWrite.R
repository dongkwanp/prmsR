#' Writes Data File
#'
#' @param datainput.data List of Variables and Data
#' @param datainput.writepath Input data file writing path
#'
#' @return NULL
#' @export

DataFileWrite <- function(datainput.data, datainput.writepath) {

  cat(datainput.data$meta$description, sep = '\n', file = datainput.writepath, append = FALSE)
  cat(paste(datainput.data$meta$comment, collapse = '\n'), sep = '\n', file = datainput.writepath, append = TRUE)

  for (i in 1:length(datainput.data$param)) {

    cat(paste(ls(datainput.data$param[i]), datainput.data$param[[i]], sep = ' '), sep = '\n', file = datainput.writepath, append = TRUE)

  }

  cat('########################################', sep = '\n', file = datainput.writepath, append = TRUE)

  datainput.data$data <- tidyr::separate(datainput.data$data, Date, c('y', 'm', 'd'))

  datainput.data$data$y <- as.numeric(datainput.data$data$y)
  datainput.data$data$m <- as.numeric(datainput.data$data$m)
  datainput.data$data$d <- as.numeric(datainput.data$data$d)

  write.table(datainput.data$data, file = datainput.writepath, append = TRUE, quote = FALSE, sep = ' ', col.names = FALSE, row.names = FALSE)

}
