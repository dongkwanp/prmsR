### Importing Cherry and HH Parameter values into R 

# This Script Imports Cherry and HH Parameter values into R in a very static way.
# Note: Do not use this for large files (we're talking gigs here)

######
#### Parameter File Location
# 

param.fileLocation <- "PRMSParam/Hetchy.params"
#param.fileLocation <- "PRMSParam/CherryEleanor.params"

# Configuration Options
verbose <- TRUE


######
#### Reading Logic

#####
### Parameter File

# Importing File into Memory (Note: Don't use this for large files)
param.con <- file(param.fileLocation, "r")

# Importing First several lines
param.headDescription <- readLines(param.con, n = 1)
param.versionNumber <- readLines(param.con, n = 1)

## Dimensions
# Initializing Variables with Initial Values
param.dimensionFlag <- TRUE # False to break the loop
param.poundDividerFlag <- FALSE # Flag for Divider
param.newVariableFlag <- FALSE # Flag for New Variable
param.multipleValuesFlag <- FALSE # Flag for Multiple Values for the New Variable
param.multipleValuesAcceptFlag <- FALSE # Flag to start accepting Multiple Values

param.dimensionSeparator <- readLines(param.con, n = 1)

# Resetting Output
output <- list()
output$meta <- list(param.headDescription, param.versionNumber)
output$dim <- list()
output$param <- list()


# Verbose
if (verbose) {
  
  print("#############################################")
  print("### Environment Variables")
  print("Time-Step: Initial")
  print(paste("param.dimensionFlag =", param.dimensionFlag, sep = " "))
  print(paste("param.poundDividerFlag =", param.poundDividerFlag, sep = " "))
  print(paste("param.newVariableFlag =", param.newVariableFlag, sep = " "))
  print(paste("param.multipleValuesFlag =", param.multipleValuesFlag, sep = " "))
  
}

### Dimension Parameter Flag
while (param.dimensionFlag) {
  
  temp.line <- readLines(param.con, n = 1)
  
  if (verbose) {
    print("#############################################")
    print(paste0("Line: ", temp.line))
  }
  
  if (temp.line == "** Parameters **") {
    
    # Verbose
    if (verbose) {
      print(paste0("Breaking from the loop"))
    }
    
    param.parameterSeparator <- temp.line
    break
  }
  
  # If Line is Pound
  if (temp.line == '####') {
    
    # Verbose
    if (verbose) {
      print("Pre-processing: Setting Divider Flag to True and Resetting Multiple Values Flag")
    }
    
    param.poundDividerFlag <- TRUE
    param.multipleValuesFlag <- FALSE
    param.multipleValuesAcceptFlag <- FALSE
    next
  }
  
  # Special Test: if "nrain" or "ntemp"
  if (temp.line == "nrain" | temp.line == "ntemp") {
    
    # Verbose
    if (verbose) {
      print("temp.line is observed to be 'nrain' or 'ntemp'")
      print("multipleValuesFlag set to TRUE")
    }
    
    param.newVariableName <- temp.line
    param.multipleValuesFlag <- TRUE
    
    next
    
    ## Preparation of Number of Values for multi-value scenarios
  } else if (param.multipleValuesFlag) {
    
    # Verbose
    if (verbose) {
      print("Defining Number of Values and pre-allocating space in memory")
    }
    
    param.numberOfValues <- temp.line
    param.multipleValuesAcceptFlag <- TRUE
    
    ## Generating Variable Output for List
    output$dim[[param.newVariableName]] <- 1:param.numberOfValues
    
    param.multipleValuesFlag <- FALSE # Resetting the Flag
    
    counter <- 1 # Resetting the Counter
    
    next
    
    ## Inputting Values into Output File for Multiple Values
  } else if (param.multipleValuesAcceptFlag) {
    
    
    
    # Verbose
    if (verbose) {
      print(paste0("Adding '", temp.line, "' to 'output$", param.newVariableName, "[", counter, "]'"))
    }
    
    output$dim[[param.newVariableName]][counter] <- temp.line
    
    counter <- counter + 1
    
    next
    
  } 
  
  # After Pound, new variable name
  if (param.poundDividerFlag) {
    
    # Verbose
    if (verbose) {
      print("Saved Variable Name to param.newVariableName and TRUE to newVariableFlag.  Also resetting poundDividerFlag")
    }
    
    param.newVariableName <- temp.line
    param.newVariableFlag <- TRUE
    param.poundDividerFlag <- FALSE # Resetting
    next
  } else {
    
    # Verbose
    if (verbose) {
      print("Resetting newVariableFlag to FALSE")
    }
    
    param.newVariableFlag <- FALSE
  }
  
  if (param.multipleValuesFlag != TRUE & param.multipleValuesAcceptFlag != TRUE) {
    
    # Verbose
    if (verbose) {
      print(paste0("Adding '", temp.line, "' to 'output$", param.newVariableName,"'"))
    }
    
    output$dim[[param.newVariableName]] <- temp.line
    
    next
  }
  
  ## Catchall Dimension Exit
  if (temp.line == "** Parameters **") {
    # Verbose
    if (verbose) {
      print(paste0("Breaking from the loop"))
    }
    
    param.parameterSeparator <- temp.line
    break
  }
  
}

if (verbose) {
  print("#################### PARAMETERS ####################")
}

## Parameters
# Initializing Variables with Initial Values
param.parameterFlag <- TRUE # False to break the loop

### Parameter Parameter Flag
temp.line <- readLines(param.con, n = 1) # Removing the divider

while (param.parameterFlag) {
  
  ## Beginning should be just the Parameter part of the file
  # Now new variable name
  param.newVariableName <- readLines(param.con, n = 1)
  
  # Number of Dimensions
  param.parameterDimension <- readLines(param.con, n = 1)
  
  # Gathering Dimensions
  if (param.parameterDimension == 1) {
    param.parameterType <- readLines(param.con, n = 1)
  } else {
    param.parameterType <- readLines(param.con, n = 2)
  }
  
  # Gathering Number of Data Points
  param.numberOfValues <- readLines(param.con, n = 1)
  
  # Gathering Data Type
  param.dataType <- readLines(param.con, n = 1)
  
  # Gathering Data
  param.dataData <- as.numeric(readLines(param.con, n = param.numberOfValues))
  
  ## Now inputting to Output
  output$param[[param.newVariableName]] <- list(param.parameterDimension, param.parameterType, param.numberOfValues, param.dataType, param.dataData)
  
  # Testing for EOL (also removes the divider if there is a divider)
  if (length(readLines(param.con, n = 1)) == 0) {
    param.parameterFlag = FALSE
  }
  
}

close(param.con)



