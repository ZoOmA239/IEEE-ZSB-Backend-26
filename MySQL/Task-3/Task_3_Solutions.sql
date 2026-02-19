-- Invalid Tweets
select tweet_id from Tweets where length(content) > 15;

-- Fix Names in a Table
SELECT user_id, CONCAT(
        UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;

-- Calculate Special Bonus
SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 = 1
        AND name NOT LIKE 'M%' THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;

-- Patients With a Condition
select
    patient_id,
    patient_name,
    conditions
from Patients
where
    conditions like "%DIAB1%";

-- Find Total Time Spent by Each Employee
select Distinct
    event_day as day,
    emp_id,
    sum(out_time - in_time) as total_time
from Employees
GROUP BY
    emp_id,
    event_day;

-- Find Followers Count
select distinct
    user_id,
    count(follower_id) as followers_count
from Followers
group by
    user_id;

-- Daily Leads and Partners
select
    date_id,
    make_name,
    count(distinct lead_id) as unique_leads,
    count(distinct partner_id) as unique_partners
from DailySales
group by
    date_id,
    make_name;

-- Actors and Directors Who Cooperated At Least Three Times
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY
    actor_id,
    director_id
HAVING
    COUNT(*) >= 3;

-- Classes With at Least 5 Students
SELECT class FROM Courses GROUP BY class HAVING COUNT(student) >= 5;

-- Game Play Analysis I
select distinct
    player_id,
    min(event_date) as first_login
from Activity
group by
    player_id;

-- Capital Gain/Loss
SELECT stock_name, SUM(
        CASE
            WHEN operation = 'Sell' THEN price
            WHEN operation = 'Buy' THEN - price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY
    stock_name;

-- Second Highest Salary
SELECT (
        SELECT DISTINCT
            salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1
        OFFSET
            1
    ) AS SecondHighestSalary;