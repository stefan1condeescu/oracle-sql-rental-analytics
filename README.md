# Oracle SQL Rental Analytics

I built this university project to practice **advanced Oracle SQL** using a bicycle and scooter rental network in Mamaia, Eforie and Costinesti, Romania. The queries explore employee hierarchies, rental revenue and vehicle usage.

The script includes two hierarchical queries, six queries using joins, subqueries and aggregation, and six analytic queries.

## Schema and sample data

![Rental database schema](docs/schema.svg)

| Table | Stores | Rows |
|---|---|---:|
| `centers` | Rental locations | 3 |
| `employees` | Staff and their managers | 10 |
| `vehicles` | Models, types and hourly rates | 12 |
| `rentals` | Vehicles, recording employees, start times, durations and applied rates | 30 |

Foreign keys connect the tables; `employees.manager_id` defines the reporting hierarchy. Rental revenue is `hours * applied_hourly_rate`, in **RON**, using the rate recorded for each rental.

## Run in Oracle SQL Developer

1. Connect to an Oracle schema and open [rental_analytics.sql](rental_analytics.sql).
2. Run it once with **F5** to create the tables, insert the sample data and execute the queries.
3. Select individual `SELECT` statements and use **F9** for result grids.

If the tables already contain the sample data, rerun only the `SELECT` statements.

## Query catalog

| ID | Purpose |
|---|---|
| H1 | Director and subordinates, with hierarchy levels and paths |
| H2 | Employee 7's superiors, excluding the employee |
| C1 | Centers with at least 10 rentals and revenue above 500 RON |
| C2 | Vehicles with a rental of at least 4 hours and revenue above 100 RON from all rentals |
| C3 | Centers where every vehicle has been rented, with counts and revenue |
| C4 | Employees with at least 3 rentals, including a scooter rental; totals from all rentals |
| C5 | Unused vehicles in centers with revenue above 500 RON |
| C6 | Rentals over 2 hours recorded by employees with at least 5 rentals in total |
| A1 | Average amount of the current rental and up to two preceding rentals, by center |
| A2 | Cumulative revenue in chronological order, by center |
| A3 | Vehicles within ±5 RON of each vehicle's rate, counted by center (inclusive) |
| A4 | Each vehicle's rate alongside its center's minimum and maximum |
| A5 | Rented vehicle revenue ranking within each center, with ties |
| A6 | Current and previous rental amounts for the same vehicle |

See [expected results](docs/expected-results.md) for output counts and examples, including ranking ties and the first `NULL` returned by `LAG` for each vehicle.
