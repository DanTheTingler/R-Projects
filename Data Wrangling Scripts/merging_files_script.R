##Importing the necessary files
sawtoothfile <- read.csv("CsvAllFields_Seconds.csv")
decipherfile <- read.csv("KiaCompletes.csv")

##Grabbing the rows of IDs to merge
decipherLinks <- decipherfile$linkb
sawtoothIDs <- sawtoothfile$ID

##extracting and cleaning the IDs from the decipher file
decipherIDs <- str_extract(decipherLinks, "id=.*")
decipherIDs <- gsub("id=", "", decipherIDs)

##extract the decipher UUIDs
decipherUUIDs <- decipherfile$uuid
decipherUUIDs <- as.character(decipherUUIDs)

##create a dataframe that just has the decipher IDs and UUIDs
smalldecipherfile <- data.frame(decipherIDs, decipherUUIDs)
names(smalldecipherfile) <- c("id", "UUIDs")

##Combine decipher file and decipher IDs
decipherfile$ids <- decipherIDs 

##Start merging
##All merged is all columns from both files
allmerged <- merge(decipherfile, sawtoothfile, by="id")
write.csv(allmerged, file = "All_Merged.csv")
##This next file is the sawtooth file with decipher UUIDs (which currently isn't working)
sawtoothmerged <- merge(sawtoothfile, smalldecipherfile, by="id")
write.csv(sawtoothfile, file = "Sawtooth_and_UUIDs.csv")

##Questions: not too sure how to get the UUIDs next to the id column in sawtoothmerged
##Not too sure if everything is correct 