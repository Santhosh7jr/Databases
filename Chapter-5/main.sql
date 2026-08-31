CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,
    county_fips text,
    region smallint,
    state_name text,
    county_name text,
    area_land bigint,
    area_water bigint,
    internal_point_lat numeric(10, 7),
    internal_point_lon numeric(10, 7),
    pop_est_2018 integer,
    pop_est_2019 integer,
    births_2019 integer,
    deaths_2019 integer,
    international_migr_2019 integer,
    domestic_migr_2019 integer,
    residual_2019 integer,
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)
);

select * from us_counties_pop_est_2019;

COPY us_counties_pop_est_2019
FROM 'F:\Postgres\Chapter-5\us_counties_pop_est_2019.CSV'
WITH (FORMAT CSV, HEADER);

SELECT * FROM us_counties_pop_est_2019;

SELECT
    county_name,
    state_name,
    area_land
FROM us_counties_pop_est_2019
ORDER BY area_land DESC
LIMIT 3;

COPY (SELECT county_name, state_name, area_land FROM us_counties_pop_est_2019)
TO 'F:\Postgres\Chapter-5\countries_land_area.csv'
WITH (FORMAT CSV, HEADER);