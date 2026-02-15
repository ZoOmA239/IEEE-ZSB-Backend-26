# Database Normalization to 3NF -- Student Grade Report

We have one messy table called:

**Student_Grade_Report**

Columns: - Student_Name\

- Student_Phone\
- Student_Address (City, Street, Zip)\
- Course_Title\
- Instructor_Name\
- Instructor_Dept\
- Dept_Building\
- Grade

Problems:

- Multi-valued attribute (Student_Phone)
- Partial dependency
  (Student_Address depends only on Student)
- Transitive dependency
  (Dept_Building depends on Instructor_Dept)

Goal: Convert the table into Third Normal Form (3NF).

---

# Step 1: First Normal Form (1NF)

## Definition

1NF means:

- Each cell contains only one value
- No multi-valued attributes

## Problem

Student_Phone contains multiple phone numbers like:

Ahmed \| 0101111111, 0122222222

This violates 1NF.

## Solution

Create separate tables:

### Students

Student_ID (PK)\
Student_Name\
City\
Street\
Zip\
Course_Title\
Instructor_Name\
Instructor_Dept\
Dept_Building\
Grade

### Student_Phones

Student_ID (FK,PK)\
Phone_Number(PK)\

Now each phone number is stored in its own row.

---

# Step 2: Second Normal Form (2NF)

## Definition

2NF means:

- Table must be in 1NF
- No partial dependency

## Problem

Student_Address depends only on Student, not on Course.

This causes repetition.

## Solution

Split tables based on entities.

### Students

Student_ID (PK)\
Student_Name\
City\
Street\
Zip

### Courses

Course_ID (PK)\
Course_Title\
Instructor_ID (FK)

### Student_Courses

Student_ID (FK)\
Course_ID (FK)\
Grade

Primary Key = (Student_ID, Course_ID)

Grade depends on both → Correct.

---

# Step 3: Third Normal Form (3NF)

## Definition

3NF means:

- Table must be in 2NF
- No transitive dependency

## Problem

Dept_Building depends on Instructor_Dept

Instructor_Dept → Dept_Building

This is transitive dependency.

## Solution

Create separate Departments table.

### Departments

Dept_ID (PK)\
Dept_Building

### Instructors

Instructor_ID (PK)\
Instructor_Name\
Dept_ID (FK)

### Courses

Course_ID (PK)\
Course_Title\
Instructor_ID (FK)

---

# Final Tables in 3NF

## Students

Student_ID (PK)\
Student_Name\
City\
Street\
Zip

## Student_Phones

Student_ID (FK)\
Phone_Number(PK)\

## Departments

Dept_ID (PK)\
Dept_Building

## Instructors

Instructor_ID (PK)\
Instructor_Name\
Dept_ID (FK)

## Courses

Course_ID (PK)\
Course_Title\
Instructor_ID (FK)

## Student_Courses

Student_ID (FK)\
Course_ID (FK)\
Grade\
Primary Key = (Student_ID, Course_ID)

---
