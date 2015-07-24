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

-- Create view to calculate individual records
CREATE VIEW "individual_records" AS
SELECT (a.first_name || ' ' || a.last_name) AS archer_name, s.score AS score,
    r.name AS round_name, s.num_golds AS num_golds, r.type AS round_type, 
    b.name AS bow_type, a.gender AS gender, s.category AS category FROM scores 
    AS s JOIN 
        (SELECT MAX(score) AS score, round_id, category, bow_type FROM 
            scores JOIN archers ON archer_id=archers.id
            WHERE archers.gender='M'
            GROUP BY round_id, category, bow_type)
        AS c USING (score, category, round_id, bow_type) 
        JOIN archers AS a ON a.id=s.archer_id
        JOIN rounds AS r ON r.id=s.round_id 
        JOIN bow_types AS b ON b.id=s.bow_type
        WHERE a.gender='M'
UNION
SELECT (a.first_name || ' ' || a.last_name) AS archer_name, s.score AS score,
    r.name AS round_name, s.num_golds AS num_golds, r.type AS round_type, 
    b.name AS bow_type, a.gender AS gender, s.category AS category FROM scores 
    AS s JOIN 
        (SELECT MAX(score) AS score, round_id, category, bow_type FROM 
            scores JOIN archers ON archer_id=archers.id
            WHERE archers.gender='F'
            GROUP BY round_id, category, bow_type)
        AS c USING (score, category, round_id, bow_type) 
        JOIN archers AS a ON a.id=s.archer_id
        JOIN rounds AS r ON r.id=s.round_id 
        JOIN bow_types AS b ON b.id=s.bow_type
        WHERE a.gender='F'
ORDER BY round_name DESC, bow_type DESC, score DESC, num_golds DESC;

