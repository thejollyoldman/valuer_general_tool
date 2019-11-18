use dev;

select 
	dbo.ProperCase(REPLACE(property_house_number, ' ', '') + ' ' + property_street_name + ' ' + property_locality) as "Property Address"
	,contract_date as "Contract Date"
	,purchase_price as "Purchase Price"
	,area_m2 as "Area m2"

from dbo.wrk_sales
where property_locality LIKE '%RYDALMERE%'
and primary_purpose = 'RESIDENCE'
and contract_date > '2019-06-01'
and strata_lot_number is null
order by area_m2 