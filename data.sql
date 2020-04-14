CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(80)
);
CREATE TABLE "hobby" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(80)
);
-- REFERENCES - creates a foreign key to the other table
CREATE TABLE "person_hobby" (
	"id" SERIAL PRIMARY KEY,
	"person_id" INT REFERENCES "person",
	"hobby_id" INT REFERENCES "hobby",
	"skill_level" INT
);
INSERT INTO "person" ("name") VALUES 
('Billy'), ('Mark'), ('Mary'), ('Jordan'), ('Mustafa'), ('Frieda'), ('Max');
INSERT INTO "hobby" ("description") VALUES
('gaming'), ('sleeping'), ('cross-stich'), ('coding');
INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill_level") 
VALUES 
(1, 1, 4),
(2, 1, 4),
(3, 1, 3),
(4, 1, 1),
(4, 4, 5),
(7, 4, 5),
(5, 2, 5),
(6, 3, 5);
INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill_level") 
VALUES 
(3, 2, 4),
(3, 3, 2),
(6, 1, 2);
SELECT * FROM person;
SELECT * FROM hobby;
SELECT * FROM person_hobby;
-- List all the people by name, with their hobbies by description
SELECT "person"."id" as person_id, "name", "description", "skill_level" FROM person
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id" 
JOIN "hobby" ON "person_hobby"."hobby_id" = "hobby"."id";
-- Min & Max - lowest skill level & highest skill level
SELECT MIN("skill_level") FROM "person_hobby";
SELECT MAX("skill_level") FROM "person_hobby";
-- Average Skill level
SELECT AVG("skill_level") FROM "person_hobby";
-- Add things up?  What's the sum of all the skill levels
SELECT SUM("skill_level") FROM "person_hobby";
-- Count the number people with each hobby - hobby description & count
SELECT description, COUNT(person_hobby.hobby_id) FROM person_hobby 
JOIN hobby ON person_hobby.hobby_id = hobby.id
GROUP BY hobby.description”;
-- Average skill for each hobby
SELECT “description”, AVG(“person_hobby”.“skill_level”) FROM “person_hobby” 
JOIN “hobby” ON “person_hobby”.“hobby_id” = “hobby”.“id”
GROUP BY “hobby”.“description”;