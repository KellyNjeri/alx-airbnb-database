-- joins_queries.sql

-- 1. INNER JOIN: Retrieve all bookings with user details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
ORDER BY b.start_date;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.name;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if no match exists
-- Using UNION of LEFT JOIN and RIGHT JOIN to simulate FULL OUTER JOIN in MySQL
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id
ORDER BY user_id;