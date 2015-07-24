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
    r.id AS round_id, s.num_golds AS num_golds FROM scores AS s JOIN 
        (SELECT MAX(score) AS max_score, round_id, category, bow_type FROM 
            scores JOIN archers ON archer_id=archers.id
            WHERE archers.gender='M' 
            GROUP BY round_id, category, bow_type)
        AS b ON s.score=b.max_score AND s.category=b.category AND
            s.round_id=b.round_id AND s.bow_type=b.bow_type
        JOIN archers AS a ON a.id=s.archer_id
        JOIN rounds AS r ON r.id=s.round_id 
UNION
SELECT (a.first_name || ' ' || a.last_name) AS archer_name, s.score AS score,
    r.id AS round_id, s.num_golds AS num_golds FROM scores AS s JOIN 
        (SELECT MAX(score) AS max_score, round_id, category, bow_type FROM 
            scores JOIN archers ON archer_id=archers.id
            WHERE archers.gender='F' 
            GROUP BY round_id, category, bow_type)
        AS b ON s.score=b.max_score AND s.category=b.category AND
            s.round_id=b.round_id AND s.bow_type=b.bow_type
        JOIN archers AS a ON a.id=s.archer_id
        JOIN rounds AS r ON r.id=s.round_id
ORDER BY score DESC, num_golds DESC;

