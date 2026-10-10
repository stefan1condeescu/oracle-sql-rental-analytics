-- Centers
create table centers (
    center_id number(2) primary key,
    center_name varchar2(40) not null,
    location varchar2(30) not null
);

-- Employees and managers
create table employees (
    employee_id number(3) primary key,
    last_name varchar2(25) not null,
    first_name varchar2(25) not null,
    job_title varchar2(20) not null,
    center_id number(2) not null references centers(center_id),
    manager_id number(3) references employees(employee_id)
);

-- Vehicles
create table vehicles (
    vehicle_id number(3) primary key,
    model varchar2(40) not null,
    vehicle_type varchar2(20) not null,
    hourly_rate number(6,2) not null check (hourly_rate > 0),
    center_id number(2) not null references centers(center_id)
);

-- Rentals
create table rentals (
    rental_id number(3) primary key,
    vehicle_id number(3) not null references vehicles(vehicle_id),
    employee_id number(3) not null references employees(employee_id),
    start_date date not null,
    hours number(4,1) not null check (hours > 0),
    applied_hourly_rate number(6,2) not null check (applied_hourly_rate > 0)
);

-- Center data
insert into centers values (1, 'Mamaia Center', 'Mamaia');
insert into centers values (2, 'Eforie Center', 'Eforie');
insert into centers values (3, 'Costinesti Center', 'Costinesti');

-- Employee data
insert into employees values (1, 'Marin', 'Radu', 'Director', 1, null);
insert into employees values (2, 'Ionescu', 'Elena', 'Coordinator', 1, 1);
insert into employees values (3, 'Dobre', 'Mihai', 'Coordinator', 2, 1);
insert into employees values (4, 'Matei', 'Ioana', 'Coordinator', 3, 1);
insert into employees values (5, 'Popa', 'Andrei', 'Operator', 1, 2);
insert into employees values (6, 'Stan', 'Maria', 'Operator', 1, 2);
insert into employees values (7, 'Rusu', 'Vlad', 'Operator', 2, 3);
insert into employees values (8, 'Petrescu', 'Ana', 'Operator', 2, 3);
insert into employees values (9, 'Enache', 'Darius', 'Operator', 3, 4);
insert into employees values (10, 'Ilie', 'Teodora', 'Operator', 3, 4);

-- Vehicle data
insert into vehicles values (101, 'City Mamaia', 'Bicycle', 15, 1);
insert into vehicles values (102, 'Trekking Mamaia', 'Bicycle', 20, 1);
insert into vehicles values (103, 'Electric Mamaia', 'Electric bicycle', 30, 1);
insert into vehicles values (104, 'Urban Mamaia', 'Scooter', 25, 1);
insert into vehicles values (201, 'City Eforie', 'Bicycle', 10, 2);
insert into vehicles values (202, 'Trekking Eforie', 'Bicycle', 15, 2);
insert into vehicles values (203, 'Electric Eforie', 'Electric bicycle', 25, 2);
insert into vehicles values (204, 'Urban Eforie', 'Scooter', 20, 2);
insert into vehicles values (301, 'City Costinesti', 'Bicycle', 12, 3);
insert into vehicles values (302, 'Trekking Costinesti', 'Bicycle', 18, 3);
insert into vehicles values (303, 'Electric Costinesti', 'Electric bicycle', 28, 3);
insert into vehicles values (304, 'Urban Costinesti', 'Scooter', 22, 3);

