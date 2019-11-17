# ######################################################################
# auth: ahmad sultani
# date: 2019-11-17
# desc: this script is part 4 below.

# trying to scrape data off of RP data for searches.
# 1. scrape all the data off the valuer general website
# 2. parse the data by semicolon for the "B" type records that contain 
#    purchase details
# 3. combine all the data into a single data frame
# 4. Upload clean table into SQL Server
# ######################################################################

# ######################################################################
# upload cleansed data to SQL Server (local pc version)
# ######################################################################

sqlSave(channel = ch, 
        cleansed_table_B, 
        tablename = "WRK_SALES", 
        append = TRUE,
        rownames = FALSE, 
        colnames = FALSE, 
        verbose = TRUE,
        safer = TRUE, 
        addPK = FALSE,
        varTypes = c(record_type="varchar(255)",
                     district_code="varchar(255)",
                     property_id="varchar(255)",
                     sale_counter="varchar(255)",
                     download_datetime="varchar(255)",
                     property_name="varchar(255)",
                     propert_unit_number="varchar(255)",
                     property_house_number="varchar(255)",
                     property_street_name="varchar(255)",
                     property_locality="varchar(255)",
                     property_post_code="varchar(255)",
                     area="varchar(255)",
                     area_type="varchar(255)",
                     contract_date="date",
                     settlement_date="date",
                     purchase_price="float",
                     zoning="varchar(255)",
                     nature_of_property="varchar(255)",
                     primary_purpose="varchar(255)",
                     strata_lot_number="varchar(255)",
                     component_code="varchar(255)",
                     sale_code="varchar(255)",
                     pct_interest_of_sale="varchar(255)",
                     dealing_number="varchar(255)",
                     r_cleanse_date="date",
                     district_name="varchar(255)",
                     area_m2="float",
                     clean_nature_of_property="varchar(255)"),
        fast = TRUE, 
        test = FALSE, 
        nastring = NULL)





