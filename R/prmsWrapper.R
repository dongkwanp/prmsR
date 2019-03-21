#' Running PRMS and all important functions
#'
#' Takes input data file format, hydrologic models, and outputs data-frame time-series of all hydrologic models
#'
#' @param prms.binaryPath Binary Path to PRMS Executable
#' @param meta.baseDirectory Base Directory (without trailing slash)
#' @param input.Control Inputs Control Variable for prmsR
#' @param input.Param Inputs Parameter Variable for prmsR
#' @param input.Data Inputs Data Variable for prmsR
#'
#' @return output.prmsstatvar Outputs StatVar of PRMS Model
#' @export

prmsWrapper <- function(prms.binaryPath, meta.baseDirectory, input.Control, input.Param, input.Data, input.removeFile = TRUE) {

  # Establishing base path
  base.outputdirectorypath <- paste(meta.baseDirectory, 'output', sep = '/')
  base.inputdirectorypath <- paste(meta.baseDirectory, 'input', sep = '/')
  base.output.statVarFilepath <- paste(base.outputdirectorypath, 'outputstatvar.statvar', sep = '/')

  # Establishing relative path for input files
  base.input.dataFilePath <- paste(base.inputdirectorypath, 'DataFile.Data', sep = '/')
  base.input.paramFilePath <- paste(base.inputdirectorypath, 'Paramfile.params', sep = '/')
  base.input.controlFilePath <- paste(base.inputdirectorypath, 'Control.control', sep = '/')

  # Creating Folders
  dir.create(base.outputdirectorypath, recursive = TRUE)
  dir.create(base.inputdirectorypath, recursive = TRUE)

  # Modifying Control File for relative path
  input.Control$ani_output_file[[3]] <- paste(base.outputdirectorypath, 'output.out', sep = '/')
  input.Control$model_output_file[[3]] <- paste(base.outputdirectorypath, 'outputsummary.txt', sep = '/')
  input.Control$stat_var_file[[3]] <- base.output.statVarFilepath
  input.Control$stats_output_file[[3]] <- paste(base.outputdirectorypath, 'outputwb.wb', sep = '/')
  input.Control$data_file[[3]] <- base.input.dataFilePath
  input.Control$param_file[[3]] <- base.input.paramFilePath

  # Writing to Filepath
  prmsR::ControlWrite(input.Control, base.input.controlFilePath)
  prmsR::ParamWrite(input.Param, base.input.paramFilePath)
  prmsR::DataFileWrite(input.Data, base.input.dataFilePath)

  ## Checking if file exists
  if (!file.exists(base.input.controlFilePath) | !file.exists(base.input.paramFilePath) | !file.exists(base.input.dataFilePath)) {
    stop('A file necessary for the model to run is missing.')
  }


  # Running Hydrologic Model
  capture.output(prmsR::prmsRun(prms.binaryPath, base.input.controlFilePath), file = paste(meta.baseDirectory, 'PRMSRun.log', sep = '/'), append = FALSE, type = c('output', 'message'))

  # Reading in StatVar File
  output.prmsstatvar <- prmsR::StatVarRead(base.output.statVarFilepath)

  ### Deleting files left by PRMS
  try(file.remove(c('gwflow.wbal', 'intcp.wbal', 'PRMS-IV.log', 'save_vars', 'snowcomp.wbal', 'soilzone.wbal', 'srunoff_smidx.wbal', 'wbal.msgs'), showWarnings = FALSE))

  return(output.prmsstatvar)
}
