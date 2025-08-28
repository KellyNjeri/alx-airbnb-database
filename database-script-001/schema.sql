-- Task 2 — Schema (DDL)
-- Engine-agnostic: use CHAR(36) for UUID; use CHECKs for enum-like fields.

-- USERS
CREATE TABLE IF NOT EXISTS users (
  user_id        CHAR(36) PRIMARY KEY,
  first_name     VARCHAR(100) NOT NULL,
  last_name      VARCHAR(100) NOT NULL,
  email          VARCHAR(255) NOT NULL UNIQUE,
  password_hash  VARCHAR(255) NOT NULL,
  phone_number   VARCHAR(30),
  role           VARCHAR(20) NOT NULL,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_users_role CHECK (role IN ('guest','host','admin'))
);

-- PROPERTIES
CREATE TABLE IF NOT EXISTS properties (
  property_id    CHAR(36) PRIMARY KEY,
  host_id        CHAR(36) NOT NULL,
  name           VARCHAR(200) NOT NULL,
  description    TEXT NOT NULL,
  location       VARCHAR(255) NOT NULL,
  pricepernight  DECIMAL(10,2) NOT NULL,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at     TIMESTAMP NULL,
  CONSTRAINT fk_properties_host
    FOREIGN KEY (host_id) REFERENCES users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- BOOKINGS
CREATE TABLE IF NOT EXISTS bookings (
  booking_id     CHAR(36) PRIMARY KEY,
  property_id    CHAR(36) NOT NULL,
  user_id        CHAR(36) NOT NULL,
  start_date     DATE NOT NULL,
  end_date       DATE NOT NULL,
  total_price    DECIMAL(10,2) NOT NULL,
  status         VARCHAR(20) NOT NULL,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_bookings_property
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_bookings_user
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT chk_bookings_status CHECK (status IN ('pending','confirmed','canceled')),
  CONSTRAINT chk_bookings_dates CHECK (start_date <= end_date)
);

-- PAYMENTS
CREATE TABLE IF NOT EXISTS payments (
  payment_id     CHAR(36) PRIMARY KEY,
  booking_id     CHAR(36) NOT NULL,
  amount         DECIMAL(10,2) NOT NULL,
  payment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(30) NOT NULL,
  CONSTRAINT fk_payments_booking
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT chk_payment_method CHECK (payment_method IN ('credit_card','paypal','stripe'))
);

-- REVIEWS
CREATE TABLE IF NOT EXISTS reviews (
  review_id      CHAR(36) PRIMARY KEY,
  property_id    CHAR(36) NOT NULL,
  user_id        CHAR(36) NOT NULL,
  rating         INTEGER NOT NULL,
  comment        TEXT NOT NULL,
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_reviews_property
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_reviews_user
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT chk_reviews_rating CHECK (rating BETWEEN 1 AND 5)
  -- Optional: one review per user per property
  -- , CONSTRAINT uq_review UNIQUE (property_id, user_id)
);

-- MESSAGES
CREATE TABLE IF NOT EXISTS messages (
  message_id     CHAR(36) PRIMARY KEY,
  sender_id      CHAR(36) NOT NULL,
  recipient_id   CHAR(36) NOT NULL,
  message_body   TEXT NOT NULL,
  sent_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_messages_sender
    FOREIGN KEY (sender_id) REFERENCES users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_messages_recipient
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Indexes (FKs are often indexed automatically; we add explicit ones for clarity/perf)
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties(host_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);
CREATE INDEX IF NOT EXISTS idx_reviews_user_id ON reviews(user_id);
CREATE INDEX IF NOT EXISTS idx_messages_sender_id ON messages(sender_id);
CREATE INDEX IF NOT EXISTS idx_messages_recipient_id ON messages(recipient_id);
