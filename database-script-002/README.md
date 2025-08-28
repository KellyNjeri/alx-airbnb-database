# Airbnb Database Seed (`seed.sql`)

This SQL script populates the Airbnb database with **sample data** for testing and development purposes. It is meant to be run **after** the `schema.sql` file has been executed.

## Overview of Seed Data
- **users** – Example hosts, guests, and admins with realistic names, emails, and roles.  
- **properties** – Sample property listings including location, description, and nightly price.  
- **bookings** – Example reservations linking users to properties, with start/end dates and status.  
- **payments** – Mock payments associated with bookings using different payment methods.  
- **reviews** – Sample guest reviews for properties with ratings and comments.  
- **messages** – Example messages exchanged between users (guest-host communication).

## Usage
To populate the database with sample data, run:

```bash
mysql -u your_username -p your_database_name < seed.sql
