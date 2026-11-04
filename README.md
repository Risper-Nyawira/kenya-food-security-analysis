# Kenya Food Security Project

Project question: How have agricultural production, climate variability, and market dynamics influenced food security across Kenya?

## Folder Order

1. `01_data/raw` - original source datasets.
2. `01_data/processed` - cleaned/exported analysis datasets for Python and Power BI.
3. `02_database` - SQLite project database.
4. `03_sql` - recovered SQL views and database object definitions.
5. `04_powerbi` - reserved for a Power BI dashboard file.
6. `05_python/notebooks` - completed Python/Jupyter analysis notebook.
7. `06_outputs` - charts and final tables exported from Python.
8. `07_docs` - source inventory and project notes.

## Current Main Processed Dataset

`01_data/processed/maize_food_security_analysis.csv`

This CSV is exported from the SQLite view `maize_food_security_analysis` and is the recommended starting point for Python analysis.

## Conclusion

Food security is not determined by maize production alone. The combined evidence shows that climate variability and market affordability matter alongside agricultural output. Read the full interpretation and recommendations in `07_docs/CONCLUSIONS_AND_RECOMMENDATIONS.md`.

## Python Analysis

Open `05_python/notebooks/01_kenya_food_security_analysis.ipynb` in Anaconda Jupyter Notebook, then choose `Kernel` and `Restart Kernel and Run All Cells`. The notebook creates the charts and tables in `06_outputs`.

## Important Limitation

The food-security indicator is a three-year moving average with eight available observations. The analysis identifies patterns and context; it does not prove that a single factor caused food insecurity.
