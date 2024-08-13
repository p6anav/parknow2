CREATE TABLE profile (
    vehicle_number BIGINT PRIMARY KEY,      -- Vehicle number as primary key
    booking_date DATE,                      -- Date of booking
    user_email_id VARCHAR(255),             -- User email ID as a string
    paid_status BOOLEAN,                    -- Paid status as a boolean
    allocated_slot_number VARCHAR(50),      -- Allocated slot number as a string
    booking_source VARCHAR(255),            -- Booking source as a string
    duration_of_allocation INT              -- Duration of allocation as a number
);

CREATE TABLE login (
    email VARCHAR(255) PRIMARY KEY,  -- Vehicle number as the primary key
    password VARCHAR(255) NOT NULL,
    rolename VARCHAR(255) NOT NULL
);

CREATE TABLE ROLES (
       rolename VARCHAR(255) PRIMARY KEY,
       responsibilities VARCHAR(255)

);