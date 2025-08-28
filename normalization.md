# Task 1 — Normalization to 3NF

## 1NF
- All attributes are atomic (e.g., first_name and last_name separate).
- No repeating groups.

## 2NF
- Each table has a single-column primary key (no partial dependency issues).

## 3NF
- Non-key attributes depend only on the key:
  - `total_price` is stored for performance but derivable (nights × pricepernight); acceptable as a denormalized field with business logic to keep consistent.
  - Enum-like attributes (`role`, `status`, `payment_method`) enforced by CHECK constraints.

## Notes
- Foreign keys ensure referential integrity.
- Indexes added on frequent joins and lookups.
