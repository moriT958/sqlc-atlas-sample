-- Create "authors" table
CREATE TABLE "public"."authors" (
    "id" bigserial NOT NULL,
    "name" text NOT NULL,
    "bio" text NULL,
    PRIMARY KEY ("id")
);