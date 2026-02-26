# Research Questions – Database Concepts

## 1. Window Functions vs GROUP BY

Both Window Functions and GROUP BY perform aggregations, but the fundamental difference is the granularity of the output.

GROUP BY reduces the number of rows. It groups multiple rows into a single row per group. This means you lose the individual row detail. For example, if you use GROUP BY departmentId, you will get one row per department, not one row per employee.

Window Functions, on the other hand, do not reduce the number of rows. They perform calculations across related rows while still keeping each individual row visible. This means you can show both the individual row data and the aggregated result at the same time.

Example:

GROUP BY result:
One row per department.

Window Function result:
One row per employee, with additional information like the average salary of their department.

In summary:
GROUP BY changes the granularity to the group level.
Window Functions keep the granularity at the row level.

---

## 2. Clustered vs Non-Clustered Indexes

### Difference in Leaf Nodes

In a Clustered Index, the leaf nodes of the B-tree contain the actual table data. This means the data rows themselves are physically stored in sorted order according to the clustered index key.

In a Non-Clustered Index, the leaf nodes do not contain the actual data. Instead, they contain the indexed key and a pointer (reference) to the actual data row in the table.

So:

Clustered Index leaf nodes = actual data rows
Non-Clustered Index leaf nodes = index key + pointer to data

---

### Why only one Clustered Index per table?

You can only have one clustered index because the table data can only be physically sorted in one way.

Since the clustered index determines the physical order of rows on disk, it is impossible to organize the same data physically in multiple different orders at the same time.

For example, the table cannot be physically sorted by both Email and Salary simultaneously.

---

## 3. Filtered & Unique Indexes

### What is a Filtered Index and why is it useful?

A Filtered Index is an index that includes only a subset of rows based on a condition.

Example:
Index only rows where status = 'active'

Benefits:

Storage savings:
The index stores fewer rows, so it uses less disk space.

Better performance:
Queries that match the filter condition run faster because the index is smaller and easier to search.

Improved efficiency:
The database engine scans fewer rows.

---

### Why does a Unique Index slow down INSERT but speed up SELECT?

Unique Index speeds up SELECT because the database can quickly locate rows using the index instead of scanning the entire table.

However, it slows down INSERT because the database must first check the index to ensure that the new value does not already exist. This requires an additional lookup operation before inserting the new row.

So:

INSERT becomes slower due to uniqueness validation.
SELECT becomes faster due to efficient indexed lookup.

---

## 4. Choosing the Right Index

For a staging table where millions of rows are inserted quickly, read once, and then deleted, the best structure is a Heap Structure.

A heap is a table without a clustered index.

Reason:

Faster INSERT:
No need to maintain index structure during inserts.

Less overhead:
Indexes require additional maintenance.

Better performance for temporary data:
Since the data is not queried multiple times, indexing provides little benefit.

Indexes are useful when data is frequently searched, but staging tables are mainly used for fast insert and temporary storage.

---

## 5. Database Transactions (ACID) – Atomicity

Atomicity means "All or Nothing."

A transaction must either complete fully or not execute at all.

If a failure happens in the middle of a transaction, the database will roll back all changes to maintain consistency.

Disastrous scenario without Atomicity:

Example:
Transferring money from Account A to Account B.

Step 1: Deduct $100 from Account A
Step 2: Add $100 to Account B

If the system crashes after Step 1 but before Step 2, the money disappears.

Account A loses money, but Account B does not receive it.

This leads to data corruption and financial loss.

Atomicity prevents this by ensuring that either both steps succeed or both are canceled.
