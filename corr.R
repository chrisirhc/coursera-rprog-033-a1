corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  rows <- vector(mode = "numeric")
  
  for(i in 1:323) {
    fileName <- sprintf('%03d', i)
    path <- paste(directory, '/', fileName, '.csv', sep = '')
    newData <- read.csv(path)
    nobs <- nrow(
      newData[
        !is.na(newData$sulfate) & !is.na(newData$nitrate),])
    
    if(nobs >= threshold & nobs > 0) {
      rows <- append(rows, cor(newData$nitrate, newData$sulfate, use = "complete.obs"))
    }
  }
  
  rows
}