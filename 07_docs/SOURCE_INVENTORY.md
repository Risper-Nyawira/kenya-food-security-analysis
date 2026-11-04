# Kenya Food Security Project - Data Source Inventory

Project question:

How have agricultural production, climate variability, and market dynamics influenced food security across Kenya?

## Raw Data Files

| File | Theme | What it adds | Source |
|---|---|---|---|
| `raw/faostat_kenya_crop_livestock.csv` | Agricultural production | Kenya crop/livestock production, yield, area harvested, stocks and livestock measures, 2000-2024 | FAOSTAT download provided by user |
| `raw/Food_Security_Data_E_Africa.zip` | Food security outcomes | FAOSTAT Suite of Food Security Indicators for Africa, including Kenya indicators | FAOSTAT download already on machine |
| `raw/Food_Security_Data_E_All_Data.zip` | Food security outcomes | Global FAOSTAT food security indicators | FAOSTAT download already on machine |
| `raw/wfp_food_prices_kenya.csv` | Market dynamics | Kenya food prices by date, market, commodity, price type, currency, KES price, USD price | HDX/WFP Kenya Food Prices |
| `raw/wfp_markets_kenya.csv` | Market geography | Kenya market IDs, market names, admin areas, latitude, longitude | HDX/WFP Kenya Food Prices |
| `raw/worldbank_kenya_average_precipitation_depth_mm.csv` | Climate | Kenya average precipitation depth indicator | World Bank Indicators API |
| `raw/worldbank_kenya_land_surface_temperature_c.csv` | Climate | Kenya land surface temperature indicator | World Bank Indicators API |
| `raw/worldbank_kenya_spei.csv` | Climate | Standardised Precipitation-Evapotranspiration Index, useful for drought/wetness | World Bank Indicators API |
| `raw/worldbank_kenya_heat_index_35.csv` | Climate | Heat stress indicator | World Bank Indicators API |
| `raw/worldbank_kenya_heating_degree_days.csv` | Climate | Temperature-related climate indicator | World Bank Indicators API |

## Source URLs

- HDX/WFP Kenya Food Prices: https://data.humdata.org/dataset/wfp-food-prices-for-kenya
- World Bank Climate Change Knowledge Portal: https://climateknowledgeportal.worldbank.org/
- World Bank Indicators API: https://api.worldbank.org/v2/
- FAOSTAT: https://www.fao.org/faostat/

## Useful Next Tables

For SQL and Power BI, the clean database can be organized as:

- `production`: agricultural production/yield/area rows from FAOSTAT
- `food_security`: Kenya food security indicators reshaped from wide year columns into long format
- `market_prices`: WFP monthly food prices
- `markets`: WFP market locations
- `climate_indicators`: World Bank annual climate indicators

