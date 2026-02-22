-- Combine Two Tables
select firstName, lastName, city, state
from Person P
    left join Address A on p.personId = A.personId;

-- Replace Employee ID With The Unique Identifier
select unique_id, name
from Employees E
    left join EmployeeUNI U on E.id = U.id;

-- Customer Who Visited but Did Not Make Any Transactions
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE
    t.visit_id IS NULL
GROUP BY
    v.customer_id;

-- Project Employees I
select P.project_id, ROUND(AVG(E.experience_years), 2) as average_years
from Project P
    left join Employee E on P.employee_id = E.employee_id
group by
    project_id;

-- Sales Person
SELECT name
FROM SalesPerson
WHERE
    sales_id NOT IN(
        SELECT o.sales_id
        FROM Orders o
            JOIN Company c ON o.com_id = c.com_id
        WHERE
            c.name = 'RED'
    );

-- Rising Temperature
SELECT w1.id
FROM Weather w1
    JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
    w1.temperature > w2.temperature;

-- Average Time of Process per Machine
SELECT a.machine_id, ROUND(
        AVG(b.timestamp - a.timestamp), 3
    ) AS processing_time
FROM Activity a
    JOIN Activity b ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
WHERE
    a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY
    a.machine_id;

-- Students and Examinations
select s.student_id, s.student_name, sub.subject_name, count(E.student_id) as attended_exams
from
    Students s
    CROSS JOIN Subjects sub
    left join Examinations E on E.student_id = s.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY s.student_id, sub.subject_name;

-- Managers with at Least 5 Direct Reports
SELECT name
FROM Employee
WHERE
    id IN (
        SELECT managerId
        FROM Employee
        GROUP BY
            managerId
        HAVING
            COUNT(*) >= 5
    );

-- Confirmation Rate
SELECT s.user_id, ROUND(
        IFNULL(
            SUM(c.action = 'confirmed') / COUNT(c.action), 0
        ), 2
    ) AS confirmation_rate
FROM Signups s
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY
    s.user_id;

-- Product Sales Analysis III
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
        SELECT product_id, MIN(year)
        FROM Sales
        GROUP BY
            product_id
    );

-- Market Analysis I
SELECT u.user_id AS buyer_id, u.join_date, COUNT(o.order_id) AS orders_in_2019
FROM Users u
    LEFT JOIN Orders o ON u.user_id = o.buyer_id
    AND YEAR(o.order_date) = 2019
GROUP BY
    u.user_id,
    u.join_date;