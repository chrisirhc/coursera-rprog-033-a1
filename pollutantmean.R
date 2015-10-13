pollutantmean <- function(directory, pollutant, id = 1:332) {
  data <- vector(mode = "numeric")

  for(i in id) {
    fileName <- sprintf('%03d', i)
    path <- paste(directory, '/', fileName, '.csv', sep = '')
    newData <- read.csv(path)[[pollutant]]
    data <- append(data, newData)
  }
  
  mean(data, na.rm = TRUE)
}