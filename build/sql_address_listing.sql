drop table WRK_ADDRESS_LISTING;
select distinct 
	property_house_number
	,property_street_name
	,coalesce(property_house_number, '') + ' ' + property_street_name as street_address
	,property_locality
	,property_post_code 
	,'NSW' as property_state
	,'AUSTRALIA' as propert_country
into WRK_ADDRESS_LISTING
from wrk_sales
where district_name in ('BURWOOD'
						,'HUNTERS HILL'
						,'CANTERBURY-BANKSTOWN'
						,'CUMBERLAND'
						,'CITY OF PARRAMATTA'
						,'BAYSIDE'
						,'WILLOUGHBY'
						,'PENRITH'
						,'LANE COVE'
						,'WOOLLAHRA'
						,'RYDE'
						,'NULL'
						,'CAMDEN'
						,'SUTHERLAND'
						,'WAVERLEY'
						,'MOSMAN'
						,'UNINCORPORATED AREA'
						,'NORTHERN BEACHES'
						,'KIAMA'
						,'INNER WEST'
						,'LIVERPOOL'
						,'NORTH SYDNEY'
						,'GEORGES RIVER'
						,'THE HILLS SHIRE'
						,'RANDWICK'
						,'CANADA BAY'
						,'BLACKTOWN'
						,'CITY OF SYDNEY'
						,'HORNSBY'
						,'FAIRFIELD'
						,'STRATHFIELD'
						)

select * from WRK_ADDRESS_LISTING