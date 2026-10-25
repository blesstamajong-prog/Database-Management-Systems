-- Rapido Bike & Cab Booking System
-- Finalized schema (MySQL 8+) used in Assignments 5-9
-- Student: Tamajong Bless Ntumnyoh  |  USN: 2511021240069

DROP DATABASE IF EXISTS rapido_db;
CREATE DATABASE rapido_db;
USE rapido_db;

CREATE TABLE users (
    user_id        INT PRIMARY KEY AUTO_INCREMENT,
    full_name      VARCHAR(100) NOT NULL,
    phone_number   VARCHAR(15)  NOT NULL UNIQUE,
    email          VARCHAR(120) UNIQUE,
    created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vehicles (
    vehicle_id            INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_type          VARCHAR(20) NOT NULL,
    registration_number   VARCHAR(20) NOT NULL UNIQUE,
    model                 VARCHAR(60) NOT NULL,
    capacity              INT         NOT NULL DEFAULT 1,
    CONSTRAINT chk_vehicle_type CHECK (vehicle_type IN ('Bike', 'Auto', 'Cab')),
    CONSTRAINT chk_capacity CHECK (capacity BETWEEN 1 AND 6)
);

CREATE TABLE captains (
    captain_id     INT PRIMARY KEY AUTO_INCREMENT,
    full_name      VARCHAR(100) NOT NULL,
    phone_number   VARCHAR(15)  NOT NULL UNIQUE,
    vehicle_id     INT          NOT NULL,
    rating         DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT fk_captain_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_rating CHECK (rating BETWEEN 0.00 AND 5.00)
);

CREATE TABLE rides (
    ride_id           INT PRIMARY KEY AUTO_INCREMENT,
    user_id           INT           NOT NULL,
    captain_id        INT           NOT NULL,
    pickup_location   VARCHAR(120)  NOT NULL,
    drop_location     VARCHAR(120)  NOT NULL,
    fare              DECIMAL(8,2)  NOT NULL,
    status            VARCHAR(20)   NOT NULL DEFAULT 'Requested',
    requested_at      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ride_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_ride_captain
        FOREIGN KEY (captain_id) REFERENCES captains(captain_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_fare CHECK (fare >= 0),
    CONSTRAINT chk_status CHECK (status IN ('Requested', 'Ongoing', 'Completed', 'Cancelled'))
);

CREATE TABLE payments (
    payment_id       INT PRIMARY KEY AUTO_INCREMENT,
    ride_id          INT           NOT NULL UNIQUE,
    amount           DECIMAL(8,2)  NOT NULL,
    payment_method   VARCHAR(20)   NOT NULL,
    payment_status   VARCHAR(20)   NOT NULL DEFAULT 'Pending',
    payment_time     DATETIME      NULL,
    CONSTRAINT fk_payment_ride
        FOREIGN KEY (ride_id) REFERENCES rides(ride_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_amount CHECK (amount >= 0),
    CONSTRAINT chk_pay_method CHECK (payment_method IN ('UPI', 'Card', 'Cash', 'Wallet')),
    CONSTRAINT chk_pay_status CHECK (payment_status IN ('Pending', 'Success', 'Failed', 'Refunded'))
);

CREATE TABLE zones (
    zone_id     INT PRIMARY KEY AUTO_INCREMENT,
    zone_name   VARCHAR(80)  NOT NULL,
    city        VARCHAR(80)  NOT NULL,
    CONSTRAINT uq_zone_city UNIQUE (zone_name, city)
);

CREATE TABLE captain_zones (
    captain_id   INT NOT NULL,
    zone_id      INT NOT NULL,
    PRIMARY KEY (captain_id, zone_id),
    CONSTRAINT fk_cz_captain
        FOREIGN KEY (captain_id) REFERENCES captains(captain_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_cz_zone
        FOREIGN KEY (zone_id) REFERENCES zones(zone_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
