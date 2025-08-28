-- Task 3 — Seed realistic sample data
-- Note: IDs are fixed UUID-like strings for reproducibility.

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111','Alice','Wanja','alice@example.com','$2y$hash','+254700000001','host'),
('22222222-2222-2222-2222-222222222222','Brian','Otieno','brian@example.com','$2y$hash','+254700000002','guest'),
('33333333-3333-3333-3333-333333333333','Caro','Mwangi','caro@example.com','$2y$hash','+254700000003','guest');

-- PROPERTIES (Alice is host)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1','11111111-1111-1111-1111-111111111111','Isiolo Getaway','Cozy 2-bed near CBD','Isiolo, Kenya',6500.00,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2','11111111-1111-1111-1111-111111111111','Nanyuki Cottage','Wood cabin with Mt. Kenya views','Nanyuki, Kenya',9200.00,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3','11111111-1111-1111-1111-111111111111','Meru Studio','Studio apartment near park','Meru, Kenya',4800.00,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1','aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1','22222222-2222-2222-2222-222222222222','2025-09-10','2025-09-12',13000.00,'confirmed',CURRENT_TIMESTAMP),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2','aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2','33333333-3333-3333-3333-333333333333','2025-09-20','2025-09-23',27600.00,'pending',CURRENT_TIMESTAMP),
('bbbbbbb3-bbbb-bbbb-bbbb-bbbbbbbbbbb3','aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3','22222222-2222-2222-2222-222222222222','2025-10-01','2025-10-03',9600.00,'canceled',CURRENT_TIMESTAMP);

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
('ppppppp1-pppp-pppp-pppp-ppppppppppp1','bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1',13000.00,CURRENT_TIMESTAMP,'credit_card'),
('ppppppp2-pppp-pppp-pppp-ppppppppppp2','bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2',9200.00,CURRENT_TIMESTAMP,'paypal');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrr1','aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1','22222222-2222-2222-2222-222222222222',5,'Great location and super clean!',CURRENT_TIMESTAMP),
('rrrrrrr2-rrrr-rrrr-rrrr-rrrrrrrrrrr2','aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaa3','22222222-2222-2222-2222-222222222222',4,'Nice studio, quiet area.',CURRENT_TIMESTAMP);

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
('mmmmmmm1-mmmm-mmmm-mmmm-mmmmmmmmmmm1','22222222-2222-2222-2222-222222222222','11111111-1111-1111-1111-111111111111','Hi, is early check-in possible?',CURRENT_TIMESTAMP),
('mmmmmmm2-mmmm-mmmm-mmmm-mmmmmmmmmmm2','11111111-1111-1111-1111-111111111111','22222222-2222-2222-2222-222222222222','Yes, from 11am works.',CURRENT_TIMESTAMP);
