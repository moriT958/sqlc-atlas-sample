-- Create "products" table
CREATE TABLE "public"."products" (
    "id" integer NOT NULL,
    "name" character varying(255) NULL,
    "description" character varying(255) NOT NULL,
    "quantity" integer NOT NULL,
    PRIMARY KEY ("id")
);

-- Create "users" table
CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "username" character varying(255) NOT NULL,
    PRIMARY KEY ("id")
);

-- Create "orders" table
CREATE TABLE "public"."orders" (
    "id" integer NOT NULL,
    "name" character varying(255) NULL,
    "user_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    PRIMARY KEY ("id"),
    CONSTRAINT "product_fk" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT "user_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);