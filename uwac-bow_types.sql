-- Drop table

DROP TABLE IF EXISTS "bow_types" CASCADE;

-- Create table

CREATE TABLE "bow_types" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

-- Insert bow types

INSERT INTO "bow_types" ("id", "name") VALUES
    (1, 'Barebow'),
    (2, 'Compound'),
    (3, 'Longbow'),
    (4, 'Recurve');

-- Update sequence of the primary key

SELECT setval('bow_types_id_seq', 4); -- Any rows added will have primary key ID of 4+
