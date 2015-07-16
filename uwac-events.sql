-- Drop table

DROP TABLE IF EXITS "events" CASCADE;

-- Create table

CREATE TABLE "events" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);
