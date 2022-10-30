CREATE TABLE "reader" (
  "number" int PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birthday" DATE
);

CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "publisher_nr" int,
  "category_nr" int,
  "year" int,
  "pages_number" int,
  "title" varchar,
  "author" varchar
);

CREATE TABLE "book_copy" (
  "number" int,
  "position" varchar,
  "ISBN" int,
  "reader_nr" int,
  "return_date" DATE,
  PRIMARY KEY ("ISBN", "number")
);

ALTER TABLE "book_copy" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book_copy" ADD FOREIGN KEY ("reader_nr") REFERENCES "reader" ("number");

CREATE TABLE "publisher" (
  "number" int PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_nr") REFERENCES "publisher" ("number");

CREATE TABLE "category" (
  "number" int PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("category_nr") REFERENCES "category" ("number");

CREATE TABLE "category_hierarchy" (
  "category_nr" int,
  "subcategory_nr" int
);

ALTER TABLE "category_hierarchy" ADD FOREIGN KEY ("category_nr") REFERENCES "category" ("number");

ALTER TABLE "category_hierarchy" ADD FOREIGN KEY ("subcategory_nr") REFERENCES "category" ("number");
