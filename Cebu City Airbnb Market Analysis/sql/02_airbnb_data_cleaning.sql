/*
===============================================================================
		-- Data Cleaning & Transformation Plan

1. Data Filtering
	• Listing Type: Keep only Condominium, Home, Private room, and Villa
	• Room Type: Keep only Entire Home, Private Room, and Shared Room.
	• Drop Columns: Remove all fields not required for analysis.

2. Standardization: 
	• Cancellation Policy: Firm-Very Strict, Limited-Flexible
	• Amenities: Create Yes/No columns for TV, Air Conditioning, Kitchen, Wifi, and Pool.

3. Financial & Occupancy Logic (Peso/Native)
	If an "Adjusted" value is 0, use the base value instead:
		• ttm_adjusted_occupancy -- use ttm_occupancy
		• ttm_adjusted_revpar -- use ttm_revpar
		• l90d_adjusted_occupancy -- use l90d_occupancy
		• l90d_adjusted_revpar -- use l90d_revpar
===============================================================================
*/

USE [Cebu City AirBnB];

-- Examine the Dataset

SELECT * FROM listings_data;

-- Import cleaned dataset to Clean Table (New)

DROP TABLE IF EXISTS cleaned_listings_data;
SELECT
	listing_id,
	listing_name,
	CASE 
		WHEN listing_type LIKE '%condo%'     THEN 'Condominium'
		WHEN listing_type LIKE '%room%'      THEN 'Private room'
		WHEN listing_type LIKE '%townhouse%' THEN 'Home'
		WHEN listing_type LIKE '%home%'      THEN 'Home'
		WHEN listing_type LIKE '%villa%'     THEN 'Villa'
		ELSE 'Others'
	END AS listing_type,
	CASE
		WHEN room_type LIKE '%home%'    THEN 'Entire home'
		WHEN room_type LIKE '%hotel%'   THEN 'Hotel room'
		WHEN room_type LIKE '%private%' THEN 'Private room'
		ELSE room_type
	END AS room_type,
	guests,
	bedrooms,
	beds,
	baths,
	CASE WHEN amenities LIKE '%TV%' THEN 'Yes' ELSE 'No' END AS has_tv,
	CASE WHEN amenities LIKE '%Air conditioning%' THEN 'Yes' ELSE 'No' END AS has_air_con,
	CASE WHEN amenities LIKE '%Kitchen%' THEN 'Yes' ELSE 'No' END AS has_kitchen,
	CASE WHEN amenities LIKE '%Wifi%' THEN 'Yes' ELSE 'No' END AS has_wifi,
	CASE WHEN amenities LIKE '%Pool%' THEN 'Yes' ELSE 'No' END AS has_pool,
	min_nights,
	CASE
		WHEN cancellation_policy LIKE '%Firm%'    THEN 'Very Strict'
		WHEN cancellation_policy LIKE '%Limited%' THEN 'Flexible'
		ELSE cancellation_policy
	END AS cancellation_policy,
	num_reviews,
	rating_overall,
	rating_checkin,
	rating_cleanliness,
	rating_communication,
	rating_location,
	ttm_revenue_native AS ttm_revenue,
	ttm_avg_rate_native AS ttm_avg_rate,
	CASE 
		WHEN ttm_adjusted_occupancy = 0 THEN ttm_occupancy
		ELSE ttm_adjusted_occupancy
	END AS ttm_occupancy,
	CASE 
		WHEN ttm_adjusted_revpar_native = 0 THEN ttm_revpar_native
		ELSE ttm_adjusted_revpar_native
	END AS ttm_revpar,
	ttm_reserved_days,
	ttm_available_days,
	l90d_revenue_native AS l90d_revenue,
	l90d_avg_rate_native AS l90d_avg_rate,
	CASE 
		WHEN l90d_adjusted_occupancy = 0 THEN l90d_occupancy
		ELSE l90d_adjusted_occupancy
	END AS l90d_occupancy,
	CASE
		WHEN l90d_adjusted_revpar_native = 0 THEN l90d_revpar_native
		ELSE l90d_adjusted_revpar_native
	END AS l90d_revpar,
	l90d_reserved_days,
	l90d_available_days
INTO cleaned_listings_data
FROM listings_data;

-- Data Validation : Check the Cleaned Table

SELECT * FROM cleaned_listings_data;
SELECT DISTINCT listing_type FROM cleaned_listings_data;
SELECT DISTINCT room_type FROM cleaned_listings_data;
SELECT DISTINCT cancellation_policy FROM cleaned_listings_data;	
SELECT ttm_occupancy FROM cleaned_listings_data WHERE ttm_occupancy = 0;

/*
===============================================================================
		-- Data Cleaning for Table: past_calendar_rates

	• Drop Columns: Remove all fields not required for analysis.
	• Extract month from the date column.

===============================================================================
*/

-- Examine the Dataset

SELECT * FROM past_calendar_rates;

-- Import cleaned dataset to Clean Table (New)

DROP TABLE IF EXISTS cleaned_past_calendar_rates;
SELECT
	listing_id, 
	date,
	FORMAT(date, 'MMM') AS month_name,
	MONTH(date) AS month_num,
	vacant_days,
	reserved_days,
	occupancy,
	booking_lead_time_avg,
	length_of_stay_avg,
	min_nights_avg,
	native_booked_rate_avg AS booked_rate_avg,
	native_rate_avg AS rate_avg,
	native_revenue AS revenue
INTO cleaned_past_calendar_rates
FROM past_calendar_rates

-- Data Validation : Check the Cleaned Table

SELECT * FROM cleaned_past_calendar_rates





