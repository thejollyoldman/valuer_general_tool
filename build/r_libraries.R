###########################################################################
# Library
###########################################################################

# install.packages("tidyverse")
# install.packages("httr")
# install.packages("RODBC")
library(tidyverse)
library(httr)
library(RODBC)

###########################################################################
# declare the key config variables (tables, declared vars etc.)
###########################################################################

# start extraction date for week by week data
manual_start_date <- "2019-01-07"

# website parameters and file download/unzip
valuer_general_base_url <-  "http://www.valuergeneral.nsw.gov.au/__psi/weekly/"
destination_location <- "C:/Users/ahmad/Documents/Valuer General Scraping Tool/02_data/raw"
unzip_location <- "C:/Users/ahmad/Documents/Valuer General Scraping Tool/02_data/unzipped"
csv_location <- "C:/Users/ahmad/Documents/Valuer General Scraping Tool/02_data/export"
  
# header for table uploaded
table_header <- c("record_type","district_code","property_id","sale_counter","download_datetime","property_name","propert_unit_number","property_house_number","property_street_name","property_locality","property_post_code","area","area_type","contract_date","settlement_date","purchase_price","zoning","nature_of_property","primary_purpose","strata_lot_number","component_code","sale_code","pct_interest_of_sale","dealing_number")
district_code_ref_table <- tibble(district_code = c("081","171","511","526","199","575","252","253","254","537","209","043","255","092","102","226","103","210","528","902","903","087","269","270","007","164","247","070","251","008","088","271","123","124","116","224","656","010","272","REG","207","151","090","100","101","012","273","274","143","144","666","538","250","240","302","529","560","074","187","300","219","243","266","082","083","267","188","061","157","098","084","158","244","004","085","065","159","222","223","301","066","005","620","268","192","258","052","259","235","001","260","708","303","236","152","054","238","265","042","261","275","002","262","097","220","263","117","264","050","257","148","230","608","276","018","149","051","214","231","118","216","232","239","233","234","137","150","109","217","218","139")
                                  ,district_name = c("THE HILLS SHIRE","TWEED","UPPER HUNTER","UPPER LACHLAN","URALLA","WAGGA WAGGA","WALCHA","WALGETT","WARREN","WARRUMBUNGLE","WAVERLEY","WEDDIN","WENTWORTH","WILLOUGHBY","WINGECARRIBEE","WOLLONDILLY","WOLLONGONG","WOOLLAHRA","YASS VALLEY","UNINCORPORATED AREA","UNINCORPORATED SYDNEY HARBOUR","MOSMAN","MURRAY RIVER","MURRUMBIDGEE","MUSWELLBROOK","NAMBUCCA","NARRABRI","NARRANDERA","NARROMINE","NEWCASTLE","NORTH SYDNEY","NORTHERN BEACHES","OBERON","ORANGE","PARKES","PENRITH","PORT MACQUARIE-HASTINGS","PORT STEPHENS","QUEANBEYAN-PALERANG","IONAL","RANDWICK","RICHMOND VALLEY","RYDE","SHELLHARBOUR","SHOALHAVEN","SINGLETON","SNOWY MONARO REGIONAL","SNOWY VALLEYS","STRATHFIELD","SUTHERLAND","TAMWORTH REGIONAL","TEMORA","TENTERFIELD","GILGANDRA","GLEN INNES SEVERN","GOULBURN MULWAREE","GREATER HUME","GRIFFITH","GUNNEDAH","GWYDIR","HAWKESBURY","HAY","HILLTOPS","HORNSBY","HUNTERS HILL","INNER WEST","INVERELL","JUNEE","KEMPSEY","KIAMA","KU-RING-GAI","KYOGLE","LACHLAN","LAKE MACQUARIE","LANE COVE","LEETON","LISMORE","LITHGOW","LIVERPOOL","LIVERPOOL PLAINS","LOCKHART","MAITLAND","MID WESTERN REGIONAL","MID-COAST","MOREE PLAINS","CANTERBURY-BANKSTOWN","CARRATHOOL","CENTRAL COAST","CENTRAL DARLING","CESSNOCK","CITY OF PARRAMATTA","CITY OF SYDNEY","CLARENCE VALLEY","COBAR","COFFS HARBOUR","COOLAMON","COONAMBLE","COOTAMUNDRA-GUNDAGAI REGIONAL","COWRA","CUMBERLAND","DUBBO REGIONAL","DUNGOG","EDWARD RIVER","EUROBODALLA","FAIRFIELD","FEDERATION","FORBES","GEORGES RIVER","ALBURY","ARMIDALE REGIONAL","BALLINA","BALRANALD","BATHURST REGIONAL","BAYSIDE","BEGA VALLEY","BELLINGEN","BERRIGAN","BLACKTOWN","BLAND","BLAYNEY","BLUE MOUNTAINS","BOGAN","BOURKE","BREWARRINA","BROKEN HILL","BURWOOD","BYRON","CABONNE","CAMDEN","CAMPBELLTOWN","CANADA BAY")
                                  )

###########################################################################
# SQL odbc connection (DSN defined separetely in Windows)
###########################################################################

ch <- odbcConnect("Localhost")
