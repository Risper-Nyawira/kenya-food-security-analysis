-- Recovered and completed SQLite view definitions for Kenya food security project

DROP VIEW IF EXISTS food_security_yearly;
CREATE VIEW food_security_yearly AS
SELECT 2015 AS year, Y20142016 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2016 AS year, Y20152017 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2017 AS year, Y20162018 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2018 AS year, Y20172019 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2019 AS year, Y20182020 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2020 AS year, Y20192021 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2021 AS year, Y20202022 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)'
UNION ALL
SELECT 2022 AS year, Y20212023 AS food_insecurity_percent
FROM food_security_raw
WHERE Area = 'Kenya' AND Element = 'Value' AND Item = 'Prevalence of moderate or severe food insecurity in the total population (percent) (3-year average)';

DROP VIEW IF EXISTS maize_food_security_analysis;
CREATE VIEW maize_food_security_analysis AS
SELECT
    m.year,
    m.maize_production_tonnes,
    m.maize_yield_kg_per_ha,
    m.maize_area_harvested_ha,
    m.avg_maize_retail_price_kes,
    m.avg_maize_retail_price_usd,
    m.price_records,
    m.commodities_used,
    c.rainfall_mm,
    c.temperature_c,
    c.spei,
    c.heat_index_35,
    f.food_insecurity_percent
FROM maize_production_prices AS m
LEFT JOIN yearly_climate AS c
    ON m.year = c.year
LEFT JOIN food_security_yearly AS f
    ON m.year = f.year;

DROP VIEW IF EXISTS maize_production_prices;
CREATE VIEW maize_production_prices AS
SELECT
    p.year,
    p.maize_production_tonnes,
    p.maize_yield_kg_per_ha,
    p.maize_area_harvested_ha,
    m.avg_maize_retail_price_kes,
    m.avg_maize_retail_price_usd,
    m.price_records,
    m.commodities_used
FROM maize_yearly_production AS p
LEFT JOIN maize_yearly_prices AS m
    ON p.year = m.year;

DROP VIEW IF EXISTS maize_yearly_prices;
CREATE VIEW maize_yearly_prices AS
SELECT
    CAST(strftime('%Y', date) AS INTEGER) AS year,
    AVG(price) AS avg_maize_retail_price_kes,
    AVG(usdprice) AS avg_maize_retail_price_usd,
    COUNT(*) AS price_records,
    GROUP_CONCAT(DISTINCT commodity) AS commodities_used
FROM market_prices
WHERE unit = 'KG'
  AND pricetype = 'Retail'
  AND commodity IN ('Maize (white)', 'Maize')
GROUP BY CAST(strftime('%Y', date) AS INTEGER);

DROP VIEW IF EXISTS maize_yearly_production;
CREATE VIEW maize_yearly_production AS
SELECT
    year,
    MAX(CASE WHEN element = 'Production' THEN value END) AS maize_production_tonnes,
    MAX(CASE WHEN element = 'Yield' THEN value END) AS maize_yield_kg_per_ha,
    MAX(CASE WHEN element = 'Area harvested' THEN value END) AS maize_area_harvested_ha
FROM production
WHERE item = 'Maize (corn)'
GROUP BY year;

DROP VIEW IF EXISTS yearly_climate;
CREATE VIEW yearly_climate AS
SELECT
    p.year,
    p.value AS rainfall_mm,
    t.value AS temperature_c,
    s.value AS spei,
    h.value AS heat_index_35
FROM climate_precipitation AS p
LEFT JOIN climate_temperature AS t
    ON p.year = t.year
LEFT JOIN climate_spei AS s
    ON p.year = s.year
LEFT JOIN climate_heat AS h
    ON p.year = h.year;

