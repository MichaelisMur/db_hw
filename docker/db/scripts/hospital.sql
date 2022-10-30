CREATE TABLE "station_personnel" (
  "pers_nr" int PRIMARY KEY,
  "name" varchar,
  "stat_nr" int
);

CREATE TABLE "station" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "station_personnel" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

CREATE TABLE "caregiver" (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

ALTER TABLE "caregiver" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personnel" ("pers_nr");

CREATE TABLE "doctor" (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

ALTER TABLE "doctor" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personnel" ("pers_nr");

CREATE TABLE "patient" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar
);

CREATE TABLE "treat" (
  "patient_nr" int PRIMARY KEY,
  "doctor_nr" int
);

ALTER TABLE "treat" ADD FOREIGN KEY ("doctor_nr") REFERENCES "doctor" ("pers_nr");

ALTER TABLE "treat" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

CREATE TABLE "room" (
  "room_nr" int PRIMARY KEY,
  "stat_nr" int NOT NULL,
  "beds" int
);

ALTER TABLE "room" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

CREATE TABLE "admission" (
  "patient_nr" int PRIMARY KEY,
  "room_nr" int,
  "from" DATE,
  "to" DATE
);

ALTER TABLE "admission" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");