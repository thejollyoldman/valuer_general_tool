# ######################################################################
# auth: ahmad sultani
# date: 2019-11-17
# desc: this script is part 2 below.

# trying to scrape data off of RP data for searches.
# 1. scrape all the data off the valuer general website
# 2. parse the data by semicolon for the "B" type records that contain 
#    purchase details
# 3. combine all the data into a single data frame
# 4. Upload clean table into SQL Server
# ######################################################################

# ######################################################################
# upload all the data
# ######################################################################

dir <- list.files(path = unzip_location, pattern = ".DAT")

# loop through all files in directory to upload
for (i in 1:NROW(dir)) {

  if (i == 1) {
    
    final_table <- read.csv(file = paste(unzip_location, trimws(dir[i]), sep="/") , sep = ";", header=FALSE)
  
  } else {
    
    t <- read.csv(file = paste(unzip_location, trimws(dir[i]), sep="/") , sep = ";", header=FALSE)
    final_table <- rbind(final_table, t)
  
  }
  
  if (i %% 10 == 0 ){
    # print a message every 10 files
    print(paste("file number", i, "uploaded", sep = " "))
    
  }
}
