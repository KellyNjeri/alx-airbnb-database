# Index Performance Report

## Objective
Identify and create indexes to improve query performance on high-usage columns in the `users`, `bookings`, and `properties` tables.

---

## 1. High-Usage Columns Identified
Based on query patterns and joins, the following columns were frequently used in **`WHERE`**, **`JOIN`**, and **`ORDER BY`** clauses:

- `users.email` (for lookups and authentication)
- `bookings.user_id` (join with users)
- `bookings.property_id` (join with properties)
- `bookings.start_date` (date range filtering)
- `properties.host_id` (filtering properties by host)

---

## 2. Indexes Created
We created indexes to optimize the most common query patterns:

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_host_id ON properties(host_id);
