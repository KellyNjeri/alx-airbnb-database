# Task 0 — ER Diagram Requirements

## Entities & Attributes
**User**
- user_id (PK, UUID/CHAR(36), indexed)
- first_name (VARCHAR, NOT NULL)
- last_name (VARCHAR, NOT NULL)
- email (VARCHAR, UNIQUE, NOT NULL)
- password_hash (VARCHAR, NOT NULL)
- phone_number (VARCHAR, NULL)
- role (guest | host | admin, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Property**
- property_id (PK, UUID/CHAR(36), indexed)
- host_id (FK → User.user_id)
- name (VARCHAR, NOT NULL)
- description (TEXT, NOT NULL)
- location (VARCHAR, NOT NULL)
- pricepernight (DECIMAL, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

**Booking**
- booking_id (PK, UUID/CHAR(36), indexed)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date (DATE, NOT NULL)
- end_date (DATE, NOT NULL)
- total_price (DECIMAL, NOT NULL)
- status (pending | confirmed | canceled, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Payment**
- payment_id (PK, UUID/CHAR(36), indexed)
- booking_id (FK → Booking.booking_id)
- amount (DECIMAL, NOT NULL)
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- payment_method (credit_card | paypal | stripe, NOT NULL)

**Review**
- review_id (PK, UUID/CHAR(36), indexed)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (INTEGER, 1..5, NOT NULL)
- comment (TEXT, NOT NULL)
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

**Message**
- message_id (PK, UUID/CHAR(36), indexed)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body (TEXT, NOT NULL)
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

## Relationships (crow’s foot)
- User (host) 1 ──< Property
- User (guest) 1 ──< Booking
- Property 1 ──< Booking
- Booking 1 ──< Payment
- User 1 ──< Review; Property 1 ──< Review
- User 1 ──< Message (as sender)
- User 1 ──< Message (as recipient)

## Deliverables
- AirBnB_ERD.drawio (source)
- AirBnB_ERD.png (image)