-- Mamaia rentals
insert into rentals values (1, 101, 5, to_date('2026-09-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 15);
insert into rentals values (2, 102, 6, to_date('2026-09-01 09:30', 'YYYY-MM-DD HH24:MI'), 2, 20);
insert into rentals values (3, 103, 5, to_date('2026-09-01 10:00', 'YYYY-MM-DD HH24:MI'), 3, 30);
insert into rentals values (4, 101, 6, to_date('2026-09-01 12:00', 'YYYY-MM-DD HH24:MI'), 2, 15);
insert into rentals values (5, 103, 5, to_date('2026-09-01 14:00', 'YYYY-MM-DD HH24:MI'), 4, 30);
insert into rentals values (6, 102, 6, to_date('2026-09-01 14:30', 'YYYY-MM-DD HH24:MI'), 1, 20);
insert into rentals values (7, 101, 5, to_date('2026-09-02 09:00', 'YYYY-MM-DD HH24:MI'), 3, 15);
insert into rentals values (8, 103, 5, to_date('2026-09-02 09:30', 'YYYY-MM-DD HH24:MI'), 2, 30);
insert into rentals values (9, 102, 6, to_date('2026-09-02 10:00', 'YYYY-MM-DD HH24:MI'), 4, 20);
insert into rentals values (10, 101, 6, to_date('2026-09-02 13:00', 'YYYY-MM-DD HH24:MI'), 1, 15);
insert into rentals values (11, 103, 5, to_date('2026-09-02 12:00', 'YYYY-MM-DD HH24:MI'), 5, 30);
insert into rentals values (12, 102, 6, to_date('2026-09-02 15:00', 'YYYY-MM-DD HH24:MI'), 3, 20);
insert into rentals values (13, 103, 5, to_date('2026-09-03 09:00', 'YYYY-MM-DD HH24:MI'), 4, 30);
insert into rentals values (14, 101, 6, to_date('2026-09-03 09:30', 'YYYY-MM-DD HH24:MI'), 2, 15);
insert into rentals values (15, 102, 6, to_date('2026-09-03 10:00', 'YYYY-MM-DD HH24:MI'), 2, 20);
insert into rentals values (16, 103, 5, to_date('2026-09-03 14:00', 'YYYY-MM-DD HH24:MI'), 3, 30);

-- Eforie rentals
insert into rentals values (17, 201, 7, to_date('2026-09-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 10);
insert into rentals values (18, 202, 8, to_date('2026-09-01 09:30', 'YYYY-MM-DD HH24:MI'), 2, 15);
insert into rentals values (19, 203, 7, to_date('2026-09-01 10:00', 'YYYY-MM-DD HH24:MI'), 2, 25);
insert into rentals values (20, 204, 8, to_date('2026-09-01 10:30', 'YYYY-MM-DD HH24:MI'), 1, 20);
insert into rentals values (21, 201, 8, to_date('2026-09-02 09:00', 'YYYY-MM-DD HH24:MI'), 2, 10);
insert into rentals values (22, 202, 8, to_date('2026-09-02 09:30', 'YYYY-MM-DD HH24:MI'), 3, 15);
insert into rentals values (23, 203, 7, to_date('2026-09-02 10:00', 'YYYY-MM-DD HH24:MI'), 1, 25);
insert into rentals values (24, 204, 7, to_date('2026-09-02 10:30', 'YYYY-MM-DD HH24:MI'), 2, 20);
insert into rentals values (25, 202, 8, to_date('2026-09-03 09:00', 'YYYY-MM-DD HH24:MI'), 1, 15);
insert into rentals values (26, 204, 7, to_date('2026-09-03 09:30', 'YYYY-MM-DD HH24:MI'), 1.5, 20);

-- Costinesti rentals
insert into rentals values (27, 301, 9, to_date('2026-09-01 09:00', 'YYYY-MM-DD HH24:MI'), 1, 12);
insert into rentals values (28, 302, 10, to_date('2026-09-01 09:30', 'YYYY-MM-DD HH24:MI'), 2, 18);
insert into rentals values (29, 301, 9, to_date('2026-09-02 09:00', 'YYYY-MM-DD HH24:MI'), 2, 12);
insert into rentals values (30, 302, 10, to_date('2026-09-03 09:00', 'YYYY-MM-DD HH24:MI'), 1, 18);

commit;

-- Data verification
select 'centers' as table_name, count(*) as row_count from centers
union all
select 'employees', count(*) from employees
union all
select 'vehicles', count(*) from vehicles
union all
select 'rentals', count(*) from rentals;

-- H1: The director and all employees in the reporting hierarchy.
select employee_id, last_name, first_name, job_title, center_id, manager_id,
       level as hierarchy_level,
       connect_by_root last_name as director,
       sys_connect_by_path(last_name, '/') as hierarchy_path
from employees
start with employee_id = 1
connect by prior employee_id = manager_id
order by level, employee_id;

-- H2: The managers above employee 7, excluding the employee.
select employee_id, last_name, first_name, job_title, manager_id,
       level as hierarchy_level
from employees
where level > 1
start with employee_id = 7
connect by prior manager_id = employee_id
order by level;

-- C1: Centers with at least 10 rentals and total revenue above RON 500.
select c.center_id, c.center_name,
       count(r.rental_id) as rental_count,
       sum(r.hours * r.applied_hourly_rate) as revenue
from centers c
join vehicles v on v.center_id = c.center_id
join rentals r on r.vehicle_id = v.vehicle_id
where c.center_id in (
    select v2.center_id
    from rentals r2
    join vehicles v2 on v2.vehicle_id = r2.vehicle_id
    group by v2.center_id
    having count(*) >= 10
)
group by c.center_id, c.center_name
having sum(r.hours * r.applied_hourly_rate) > 500
order by revenue desc;

-- C2: Vehicles with at least one rental lasting 4 hours or more
-- and total revenue above RON 100, calculated from all their rentals.
select c.center_name, v.vehicle_id, v.model,
       count(r.rental_id) as rental_count,
       sum(r.hours * r.applied_hourly_rate) as revenue
from centers c
join vehicles v on v.center_id = c.center_id
join rentals r on r.vehicle_id = v.vehicle_id
where v.vehicle_id in (
    select r2.vehicle_id
    from rentals r2
    where r2.hours >= 4
)
group by c.center_name, v.vehicle_id, v.model
having sum(r.hours * r.applied_hourly_rate) > 100
order by revenue desc;

-- C3: Centers where every vehicle has been rented at least once,
-- together with each center's total rental count and revenue.
select c.center_id, c.center_name,
       count(r.rental_id) as rental_count,
       sum(r.hours * r.applied_hourly_rate) as revenue
from centers c
join vehicles v on v.center_id = c.center_id
join rentals r on r.vehicle_id = v.vehicle_id
where c.center_id not in (
    select v2.center_id
    from vehicles v2
    left join rentals r2 on r2.vehicle_id = v2.vehicle_id
    where r2.rental_id is null
)
group by c.center_id, c.center_name
order by c.center_id;

-- C4: Employees who recorded at least 3 rentals, including at least
-- one scooter rental, with their total rental count and revenue.
select c.center_id, c.center_name, e.employee_id, e.last_name, e.first_name,
       count(r.rental_id) as rental_count,
       sum(r.hours * r.applied_hourly_rate) as revenue
from employees e
join centers c on c.center_id = e.center_id
join rentals r on r.employee_id = e.employee_id
where e.employee_id in (
    select r2.employee_id
    from rentals r2
    join vehicles v2 on v2.vehicle_id = r2.vehicle_id
    where v2.vehicle_type = 'Scooter'
)
group by c.center_id, c.center_name, e.employee_id, e.last_name, e.first_name
having count(r.rental_id) >= 3
order by c.center_id, e.employee_id;

-- C5: Vehicles that have never been rented, from centers with total
-- revenue above RON 500, including their model, type and hourly rate.
select c.center_id, c.center_name, v.vehicle_id, v.model, v.vehicle_type, v.hourly_rate
from centers c
join vehicles v on v.center_id = c.center_id
left join rentals r on r.vehicle_id = v.vehicle_id
where r.rental_id is null
  and c.center_id in (
      select v2.center_id
      from vehicles v2
      join rentals r2 on r2.vehicle_id = v2.vehicle_id
      group by v2.center_id
      having sum(r2.hours * r2.applied_hourly_rate) > 500
  )
order by c.center_id, v.vehicle_id;

-- C6: Rentals lasting more than 2 hours, recorded by employees
-- who recorded at least 5 rentals in total, regardless of duration.
select r.rental_id, c.center_name as center, v.model,
       e.last_name || ' ' || e.first_name as employee,
       r.start_date, r.hours,
       r.hours * r.applied_hourly_rate as rental_amount
from rentals r
join vehicles v on v.vehicle_id = r.vehicle_id
join centers c on c.center_id = v.center_id
join employees e on e.employee_id = r.employee_id
where r.hours > 2
  and (
      select count(*)
      from rentals r2
      where r2.employee_id = r.employee_id
  ) >= 5
order by c.center_id, v.vehicle_id, r.start_date;

-- A1: Each rental and the average of its amount and the amounts of
-- the two preceding rentals in the same center, in chronological order.
select c.center_id, c.center_name, r.rental_id, r.start_date,
       r.hours * r.applied_hourly_rate as rental_amount,
       round(avg(r.hours * r.applied_hourly_rate) over (
           partition by c.center_id
           order by r.start_date, r.rental_id
           rows between 2 preceding and current row
       ), 2) as avg_last_3_rentals
from rentals r
join vehicles v on v.vehicle_id = r.vehicle_id
join centers c on c.center_id = v.center_id
order by c.center_id, r.start_date, r.rental_id;

-- A2: Each rental and its center's cumulative revenue from the first
-- rental through the current one, in chronological order.
select c.center_id, c.center_name, r.rental_id, r.start_date,
       r.hours * r.applied_hourly_rate as rental_amount,
       sum(r.hours * r.applied_hourly_rate) over (
           partition by c.center_id
           order by r.start_date, r.rental_id
           rows between unbounded preceding and current row
       ) as cumulative_revenue
from rentals r
join vehicles v on v.vehicle_id = r.vehicle_id
join centers c on c.center_id = v.center_id
order by c.center_id, r.start_date, r.rental_id;

-- A3: Each vehicle and the number of vehicles in the same center with
-- hourly rates within RON 5 of its rate, including itself and both limits.
select c.center_id, c.center_name, v.vehicle_id, v.model, v.hourly_rate,
       count(v.vehicle_id) over (
           partition by c.center_id
           order by v.hourly_rate
           range between 5 preceding and 5 following
       ) as vehicles_in_range
from vehicles v
join centers c on c.center_id = v.center_id
order by c.center_id, v.hourly_rate, v.vehicle_id;

-- A4: Each vehicle's hourly rate and the minimum and maximum rates in its center.
-- The calculation includes all vehicles in the center and keeps one row per vehicle.
select c.center_id, c.center_name, v.vehicle_id, v.model, v.hourly_rate,
       min(v.hourly_rate) over (
           partition by c.center_id
           order by v.hourly_rate
           range between unbounded preceding and unbounded following
       ) as min_hourly_rate,
       max(v.hourly_rate) over (
           partition by c.center_id
           order by v.hourly_rate
           range between unbounded preceding and unbounded following
       ) as max_hourly_rate
from vehicles v
join centers c on c.center_id = v.center_id
order by c.center_id, v.hourly_rate, v.vehicle_id;

-- A5: Total revenue for each rented vehicle and its rank within the center.
-- Ranking runs from highest to lowest revenue, with equal revenue sharing a rank.
select c.center_id, c.center_name, v.vehicle_id, v.model,
       sum(r.hours * r.applied_hourly_rate) as revenue,
       rank() over (
           partition by c.center_id
           order by sum(r.hours * r.applied_hourly_rate) desc
       ) as revenue_rank
from centers c
join vehicles v on v.center_id = c.center_id
join rentals r on r.vehicle_id = v.vehicle_id
group by c.center_id, c.center_name, v.vehicle_id, v.model
order by c.center_id, revenue_rank, v.vehicle_id;

-- A6: Each rental's amount and the amount of the preceding rental of the same vehicle.
-- Rentals are ordered chronologically; the first rental of each vehicle has no previous amount (null).
select v.vehicle_id, v.model, r.rental_id, r.start_date,
       r.hours * r.applied_hourly_rate as rental_amount,
       lag(r.hours * r.applied_hourly_rate) over (
           partition by r.vehicle_id
           order by r.start_date, r.rental_id
       ) as previous_rental_amount
from rentals r
join vehicles v on v.vehicle_id = r.vehicle_id
order by v.vehicle_id, r.start_date, r.rental_id;
