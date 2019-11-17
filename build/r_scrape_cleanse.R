# ######################################################################
# auth: ahmad sultani
# date: 2019-11-17
# desc: this script is part 1 below.

        # trying to scrape data off of RP data for searches.
        # 1. scrape all the data off the valuer general website
        # 2. parse the data by semicolon for the "B" type records that contain 
        #    purchase details
        # 3. combine all the data into a single data frame
        # 4. Upload clean table into SQL Server
# ######################################################################

# extract the current year and form the starting date (the end of the 
# first week of the year in this case 07-01) and the end date (a little
# more involved here.
start_date <- paste(format(Sys.Date(), "%Y"), "0107", sep="") 

# calculate the highest integer divider by 7 into the days since 1 Jan to date
weeks_from_1jan_sysdate <- as.numeric(Sys.Date() - as.Date(paste(format(Sys.Date(), "%Y"), "-01-01", sep="")))  %/% 7 
end_date <- as.Date(paste(format(Sys.Date(), "%Y"), "-01-01", sep="")) + 7 * weeks_from_1jan_sysdate - 1

# set the parameter as null as you don't need it anymore
weeks_from_1jan_sysdate

# loop through all the URLs to download the files to the directory
# C:\Users\ahmad\Documents\Valuer General Scraping Tool\02_data\raw where 
# the file doesn't already exist. If the date is prior to 7 Jan, skip the 
# for loop (weeks_from_1jan_sysdate >=1)

if (weeks_from_1jan_sysdate >= 1) {
        
        for (i in 1:weeks_from_1jan_sysdate) {
                
                
        }
        
        
}



