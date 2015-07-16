-- Create database for archery

-- CREATE DATABASE "archery" WITH
--    TEMPLATE "template0"
--    ENCODING 'UTF8'
--    LC_COLLATE 'en_GB.UTF-8'
--    LC_CTYPE 'en_GB.UTF-8';

-- Create enums

CREATE TYPE CATEGORY AS ENUM ('Novice', 'Experienced');

-- Create tables

CREATE TABLE "events" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "scores" (
    "id" SERIAL PRIMARY KEY,
    "archer_id" INTEGER REFERENCES archers,
    "round_id" INTEGER REFERENCES rounds,
    "event_id" INTEGER REFERENCES events,
    "bow_type" INTEGER REFERENCES bow_types,
    "category" CATEGORY NOT NULL,
    "score" INTEGER NOT NULL,
    "num_hits" INTEGER NOT NULL,
    "num_golds" INTEGER NOT NULL,
    "num_xs" INTEGER DEFAULT NULL,
    "date" DATE NOT NULL
);
