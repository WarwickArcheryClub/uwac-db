-- Drop table

DROP TABLE IF EXISTS "events" CASCADE;

-- Create table

CREATE TABLE "events" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL
);

-- Insert data

INSERT INTO "events" ("id", "name") VALUES 
	(1, 'BUCS (BUSA)'),
	(2, 'BUTC'),
	(3, 'BUTTS'),
	(4, 'Club Competition'),
	(5, 'Tour / Isle of Man'),
	(6, 'Practice Session'),
	(7, 'None Given'),
	(8, 'External Competition'),
	(9, 'Competition Session'),
	(10, 'International Competition');

-- Update sequence of primary ke

SELECT setval('events_id_seq', 10); -- Any rows added will have primary key ID of 10+
