-- Drop table

DROP TABLE IF EXISTS "new_archers" CASCADE;

-- Create table;

CREATE TABLE "new_archers" (
	"id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) DEFAULT NULL,
    "card_number" VARCHAR(7) DEFAULT NULL
);
