-- Modify "orders" table
ALTER TABLE
    "public"."orders"
ALTER COLUMN
    "name" TYPE character varying(20);

-- Modify "products" table
ALTER TABLE
    "public"."products"
ALTER COLUMN
    "name" TYPE character varying(20),
ALTER COLUMN
    "description" TYPE text;

-- Modify "users" table
ALTER TABLE
    "public"."users"
ALTER COLUMN
    "username" TYPE character varying(20),
ALTER COLUMN
    "email" TYPE character varying(20);