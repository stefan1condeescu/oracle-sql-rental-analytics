# Query results

Screenshots from Oracle SQL Developer.

## Data verification

The sample data contains 3 centers, 10 employees, 12 vehicles and 30 rentals.

![Sample table counts](data-verification.png)

## H1: Employee hierarchy

The director, three coordinators and six operators form a three-level hierarchy.

![Employee hierarchy, levels and paths](h1-employee-hierarchy.png)

## C1: Center revenue

Mamaia meets both conditions: at least 10 rentals and revenue above 500 RON.

![Mamaia Center with 16 rentals and revenue of 1005 RON](c1-center-revenue.png)

## A5: Vehicle revenue ranking

Vehicles are ranked by revenue within each center. Eforie's equal totals share rank 1, followed by ranks 3 and 4.

![Nine rented vehicles ranked by revenue within each center](a5-vehicle-revenue-ranking.png)

## A6: Previous rental amount

`LAG` returns the preceding rental amount for each vehicle; its first rental has no previous amount.

![Current and previous rental amounts by vehicle](a6-previous-rental-amount.png)
