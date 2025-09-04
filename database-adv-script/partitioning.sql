-- Step 1: Create a partitioned version of the bookings table

CREATE TABLE bookings_partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 2: Insert existing data into the new partitioned table
INSERT INTO bookings_partitioned
SELECT booking_id, user_id, property_id, start_date, end_date, status
FROM bookings;

-- Step 3: Test query performance (fetch bookings within a date range)
EXPLAIN
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Step 4: Compare with original table (unpartitioned)
EXPLAIN
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';