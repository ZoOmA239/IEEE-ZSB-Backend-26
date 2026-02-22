# Research Questions

## 1. UNION vs UNION ALL

Both **UNION** and **UNION ALL** are used to combine the results of two or more SELECT queries into one result set. However, they differ in how they handle duplicates and their performance.

### Duplicate Handling

**UNION**

- Removes duplicate rows from the final result.
- This means each row appears only once, even if it exists in multiple queries.
- Internally, the database must check for duplicates, which requires extra processing.

Example:

```sql
SELECT name FROM Students
UNION
SELECT name FROM Teachers;
```

If the same name exists in both tables, it will appear only once.

**UNION ALL**

- Keeps all rows, including duplicates.
- It does not perform any duplicate checking.

Example:

```sql
SELECT name FROM Students
UNION ALL
SELECT name FROM Teachers;
```

If the same name exists in both tables, it will appear multiple times.

---

### Performance Difference

**UNION**

- Slower than UNION ALL.
- Because the database must sort and compare rows to remove duplicates.
- Requires more CPU and memory.

**UNION ALL**

- Faster than UNION.
- Because it simply combines the results without checking for duplicates.
- Uses fewer system resources.

---

### Summary Table

| Feature            | UNION                           | UNION ALL                                    |
| ------------------ | ------------------------------- | -------------------------------------------- |
| Removes duplicates | Yes                             | No                                           |
| Performance        | Slower                          | Faster                                       |
| Resource usage     | Higher                          | Lower                                        |
| Use case           | When duplicates must be removed | When duplicates are allowed or not important |

---

## 2. Subquery vs JOIN

A **Subquery** is a query inside another query, while a **JOIN** combines rows from two or more tables based on a related column.

Example of Subquery:

```sql
SELECT name
FROM Employee
WHERE department_id IN (
    SELECT id
    FROM Department
);
```

Example of JOIN:

```sql
SELECT e.name
FROM Employee e
JOIN Department d
ON e.department_id = d.id;
```

---

### Why JOIN is Preferred in Production

#### 1. Better Performance

- JOIN is usually faster than Subqueries.
- The database optimizer can execute JOIN more efficiently.
- Subqueries may execute multiple times, especially correlated subqueries.

#### 2. More Efficient Execution Plan

- JOIN allows the database to use indexes more effectively.
- Reduces repeated scanning of tables.

#### 3. Better Readability for Complex Queries

- JOIN makes relationships between tables clearer.
- Easier to maintain and debug in large systems.

#### 4. More Flexibility

- JOIN allows combining multiple tables easily.
- Supports INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.

---

### When Subqueries May Be Useful

- When the query logic is simpler with a subquery.
- When calculating intermediate values.
- When filtering based on aggregated results.

Example:

```sql
SELECT name
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);
```

---

### Summary Table

| Feature                       | JOIN   | Subquery  |
| ----------------------------- | ------ | --------- |
| Performance                   | Faster | Slower    |
| Readability (complex queries) | Better | Worse     |
| Optimization                  | Better | Limited   |
| Flexibility                   | High   | Medium    |
| Recommended for production    | Yes    | Sometimes |

---
