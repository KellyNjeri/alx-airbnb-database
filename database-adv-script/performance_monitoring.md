# Optimization Report

## Overview
The initial query retrieved all bookings along with user, property, and payment details. Performance analysis was done using the `EXPLAIN` statement.

## Observations
- The initial query scanned all tables (`bookings`, `users`, `properties`, `payments`).
- No indexes were present on foreign key columns (`user_id`, `property_id`, `booking_id`), leading to a full table scan.
- Unnecessary columns were retrieved, increasing I/O.

## Performance Analysis
The `EXPLAIN` output revealed:
- Full table scan on `payments` table.
- JOIN operations without indexes increased query execution time.

## Optimization Steps
1. **Indexing**
   - Added indexes:
     ```sql
     CREATE INDEX idx_bookings_user_id ON bookings(user_id);
     CREATE INDEX idx_bookings_property_id ON bookings(property_id);
     CREATE INDEX idx_payments_booking_id ON payments(booking_id);
     ```

2. **Query Refactoring**
   - Removed unnecessary columns (`payment_method` not needed for this report).
   - Used `CONCAT()` to combine user names instead of selecting separately.

3. **Result**
   - Reduced execution time by enabling indexed lookups.
   - Reduced data fetched per row.

