-- Active: 1777627290817@@127.0.0.1@5432@analysis@public
SELECT 2 + 2;

SELECT 3 - 4;

SELECT 10 * 20 AS result;

SELECT 11 / 6;

SELECT 11 % 6;

select 11.0 / 6;

SELECT CAST(11 AS NUMERIC(3, 1)) / 6;

SELECT 4 ^ 3;

SELECT |/ 4;

SELECT SQRT(4);

SELECT ||/ 9;

SELECT factorial(4);

SELECT 3 ^ 3 - 1;

SELECT 3 ^ (3 - 1);

SELECT
    county_name AS county,
    state_name AS state,
    pop_est_2019 AS pop,
    births_2019 AS births,
    deaths_2019 AS deaths,
    international_migr_2019 AS int_migr,
    domestic_migr_2019 AS dom_migr,
    residual_2019 AS residual
FROM us_counties_pop_est_2019;

SELECT
    county_name AS county,
    state_name AS state,
    births_2019 AS births,
    deaths_2019 AS deaths,
    births_2019 - deaths_2019 AS natural_increase
FROM us_counties_pop_est_2019
ORDER BY state_name, county_name;

SELECT
    county_name AS county,
    state_name AS state,
    pop_est_2019 AS pop,
    pop_est_2018 + births_2019 - deaths_2019 + international_migr_2019 + domestic_migr_2019 + residual_2019 AS components_total,
    pop_est_2019 - (
        pop_est_2018 + births_2019 - deaths_2019 + international_migr_2019 + domestic_migr_2019 + residual_2019
    ) AS difference
FROM us_counties_pop_est_2019
ORDER BY difference DESC;

SELECT sum(pop_est_2019) AS county_sum, round(avg(pop_est_2019), 0) AS county_average
FROM us_counties_pop_est_2019;