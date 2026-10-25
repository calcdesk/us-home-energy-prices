# U.S. Home Energy Prices by State (CSV, updated weekly)

**Real U.S. energy prices by state, updated every week.** Clean, ready-to-use CSV files with residential energy prices for every U.S. state: heating oil, propane, natural gas, electricity and gasoline, plus the yearly EV registration fee in each state.

The price files are built from U.S. Energy Information Administration (EIA) data and refreshed automatically every week by a GitHub Action. No API key, no scraping, just CSV.

## Files

| File | What's in it | Updated | Interactive version |
|---|---|---|---|
| [`data/heating-oil-prices-by-state.csv`](data/heating-oil-prices-by-state.csv) | Residential heating oil, $/gallon, this week and the previous survey week (Northeast and Midwest states surveyed by EIA) | Weekly, Oct–Mar | [Heating oil prices by state](https://calcdesk.pages.dev/heating-oil-prices/) |
| [`data/propane-prices-by-state.csv`](data/propane-prices-by-state.csv) | Residential propane, $/gallon, this week and the previous survey week | Weekly, Oct–Mar | [Propane prices by state](https://calcdesk.pages.dev/propane-prices/) |
| [`data/heating-oil-weekly-history.csv`](data/heating-oil-weekly-history.csv) | Weekly residential heating oil price by state for the last 3 heating seasons (Oct–Mar) | Weekly, Oct–Mar | [Heating oil prices by state](https://calcdesk.pages.dev/heating-oil-prices/) |
| [`data/propane-weekly-history.csv`](data/propane-weekly-history.csv) | Weekly residential propane price by state for the last 3 heating seasons (Oct–Mar) | Weekly, Oct–Mar | [Propane prices by state](https://calcdesk.pages.dev/propane-prices/) |
| [`data/natural-gas-prices-by-state.csv`](data/natural-gas-prices-by-state.csv) | Residential natural gas, $/Mcf and $/therm (annual average), latest monthly price, average household use per year | Monthly | [Natural gas cost by state](https://calcdesk.pages.dev/natural-gas-cost-by-state/) |
| [`data/electricity-prices-by-state.csv`](data/electricity-prices-by-state.csv) | Residential electricity, ¢/kWh (latest month and a year earlier), average monthly kWh and bill | Monthly | [Electricity cost by state](https://calcdesk.pages.dev/electricity-cost-by-state/) |
| [`data/gasoline-prices-by-state.csv`](data/gasoline-prices-by-state.csv) | Regular gasoline, $/gallon, from the EIA state or regional (PADD) weekly series | Weekly | [EV vs gas cost by state](https://calcdesk.pages.dev/ev-vs-gas-cost-by-state/) |
| [`data/ev-registration-fees-by-state.csv`](data/ev-registration-fees-by-state.csv) | Extra yearly registration fee for battery EVs and plug-in hybrids, with notes and a source link per state | When laws change | [EV vs gas cost by state](https://calcdesk.pages.dev/ev-vs-gas-cost-by-state/) |

Every file has one row per state (plus a `United States` row where EIA publishes a national average) and a `state_slug` column for easy joins.

## Quick start

```python
import pandas as pd
url = "https://raw.githubusercontent.com/calcdesk/us-home-energy-prices/main/data/propane-prices-by-state.csv"
df = pd.read_csv(url)
print(df.sort_values("price_usd_per_gallon").head())
```

```r
df <- read.csv("https://raw.githubusercontent.com/calcdesk/us-home-energy-prices/main/data/electricity-prices-by-state.csv")
```

## Notes

- Prices are before taxes and delivery fees, as published by EIA.
- 1 Mcf of natural gas ≈ 10.37 therms (EIA heat content of about 1,037 Btu per cubic foot).
- Heating oil and propane are only surveyed during the heating season (October–March); outside the season the files keep the last surveyed week.
- Gasoline uses the state series where EIA publishes one, otherwise the regional (PADD) average shown in `eia_area`.
- EV registration fees were compiled from NCSL, the Tax Foundation, the U.S. DOE Alternative Fuels Data Center and state DMV pages. Rows marked `needs_verification = yes` could not be checked against an official state page for the current year.

## Sources

- EIA Heating Oil and Propane Update (weekly residential prices)
- EIA Natural Gas Prices (residential price, consumers and consumption by state)
- EIA Electric Power Monthly, Table 5.6.A, and Electric Sales, Revenue, and Average Price, Table 5A
- EIA Gasoline and Diesel Fuel Update (weekly retail prices)

EIA data is public domain. The compiled files are published by [CalcDesk](https://calcdesk.pages.dev/), which uses them in free cost calculators for heating, electricity, EV charging and car ownership.

## License

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Use them for anything, including commercial work. Please credit "CalcDesk, from U.S. EIA data" with a link to https://calcdesk.pages.dev/.
