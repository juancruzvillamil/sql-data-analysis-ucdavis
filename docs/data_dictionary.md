# Data Dictionary

This document describes the datasets used in the project.

## Tables

### cheese_production
Contains cheese production records by year and state.

Main columns:
- 'Year': year of the record.
- `Period`: time period of the record.
- `State_ANSI`: state identifier used to connect with `state_lookup`.
- Production/value column: production quantity reported in the dataset.

### coffee_production
Contains coffee production records by year and state.

Main columns:
- `Year`
- `Period`
- `State_ANSI`
- Production/value column

### egg_production
Contains egg production records by year and state.

Main columns:
- `Year`
- `Period`
- `State_ANSI`
- Production/value column

### honey_production
Contains honey production records by year and state.

Main columns:
- `Year`
- `State_ANSI`
- Production/value column

### milk_production
Contains milk production records by year and state.

Main columns:
- `Year`
- `Period`
- `State_ANSI`
- Production/value column

### yogurt_production
Contains yogurt production records by year and state.

Main columns:
- `Year`
- `Period`
- `State_ANSI`
- Production/value column

### state_lookup
Lookup table used to connect state codes with state names.

Main columns:
- `State_ANSI`: state identifier.
- State name column.