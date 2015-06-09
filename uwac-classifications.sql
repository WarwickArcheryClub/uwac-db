-- Drop table & types

DROP TYPE IF EXISTS GENDER CASCADE;

DROP TABLE IF EXISTS "classifications" CASCADE;

-- Create types

CREATE TYPE GENDER AS ENUM ('M', 'F');

-- Create table

CREATE TABLE "classifications" (
    "round_id" INTEGER REFERENCES rounds,
    "bow_type" INTEGER REFERENCES bow_types,
    "gender" GENDER NOT NULL,
    "class_gmb" INTEGER DEFAULT NULL,
    "class_mb" INTEGER DEFAULT NULL,
    "class_bm" INTEGER DEFAULT NULL,
    "class_1st" INTEGER DEFAULT NULL,
    "class_2nd" INTEGER DEFAULT NULL,
    "class_3rd" INTEGER DEFAULT NULL,
    PRIMARY KEY ("round_id", "bow_type", "gender")
);

-- Insert classifications

INSERT INTO "classifications" ("round_id", "bow_type", "gender", "class_3rd", "class_2nd", "class_1st", 
    "class_bm", "class_mb", "class_gmb") VALUES
    (89, 1, 'M', 69, 158, 335, 543, 668, 813),
    (89, 1, 'F', 26, 69, 158, 308, 480, 543),
    (89, 2, 'M', 574, 865, 996, 1134, 1206, 1149),
    (89, 2, 'F', 335, 543, 865, 1049, 1157, 1214),
    (89, 3, 'M', 46, 89, 142, 236, 362, 450),
    (89, 3, 'F', 14, 53, 78, 142, 194, 259),
    (89, 4, 'M', 283, 511, 698, 913, 1065, 1146),
    (89, 4, 'F', 142, 308, 511, 786, 977, 1080),
    (47, 1, 'F', 67, 155, 306, 508, 693, 752),
    (47, 2, 'F', 539, 752, 1010, 1143, 1220, 1259),
    (47, 3, 'F', 39, 124, 173, 280, 359, 447),
    (47, 4, 'F', 280, 508, 723, 952, 1091, 1165),
    (26, 1, 'M', 298, 505, NULL, NULL, NULL, NULL),
    (26, 1, 'F', 148, 298, 505, NULL, NULL, NULL),
    (26, 2, 'M', 955, 1119, NULL, NULL, NULL, NULL),
    (26, 2, 'F', 754, 933, 1119, NULL, NULL, NULL),
    (26, 3, 'M', 255, 353, NULL, NULL, NULL, NULL),
    (26, 3, 'F', 92, 248, 325, NULL, NULL, NULL),
    (26, 4, 'M', 695, 911, NULL, NULL, NULL, NULL),
    (26, 4, 'F', 473, 725, 911, NULL, NULL, NULL),
    (27, 1, 'M', 477, NULL, NULL, NULL, NULL, NULL),
    (27, 1, 'F', 282, 477, NULL, NULL, NULL, NULL),
    (27, 2, 'M', 1060, NULL, NULL, NULL, NULL, NULL),
    (27, 2, 'F', 908, 1044, NULL, NULL, NULL, NULL),
    (27, 3, 'M', 338, NULL, NULL, NULL, NULL, NULL),
    (27, 3, 'F', 194, 417, NULL, NULL, NULL, NULL),
    (27, 4, 'M', 860, NULL, NULL, NULL, NULL, NULL),
    (27, 4, 'F', 663, 884, NULL, NULL, NULL, NULL),
    (28, 1, 'F', 502, NULL, NULL, NULL, NULL, NULL),
    (28, 2, 'F', 1050, NULL, NULL, NULL, NULL, NULL),
    (28, 3, 'F', 390, NULL, NULL, NULL, NULL, NULL),
    (28, 4, 'F', 869, NULL, NULL, NULL, NULL, NULL),
    (82, 1, 'M', 73, 157, 307, 465, NULL, NULL),
    (82, 1, 'F', 29, 73, 157, 286, NULL, NULL),
    (22, 1, 'M', 149, 278, 458, NULL, NULL, NULL),
    (87, 1, 'M', 266, 426, NULL, NULL, NULL, NULL),
    (81, 1, 'M', 416, NULL, NULL, NULL, NULL, NULL), 
    (69, 1, 'M', 32, 81, 193, 334, NULL, NULL),
    (60, 1, 'M', 89, 185, 342, NULL, NULL, NULL),
    (86, 1, 'M', 176, 314, NULL, NULL, NULL, NULL),
    (80, 1, 'M', 416, NULL, NULL, NULL, NULL, NULL),
    (23, 1, 'M', 222, 355, NULL, NULL, NULL, NULL),
    (67, 1, 'M', 20, 53, 130, 233, NULL, NULL),
    (58, 1, 'M', 56, 121, 234, NULL, NULL, NULL),
    (66, 1, 'M', 121, 221, NULL, NULL, NULL, NULL),
    (79, 1, 'M', 200, NULL, NULL, NULL, NULL, NULL),
    (68, 1, 'M', 16, 41, NULL, NULL, NULL, NULL),
    (59, 1, 'M', 44, 92, NULL, NULL, NULL, NULL),
    (85, 1, 'M', 88, 157, NULL, NULL, NULL, NULL),
    (96, 1, 'M', 145, NULL, NULL, NULL, NULL, NULL);