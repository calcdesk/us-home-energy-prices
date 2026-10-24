#!/usr/bin/env bash
# Downloads the latest CSVs published by CalcDesk (built from U.S. EIA data).
set -euo pipefail
BASE="https://calcdesk.pages.dev/data"
for f in heating-oil-prices-by-state propane-prices-by-state natural-gas-prices-by-state electricity-prices-by-state gasoline-prices-by-state ev-registration-fees-by-state; do
  curl -fsS "$BASE/$f.csv" -o "data/$f.csv.tmp"
  # keep the old file if the download is empty or not a CSV
  if head -1 "data/$f.csv.tmp" | grep -q '^state,'; then mv "data/$f.csv.tmp" "data/$f.csv"; else rm "data/$f.csv.tmp"; fi
done
