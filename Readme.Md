# Valuer General Scrape

The steps we are performing are:

1. scrape all the data off the valuer general website
2. parse the data by semicolon for the "B" type records that contain purchase details
3. combine all the data into a single data frame
4. Upload clean table into SQL Server
5. Attach longitudes and latitudes to every home (through google scrape perhaps?)
6. Connect final table to Tableau Public for analysis.
7. Productionise the code to run so it can be run at any point to update to the latest data.