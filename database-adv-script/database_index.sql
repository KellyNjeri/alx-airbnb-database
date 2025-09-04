-- Step 0: Sample query before adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'sample-user-id';

-- Step 1: Create indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- Step 2: Same query after adding indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'sample-user-id';

-- Optional: Another query to test joins after indexing
EXPLAIN ANALYZE
SELECT b.booking_id, p.name
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31';