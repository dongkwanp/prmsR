#' Preparing and updating control values
#'
#' @param control.input Control Input List
#'
#' @return control.input
#' @export
#'

PreprocessingControl <- function(control.input) {

  control.input$statVar_names[[1]] <- length(control.input$statVar_names[[3]])
  control.input$statVar_element[[1]] <- length(control.input$statVar_names[[3]])
  control.input$statVar_element[[3]] <- rep(1, length(control.input$statVar_names[[3]]))
  control.input$nstatVars[[3]] <- length(control.input$statVar_names[[3]])

  return(control.input)
}
