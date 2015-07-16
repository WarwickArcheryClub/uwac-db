-- Create database for archery

-- CREATE DATABASE "archery" WITH
--    TEMPLATE "template0"
--    ENCODING 'UTF8'
--    LC_COLLATE 'en_US.UTF-8'
--    LC_CTYPE 'en_US.UTF-8';

-- Create enums

-- Create tables

CREATE TABLE "events" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
