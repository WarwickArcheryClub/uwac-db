-- Drop tables and associated types

DROP TYPE IF EXISTS CATEGORY CASCADE;

DROP TABLE IF EXISTS "scores" CASCADE;
DROP TABLE IF EXISTS "scores_queue" CASCADE;

-- Create types

CREATE TYPE CATEGORY AS ENUM ('Novice', 'Experienced');

-- Create tables

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

CREATE TABLE "scores_queue" (
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