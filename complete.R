complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  rows <- c()

  for(i in id) {
    fileName <- sprintf('%03d', i)
    path <- paste(directory, '/', fileName, '.csv', sep = '')
    newData <- read.csv(path)
    nobs <- nrow(
      newData[
        !is.na(newData$sulfate) & !is.na(newData$nitrate),])
    rows <- rbind(rows, c(id = i, nobs = nobs))
  }

  data.frame(rows)
}