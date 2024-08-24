
CREATE TABLE profile (
    vehicle_number BIGINT PRIMARY KEY,      -- Vehicle number as primary key
    booking_date DATE,
	parking_stat_time DATE,-- Date of booking
    user_email_id VARCHAR(255),             -- User email ID as a string
    paid_status BOOLEAN,                    -- Paid status as a boolean
    allocated_slot_number VARCHAR(50),      -- Allocated slot number as a string
    booking_source VARCHAR(255),            -- Booking source as a string
    duration_of_allocation INT,
     payment_date DATE,                      -- Paid status as a boolean
	role_name VARCHAR(255)
);

CREATE TABLE login (
    email VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    rolename VARCHAR(255) NOT NULL
);

CREATE TABLE roles (
       rolename VARCHAR(255) PRIMARY KEY,
       responsibilities VARCHAR(255)

);
CREATE TABLE actions (
    vehicle_number VARCHAR(255) PRIMARY KEY,
    blacklisted VARCHAR(255),
    action_date VARCHAR(255),
    email_id VARCHAR(255)
);

CREATE TABLE slots (
    slot_number VARCHAR(255)PRIMARY KEY , -- combination of number ,floor,mall,city,district,state,country
    floor VARCHAR(255),
    property_name VARCHAR(255),
    city VARCHAR(255),
    district VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    slot_availability BOOLEAN,
    google_location VARCHAR(255),
    admin_name VARCHAR(255)
);

CREATE TABLE rates (
	   google_location VARCHAR(255) PRIMARY KEY ,
       duration INT,
       charge INT

);
