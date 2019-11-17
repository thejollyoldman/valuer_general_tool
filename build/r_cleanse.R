# ######################################################################
# auth: ahmad sultani
# date: 2019-11-17
# desc: this script is part 3 below.

# trying to scrape data off of RP data for searches.
# 1. scrape all the data off the valuer general website
# 2. parse the data by semicolon for the "B" type records that contain 
#    purchase details
# 3. combine all the data into a single data frame
# 4. Upload clean table into SQL Server
# ######################################################################

# ######################################################################
# filter the data down to record type B (which contains the sold price)
# clean up the fields
# ######################################################################

cleansed_table_B <- as_tibble(final_table %>% filter(V1 =="B") %>% select(-V25))

colnames(cleansed_table_B) <- table_header

# add field for sysdate (for debugging later)
cleansed_table_B$r_cleanse_date <- Sys.Date()

# add district names
cleansed_table_B <- left_join(cleansed_table_B, district_code_ref_table, by = c("district_code" = "district_code"))

# cleanse dates (contract date and settlement date)
cleansed_table_B$contract_date <- as.Date(as.character(cleansed_table_B$contract_date), format = "%Y%m%d")
cleansed_table_B$settlement_date <- as.Date(as.character(cleansed_table_B$settlement_date), format = "%Y%m%d")

# cleanse area to be in metres squared where it is hectares
cleansed_table_B <- cleansed_table_B %>% mutate(area_m2 = ifelse(trimws(area_type) =="H", 10000*area, area))

# cleanse nature of property
cleansed_table_B <- cleansed_table_B %>% mutate(clean_nature_of_property = ifelse(trimws(nature_of_property) == "R", "RESIDENTIAL"
                                                                                  ,ifelse(trimws(nature_of_property) == "V", "VACANT LAND",
                                                                                          ifelse(trimws(nature_of_property) == "3" & trimws(primary_purpose) %in% c("COMMERCIAL", "FARM", "SHOP", "OFFICE", "WAREHOUSE", "FACTORY","CARSPACE", "INDUSTRIAL", "RETAIL", "RURAL", "HOSPITAL"), as.character(primary_purpose), "OTHER"))))
