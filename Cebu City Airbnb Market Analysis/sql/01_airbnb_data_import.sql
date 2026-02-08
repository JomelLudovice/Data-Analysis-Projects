-- Create tables to import SQL data into and use for data cleaning.

-- =======================================================
-- 1. Create Listings Table
-- =======================================================


USE [Cebu City AirBnB];

DROP TABLE IF EXISTS listings_data;
CREATE TABLE listings_data (
    listing_id int NOT NULL,
    listing_name nvarchar(100) NULL,
    listing_type nvarchar(50) NULL,
    room_type nvarchar(50) NULL,
    cover_photo_url nvarchar(150) NULL,
    photos_count tinyint NULL,
    host_id int NULL,
    host_name nvarchar(50) NULL,
    cohost_ids nvarchar(50) NULL,
    cohost_names nvarchar(100) NULL,
    superhost nvarchar(50) NULL,
    latitude float NULL,
    longitude float NULL,
    guests tinyint NULL,
    bedrooms tinyint NULL,
    beds tinyint NULL,
    baths float NULL,
    registration nvarchar(50) NULL,
    amenities nvarchar(1100) NULL,
    instant_book nvarchar(50) NULL,
    professional_management nvarchar(50) NULL,
    min_nights tinyint NULL,
    cancellation_policy nvarchar(50) NULL,
    currency nvarchar(50) NULL,
    cleaning_fee smallint NULL,
    extra_guest_fee tinyint NULL,
    num_reviews smallint NULL,
    rating_overall float NULL,
    rating_accuracy float NULL,
    rating_checkin float NULL,
    rating_cleanliness float NULL,
    rating_communication float NULL,
    rating_location float NULL,
    rating_value float NULL,
    ttm_revenue int NULL,
    ttm_revenue_native int NULL,
    ttm_avg_rate float NULL,
    ttm_avg_rate_native float NULL,
    ttm_occupancy float NULL,
    ttm_adjusted_occupancy float NULL,
    ttm_revpar float NULL,
    ttm_revpar_native float NULL,
    ttm_adjusted_revpar float NULL,
    ttm_adjusted_revpar_native float NULL,
    ttm_reserved_days smallint NULL,
    ttm_blocked_days smallint NULL,
    ttm_available_days smallint NULL,
    ttm_total_days smallint NULL,
    l90d_revenue smallint NULL,
    l90d_revenue_native int NULL,
    l90d_avg_rate float NULL,
    l90d_avg_rate_native float NULL,
    l90d_occupancy float NULL,
    l90d_adjusted_occupancy float NULL,
    l90d_revpar float NULL,
    l90d_revpar_native float NULL,
    l90d_adjusted_revpar float NULL,
    l90d_adjusted_revpar_native float NULL,
    l90d_reserved_days tinyint NULL,
    l90d_blocked_days tinyint NULL,
    l90d_available_days tinyint NULL,
    l90d_total_days tinyint NULL,
    PRIMARY KEY (listing_id)
);

BULK INSERT listings_data 
FROM 'C:\Users\jomjo\OneDrive\Desktop\The Ultimate Microsoft Excel Mastery Bundle - 8 Courses\SQL Server Projects\Cebu City AirBnB - Listings Data.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Skip the header row
    FIELDTERMINATOR = ',',  -- The delimiter
    ROWTERMINATOR = '\n',   -- New line character
    TABLOCK                 -- Helps with speed
);

-- =======================================================
-- 2. Create Past Calendar Rates Table
-- =======================================================

DROP TABLE IF EXISTS past_calendar_rates;
CREATE TABLE past_calendar_rates (
	listing_id int NOT NULL,
    date date NULL,
    vacant_days tinyint NULL,
    reserved_days tinyint NULL,
    occupancy float NULL,
    revenue smallint NULL,
    rate_avg float NULL,
    booked_rate_avg float NULL,
    booking_lead_time_avg smallint NULL,
    length_of_stay_avg tinyint NULL,
    min_nights_avg tinyint NULL,
    native_booked_rate_avg int NULL,
    native_rate_avg int NULL,
    native_revenue int NULL
);

BULK INSERT past_calendar_rates 
FROM 'C:\Users\jomjo\OneDrive\Desktop\The Ultimate Microsoft Excel Mastery Bundle - 8 Courses\SQL Server Projects\Cebu City AirBnB - Past Calendar Rates.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,           -- Skip the header row
    FIELDTERMINATOR = ',',  -- The delimiter
    ROWTERMINATOR = '\n',   -- New line character
    TABLOCK                 -- Helps with speed
);