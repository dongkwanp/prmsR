#' Generates control file for PRMS
#' 
#' @param control.values Control Information File
#' @param control.filepath File Path and File Name for Control File
#' @param csv Determine if generate as CSV
#' 
#' @return NULL 
#' @export 

ControlWrite <- function(control.values, control.filepath, csv = FALSE) {
  
  #####
  ## Generate Control File
  # Basically, this will just wrap everything and just output into the output folder
  cat(paste(control.values$description, "", sep = "\n"), file = control.filepath, append = FALSE)
  
  # If generate as CSV File
  if (csv) {
    control.values$statsON_OFF[[3]] <- "2"
  }
  
  for (i in 2:length(control.values)) {
    
    
    if (as.numeric(control.values[[i]][[1]]) == 1) {
      
      cat(paste('####', ls(control.values[i]), control.values[[i]][[1]], control.values[[i]][[2]], control.values[[i]][[3]], "", sep = "\n"), file = control.filepath, append = TRUE)
      
      
      
    } else {
      
      cat(paste('####', ls(control.values[i]), control.values[[i]][[1]], control.values[[i]][[2]], "", sep = "\n"), file = control.filepath, append = TRUE)
      
      cat(paste(control.values[[i]][[3]], collapse = "\n", sep = ""), file = control.filepath, append = TRUE)
      
      cat("\n", file = control.filepath, append = TRUE)
      
    }
    
  }
  
}


