# Airbnb Database Schema (`schema.sql`)

This file defines the **database structure** for an Airbnb-style application. It includes all necessary tables, columns, constraints, and relationships to support users, properties, bookings, payments, reviews, and messages.

## Tables Overview
- **users** – Stores guests, hosts, and admin information.  
- **properties** – Stores property listings and details.  
- **bookings** – Tracks reservations made by guests.  
- **payments** – Manages payment transactions for bookings.  
- **reviews** – Stores guest reviews for properties.  
- **messages** – Stores communication between users.

## Relationships
- Users can own properties, make bookings, leave reviews, and send messages.  
- Properties can have multiple bookings and reviews.  
- Bookings are linked to payments and users.  

## Usage
To create the database schema:

```bash
mysql -u your_username -p your_database_name < schema.sql
