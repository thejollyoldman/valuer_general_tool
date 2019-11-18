use dev;

select 
	REPLACE(property_house_number, ' ', '') + ' ' + property_street_name + ' ' + property_locality	+ ' ' + property_post_code as "Property Address"
	,contract_date as "Contract Date"
	,settlement_date as "Settlement Date"
	,purchase_price as "Purchase Price"
	,area_m2 as "Area Metres Squared"

from dbo.wrk_sales
where property_locality LIKE '%RYDALMERE%'
and primary_purpose = 'RESIDENCE'
and contract_date > '2019-06-01'
and strata_lot_number is null
order by area_m2 