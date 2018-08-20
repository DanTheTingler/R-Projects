##Read in the data from Excel
QI_full <- readxl::read_xlsx("QI.xlsx")
QI <- QI_full$QI
##Clean the data
QI <- tolower(QI)
QI <- gsub("\\.", " ", QI)
QI <- gsub("\\?", " ", QI)
QI <- gsub("\\,", " ", QI)
QI <- gsub("\\;", " ", QI)
QI <- gsub("mercedes-benz", "benz", QI)
QI <- gsub("mercedes benz", "benz", QI)
QI <- gsub("mercedes", "benz", QI)
QI <- gsub("\\-", " ", QI)
QI <- gsub("\\(", " ", QI)
QI <- gsub("\\)", " ", QI)
##Split the words in the QI column
QI_words <- strsplit(QI, " ")
##Create the initial frequency table
QI_freq_table <- data.frame(unlist(QI_words))
##Clean up the frequency table
names(QI_freq_table) <- c("Words", "Freq")
QI_freq_table_ordered <- QI_freq_table[order(-QI_freq_table$Freq), ]
QI_final <- QI_freq_table_ordered[-c(1)] ##remove the first row, which is all spaces
