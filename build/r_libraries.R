###########################################################################
# Library script
###########################################################################

# install.packages("tidyverse") 
# install.packages("httr") 
install.packages("RODBC")
library(tidyverse)
library(httr)
library(RODBC)

###########################################################################
# declare the key config variables
###########################################################################

# start extraction date for week by week data
manual_start_date <- "2019-01-07"

# website parameters and file download/unzip
valuer_general_base_url <-  "http://www.valuergeneral.nsw.gov.au/__psi/weekly/"
destination_location <- "C:/Users/ahmad/Documents/Valuer General Scraping Tool/02_data/raw"
unzip_location <- "C:/Users/ahmad/Documents/Valuer General Scraping Tool/02_data/unzipped"

# header for table uploaded
table_header <- c("record_type","district_code","property_id","sale_counter","download_datetime","property_name","propert_unit_number","property_house_number","property_street_name","property_locality","property_post_code","area","area_type","contract_date","settlement_date","purchase_price","zoning","nature_of_property","primary_purpose","strata_lot_number","component_code","sale_code","pct_interest_of_sale","dealing_number")
