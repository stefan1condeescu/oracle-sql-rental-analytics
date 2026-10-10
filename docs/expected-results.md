# Expected results

Reference outputs for the sample data in [rental_analytics.sql](../rental_analytics.sql). All amounts are in RON.

## Dataset check

| Table | Rows |
|---|---:|
| `centers` | 3 |
| `employees` | 10 |
| `vehicles` | 12 |
| `rentals` | 30 |

The 30 rentals produce **1,380 RON** in total: Mamaia 1,005, Eforie 285 and Costinesti 90.

## Hierarchical and complex queries

| ID | Result rows | Checkpoint |
|---|---:|---|
| H1 | 10 | Director Radu Marin is level 1; three coordinators are level 2; six operators are level 3. Every `director` value is `Marin`. |
| H2 | 2 | Employee 7's superiors are Mihai Dobre (ID 3, level 2) and Radu Marin (ID 1, level 3), in that order. |
| C1 | 1 | Mamaia Center: 16 rentals and revenue of 1,005. |
| C2 | 2 | Electric Mamaia (103): 6 rentals, revenue 630; Trekking Mamaia (102): 5 rentals, revenue 240. |
| C3 | 1 | Eforie Center: 10 rentals and revenue of 285. |
| C4 | 2 | Rusu Vlad (7): 5 rentals, revenue 155; Petrescu Ana (8): 5 rentals, revenue 130. |
| C5 | 1 | Urban Mamaia (104), Scooter, hourly rate 25, in Mamaia Center. |
| C6 | 9 | Rental IDs in displayed order: 7, 9, 12, 3, 5, 11, 13, 16, 22. |

For C6, the corresponding amounts are **45, 80, 60, 90, 120, 150, 120, 90, 45**. C2 and C4 total all rentals of the qualifying vehicle or employee; they do not aggregate only the rentals that satisfied the subquery condition.

H1's path for employee 7 is `/Marin/Dobre/Rusu`. H2 excludes employee 7 but retains levels measured from that employee, so its first displayed level is 2.

## Analytic queries

| ID | Result rows | Checkpoint |
|---|---:|---|
| A1 | 30 | The first three Mamaia averages are 15, 27.5 and 48.33. |
| A2 | 30 | Final cumulative revenue is 1,005 for Mamaia, 285 for Eforie and 90 for Costinesti. |
| A3 | 12 | Counts in hourly-rate order are Mamaia: 2, 3, 3, 2; Eforie: 2, 3, 3, 2; Costinesti: 1, 2, 2, 1. |
| A4 | 12 | Center minimum/maximum rates are Mamaia 15/30, Eforie 10/25 and Costinesti 12/28. |
| A5 | 9 | Eforie's ranks are 1, 1, 3, 4; unused vehicles are excluded. |
| A6 | 30 | Nine vehicles have rentals, so there are nine first-row `NULL` values in `previous_rental_amount`. |

### A1 and A2: initial values and chronological order

| Mamaia rental ID | `rental_amount` | `avg_last_3_rentals` | `cumulative_revenue` |
|---|---:|---:|---:|
| 1 | 15 | 15 | 15 |
| 2 | 40 | 27.5 | 55 |
| 3 | 90 | 48.33 | 145 |
| 4 | 30 | 53.33 | 175 |

The first two A1 windows contain only one and two available rentals. The whole Mamaia chronological sequence is **1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 10, 12, 13, 14, 15, 16**. On September 2, rental 11 starts at 12:00 and rental 10 at 13:00; their A2 cumulative totals are 650 and 665. A date-only display does not change this ordering.

### A3: the inclusive rate interval

| Center | Vehicle IDs in rate order | Hourly rates | `vehicles_in_range` |
|---|---|---|---|
| Mamaia | 101, 102, 104, 103 | 15, 20, 25, 30 | 2, 3, 3, 2 |
| Eforie | 201, 202, 204, 203 | 10, 15, 20, 25 | 2, 3, 3, 2 |
| Costinesti | 301, 302, 304, 303 | 12, 18, 22, 28 | 1, 2, 2, 1 |

For Mamaia's 20 RON rate, the interval is [15, 25], so it includes three vehicles. The current vehicle and exact boundary rates are included.

### A5: vehicle revenue ranking

| Center | Vehicle ID | Model | Revenue | `revenue_rank` |
|---|---:|---|---:|---:|
| Mamaia | 103 | Electric Mamaia | 630 | 1 |
| Mamaia | 102 | Trekking Mamaia | 240 | 2 |
| Mamaia | 101 | City Mamaia | 135 | 3 |
| Eforie | 202 | Trekking Eforie | 90 | 1 |
| Eforie | 204 | Urban Eforie | 90 | 1 |
| Eforie | 203 | Electric Eforie | 75 | 3 |
| Eforie | 201 | City Eforie | 30 | 4 |
| Costinesti | 302 | Trekking Costinesti | 54 | 1 |
| Costinesti | 301 | City Costinesti | 36 | 2 |

### A6: previous rental amount

For City Mamaia (vehicle 101):

| Rental ID | `rental_amount` | `previous_rental_amount` |
|---|---:|---:|
| 1 | 15 | `NULL` |
| 4 | 30 | 15 |
| 7 | 45 | 30 |
| 10 | 15 | 45 |
| 14 | 30 | 15 |

The previous value restarts at `NULL` for each vehicle. It does not refer to the preceding rental elsewhere in the network.

## Manual screenshot shortlist

Capture these five results in Oracle SQL Developer. Include the query comment, code and result columns. Use F9 for each `SELECT` and fetch all rows before checking the count.

| Capture | What to show |
|---|---|
| Dataset verification | All four table counts: 3, 10, 12 and 30. |
| H1 | All 10 employees with levels, director and hierarchy paths. |
| C1 | The Mamaia row with 16 rentals and revenue of 1,005. |
| A5 | All nine ranked vehicles, including Eforie's tie at rank 1. |
| A6 | The first rows for vehicles 101 and 102, including each first-row `NULL`. |

A3 can replace A5 if the presentation should focus on `RANGE` windows: capture all 12 vehicles and their rate-interval counts. Store the real captures in `docs/screenshots/` when available.
