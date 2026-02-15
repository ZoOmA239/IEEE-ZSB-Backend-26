# Researh Questions

## 1. What is the difference between a DBMS and an RDBMS?

**DBMS:** (Database Management System)
is software used to store, manage, and retrieve data. It does not enforce relationships between tables and stores data in files or simple tables.

**RDBMS:** (Relational Database Management System)
is an advanced type of DBMS that stores data in related tables and uses relationships between them through Primary Keys and Foreign Keys. It ensures data integrity and reduces redundancy.

### Key Differences between DBMS and RDBMS

| Feature                      | DBMS                       | RDBMS                                 |
| ---------------------------- | -------------------------- | ------------------------------------- |
| Full form                    | Database Management System | Relational Database Management System |
| Relationships between tables | Not supported              | Supported                             |
| Primary Key                  | Optional                   | Required                              |
| Foreign Key                  | Not supported              | Supported                             |
| Data integrity               | Low                        | High                                  |
| Normalization                | Limited                    | Fully supported                       |
| Security                     | Lower                      | Higher                                |

## 2. Based on Chapter 04 and 05, what is the difference between DDL (Data Definition Language) and DML (Data Manipulation Language)? Give one example command for each.

### DDL (Data Definition Language)

**DDL:** is used to define and modify the structure of the database.  
It is used to create, alter, and delete database objects such as tables.

**Example command:**

```sql
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

### DML (Data Manipulation Language)

**DML:** is used to manipulate the data inside the database.
It is used to insert, update, delete, and retrieve data from tables.

**Example command:**

```sql
INSERT INTO Students (id, name)
VALUES (1, 'Ahmed');
```

## 3. In your own words, why is Normalization important for a large system like a university database?

**Normalization** is important for a large system like a university database because it helps organize the data properly and avoid duplication. When data is repeated in many places, it becomes harder to update and can cause errors or inconsistencies. For example, if an instructor’s department is stored in many rows, changing it would require updating every row, which is inefficient and risky.

Normalization also improves data integrity by ensuring that each piece of information is stored in only one place. This makes the database more accurate and reliable. In addition, it makes the system easier to maintain, faster to update, and more efficient to use.

Overall, normalization helps keep the university database clean, consistent, and easy to manage, especially when dealing with large amounts of student, course, and instructor data.
