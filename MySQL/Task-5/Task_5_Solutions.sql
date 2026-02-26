-- Duplicate Emails
SELECT email AS Email
FROM Person
GROUP BY
    email
HAVING
    COUNT(email) > 1;

-- Delete Duplicate Emails
DELETE p1
FROM Person p1
    JOIN Person p2 ON p1.email = p2.email
    AND p1.id > p2.id;

-- Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
 SELECT salary
      FROM (
          SELECT DISTINCT salary,
                 RANK() OVER (ORDER BY salary DESC) AS rnk
          FROM Employee
      ) AS ranked
      WHERE rnk = N
      LIMIT 1
  );
END

-- Rank Scores
SELECT score, DENSE_RANK() OVER (
        ORDER BY score DESC
    ) AS 'rank'
FROM Scores
ORDER BY score DESC;

-- Department Highest Salary
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
        SELECT *, DENSE_RANK() OVER (
                PARTITION BY
                    departmentId
                ORDER BY salary DESC
            ) AS rnk
        FROM Employee
    ) e
    JOIN Department d ON e.departmentId = d.id
WHERE
    e.rnk = 1;