#' Generates parameter file for PRMS
#' 
#' @param prms.param.values PRMS Parameter Files values
#' @param param.path File Path and File Name for Parameter File
#' 
#' @return NULL 
#' @export 

ParamWrite <- function(prms.param.values, param.path) {
  
  #####
  ## Generate Parameter File
  # Outputting Initial Descriptions
  cat(paste(prms.param.values$meta[[1]], prms.param.values$meta[[2]], "** Dimensions **", sep = '\n'), file = param.path, append = FALSE)
  
  for (i in 1:length(prms.param.values$dim)) {
    
    cat('\n', file = param.path, append = TRUE)
    
    if (ls(prms.param.values$dim[i]) == 'nrain' | ls(prms.param.values$dim[i]) == 'ntemp') {
      
      cat(paste('####', ls(prms.param.values$dim[i]), length(prms.param.values$dim[[i]]), "", sep = "\n"), file = param.path, append = TRUE)
      
      cat(paste(prms.param.values$dim[[i]], sep = "\n", collapse = "\n"), file = param.path, append = TRUE)
      
    } else {
      
      cat(paste('####', ls(prms.param.values$dim[i]), prms.param.values$dim[i][1], sep = "\n"), file = param.path, append = TRUE)
      
    }
    
  }
  
  cat(paste("", '** Parameters **', "", sep = "\n"), file = param.path, append = TRUE)
  
  for (i in 1:length(prms.param.values$param)) {
    
    if (length(prms.param.values$param[[i]][[2]]) == 1) {
      
      cat(paste('####', ls(prms.param.values$param[i]), prms.param.values$param[[i]][1], prms.param.values$param[[i]][2], prms.param.values$param[[i]][3], prms.param.values$param[[i]][4], "", sep = "\n", collapse = "\n"), file = param.path, append = TRUE)

      cat(paste(prms.param.values$param[[i]][[5]], sep = '\n', collapse = '\n'), file = param.path, append = TRUE)
      
      cat('\n', file = param.path, append = TRUE)
      
    } else {
      
      cat(paste('####', ls(prms.param.values$param[i]), prms.param.values$param[[i]][1], "", sep = "\n"), file = param.path, append = TRUE)
      
      cat(paste(prms.param.values$param[[i]][[2]], "", sep = "\n", collapse = "\n"), file = param.path, append = TRUE)
      
      cat(paste(prms.param.values$param[[i]][3], prms.param.values$param[[i]][4], "", sep = "\n"), file = param.path, append = TRUE)
      
      cat(paste(prms.param.values$param[[i]][[5]], "", sep = '\n', collapse = '\n'), file = param.path, append = TRUE)
      
    }
    
  }
  
}
