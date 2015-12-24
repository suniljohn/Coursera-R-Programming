corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  files <- list.files(directory, full.names=T)   #creates a list of files
  completecases <- c()
  correlation <- c()
  
  for (file in files) {
    dat <- read.csv(file, sep = ",")
    completecases <- dat[complete.cases(dat),]

    if (nrow(completecases) > threshold) {
      correlation <- c(correlation, cor(completecases$nitrate, completecases$sulfate))
    }
  }
  
  return(correlation)
  
}