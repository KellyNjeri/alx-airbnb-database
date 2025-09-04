# Database Advanced Scripts

This repository contains advanced SQL scripts for practicing **joins, subqueries, aggregations, and window functions** using the Airbnb-like database schema.

---

## **Files**

### 1. `joins_queries.sql`
**Objective:** Master SQL joins by writing complex queries using different types of joins.  
**Includes:**  
- INNER JOIN: Retrieve all bookings and the respective users who made those bookings.  
- LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews.  
- FULL OUTER JOIN: Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user.

---

### 2. `subqueries.sql`
**Objective:** Practice writing both correlated and non-correlated subqueries.  
**Includes:**  
- Non-correlated subquery: Find all properties where the average rating is greater than 4.0.  
- Correlated subquery: Find users who have made more than 3 bookings.

---

### 3. `aggregations_and_window_functions.sql`
**Objective:** Apply SQL aggregation and window functions to analyze data.  
**Includes:**  
- Aggregation: Find the total number of bookings made by each user using `COUNT` and `GROUP BY`.  
- Window Functions: Rank properties based on the total number of bookings they have received using `ROW_NUMBER` or `RANK`.

---

## **How to Run**
1. Clone the repository:  
2. Connect to your SQL database (MySQL/PostgreSQL).
3. Run each SQL file using your preferred SQL client:
-- Example
SOURCE joins_queries.sql;
SOURCE subqueries.sql;
SOURCE aggregations_and_window_functions.sql;

## ** Notes**

Ensure that the database schema is already created (users, bookings, properties, reviews, payments, messages).

These scripts are written to be engine-agnostic, but minor adjustments may be required depending on your SQL engine.