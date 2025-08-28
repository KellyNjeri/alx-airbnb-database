# Normalization of Airbnb Database to 3NF

## Step 1: First Normal Form (1NF)
- Ensured all tables have primary keys (UUID as CHAR(36)).
- All attributes hold atomic values (e.g., `phone_number` is a single value, `pricepernight` is a single decimal).
- No repeating groups or arrays.

## Step 2: Second Normal Form (2NF)
- All non-key attributes fully depend on the primary key of their respective tables.
- Example: In the `bookings` table, `start_date`, `end_date`, and `status` depend only on `booking_id`.

## Step 3: Third Normal Form (3NF)
- Removed any transitive dependencies:
  - User details are stored only in the `users` table.
  - Property details remain in the `properties` table.
  - Payment details link to bookings but do not duplicate user or property info.
- Derived attributes (e.g., `total_price`) remain as business requirements.

## Conclusion
The database design already complies with 3NF. No further decomposition was required.
