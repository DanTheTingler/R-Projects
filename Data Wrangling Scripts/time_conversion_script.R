##Importing the CSV file and extracting the time column
csvallfields <- read.csv("CsvAllFields.csv")
unconverted_time_elapsed <- csvallfields$sys_ElapsedTime

##Converting the time column to characters so we can work with them
string_times <- as.character(unconverted_time_elapsed)

##Modifying the times to be HH:MM:SS
string_times <- gsub("h ", ":" string_times)
string_times <- gsub("m ", ":" string_times)
string_times <- gsub("s ", "" string_times)

##Then, to convert the string time into seconds, I used lubridate
##which is a library from tidyverse
install.packages("tidyverse")
library("tidyverse")

##From here, I wrote my own function:
toSeconds <- function(x){
  return(period_to_seconds(hms(x)))
} 

##And applied it over the list of strings
converted_times <- lapply(string_times, toSeconds)
csvallfields$qtime <- converted_times
write.csv(csvallfields, file="CsvAllFields_Seconds.csv")

