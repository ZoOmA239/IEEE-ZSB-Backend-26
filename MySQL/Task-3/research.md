# Research Questions

# 1. WHERE vs HAVING: Both are used to filter data, but they are used in different places in a query. Explain the difference between them and when to use which. (Give a code example).

## **1️⃣ WHERE vs HAVING**

| Clause     | When to Use                          | Example                                                                                                    |
| ---------- | ------------------------------------ | ---------------------------------------------------------------------------------------------------------- |
| **WHERE**  | Filters **rows before aggregation**  | `sql SELECT Product, SUM(Quantity) AS TotalQuantity FROM Sales WHERE Price > 2 GROUP BY Product;`          |
| **HAVING** | Filters **groups after aggregation** | `sql SELECT Product, SUM(Quantity) AS TotalQuantity FROM Sales GROUP BY Product HAVING SUM(Quantity) > 5;` |

**Tip:** `WHERE` → row-level filter, `HAVING` → aggregate-level filter.

---

# 2. DELETE vs TRUNCATE vs DROP: We learned about deleting data. What is the difference between these three commands? Which one can be rolled back (undone)?

## **2️⃣ DELETE vs TRUNCATE vs DROP**

| Command      | Action               | Can Rollback?           | Notes                                       |
| ------------ | -------------------- | ----------------------- | ------------------------------------------- |
| **DELETE**   | Remove specific rows | ✅ Yes (if transaction) | Can use `WHERE`; slower for large tables    |
| **TRUNCATE** | Remove all rows      | ❌ Usually no           | Faster; resets identity; cannot use `WHERE` |
| **DROP**     | Remove table + data  | ❌ No                   | Table no longer exists                      |

**Example:**

```sql
DELETE FROM Sales WHERE Product='Pen';
TRUNCATE TABLE Sales;
DROP TABLE Sales;
```

---

# 3. Order of Execution: When you write a query like SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY,the database does not read it in that order. What is the actual "Logical Order of Execution" that the SQL engine performs?

## **3️⃣ Logical Order of Execution in SQL**

Even if you write:

```sql
SELECT Column1, SUM(Column2)
FROM Table1
WHERE Column3 > 10
GROUP BY Column1
HAVING SUM(Column2) > 100
ORDER BY SUM(Column2) DESC;
```

The SQL engine executes **logically** in this order:

1. **FROM** → tables, joins
2. **WHERE** → row filtering
3. **GROUP BY** → grouping rows
4. **HAVING** → filter groups
5. **SELECT** → choose columns / compute aggregates
6. **ORDER BY** → sort final result

---

# 4. COUNT(\*) vs COUNT(Column_Name): In aggregation, these two look similar but behave differently regarding NULL values. What is the exact difference?

## **4️⃣ COUNT(\*) vs COUNT(Column_Name)**

| Function               | Counts          | NULL Behavior                     |
| ---------------------- | --------------- | --------------------------------- |
| **COUNT(\*)**          | All rows        | Counts every row, including NULLs |
| **COUNT(Column_Name)** | Non-NULL values | Skips NULLs                       |

**Example:**

```sql
SELECT COUNT(*) AS TotalRows, COUNT(Score) AS ScoresCount
FROM Students;
```

| TotalRows | ScoresCount |
| --------- | ----------- |
| 3         | 2           |

---

# 5. CHAR vs VARCHAR: Both store text, but they manage storage space differently. Explain the difference between CHAR(10) and VARCHAR(10) if we store the word "Cat" in both.

## **5️⃣ CHAR vs VARCHAR**

| Type            | Storage                                         | Example storing `'Cat'` |
| --------------- | ----------------------------------------------- | ----------------------- |
| **CHAR(10)**    | Fixed-length, always 10 bytes, pads with spaces | `'Cat       '`          |
| **VARCHAR(10)** | Variable-length, uses only needed bytes         | `'Cat'`                 |

**Tip:**

- `CHAR` → use for **fixed-length** values (IDs, codes).
- `VARCHAR` → use for **variable-length** values (names, addresses).

---
