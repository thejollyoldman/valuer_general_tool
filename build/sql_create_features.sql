use dev;

select 
	case when clean_nature_of_property = 'OTHER' then primary_purpose else clean_nature_of_property end as property_type
	,purchase_price
	,zoning
	,case when coalesce(trim(strata_lot_number), '') != '' then 'y' else 'n' end as has_strata_number 
	,datediff(day, contract_date, settlement_date) as days_betwn_contract_settle
	,area_type
	,area_m2
	,district_name
	,property_post_code
	,case when coalesce(trim(propert_unit_number), '') != '' then 'y' else 'n' end has_unit_number
	,case when 
		
		coalesce(trim(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace (property_house_number, '0', ''),'1', ''),'2', ''),'3', ''),'4', ''),'5', ''),'6', ''),'7', ''),'8', ''),'9', '')), '') 
		  
		  != '' then 'y' else 'n' end as has_letter_in_house_no

	,case when coalesce(property_name, '') != '' then 'y' else 'n' end as has_property_name 

into wrk_clustering
from wrk_sales
where clean_nature_of_property = 'RESIDENTIAL'
;
--(135181 rows affected)