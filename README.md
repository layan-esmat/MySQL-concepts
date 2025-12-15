# SQL Database Project – LIN

## Overview
This project demonstrates the design and manipulation of a relational database using **MySQL**. It covers core database concepts including table creation, constraints, data insertion, querying, joins, aggregation, views, and schema modification.

The database is created under the name **LIN** and includes multiple related tables to simulate an employee management and purchasing system.

---

## Database Structure

### Employee Management
- `employee` : Stores employee personal and job-related data.
- `department` : Stores department information.
- `emps` : Employees linked to departments using foreign keys.
- `scidata` : Scientific/academic data linked to employees.

### Customer & Purchase System
- `customers` : Stores customer information.
- `clothes` : Stores clothing items.
- `purchase` : Records purchases, linking customers and clothes.

---

## Key SQL Concepts Implemented

### Data Definition Language (DDL)
- `CREATE DATABASE`, `CREATE TABLE`
- `ALTER TABLE` (add columns, primary keys, foreign keys)
- `DROP TABLE`, `DROP VIEW`

### Data Manipulation Language (DML)
- `INSERT`, `UPDATE`
- Arithmetic operations in `SELECT`
- Conditional filtering using `WHERE`

### Queries & Functions
- `ORDER BY` (ASC, DESC)
- `DISTINCT`
- `BETWEEN`
- Aggregate functions (`SUM`)
- `GROUP BY`

---

## Joins
The project demonstrates multiple join types:
- **Equi Join**
- **INNER JOIN**
- **NATURAL JOIN**
- **LEFT OUTER JOIN**
- **RIGHT OUTER JOIN**
- **Multiple-table joins**

These queries illustrate relationships between employees, departments, and scientific data.

---

## Views
The following views are created and used:
- `v2` : Simple, updatable view based on a single table.
- `v3` : Multi-table view using joins (read-only).
- `v4` : Filtered view with a condition.

The project also demonstrates inserting into an updatable view and handling foreign key constraints correctly.

---

## Learning Outcomes
- Understanding relational database design
- Applying constraints and relationships
- Writing complex queries with joins
- Using views effectively
- Managing schema changes safely

---

## Technologies
- Database: MySQL
- Language: SQL

---

## Conclusion
This project provides a comprehensive practical example of core SQL and relational database concepts, emphasizing data integrity, query accuracy, and proper database design.
