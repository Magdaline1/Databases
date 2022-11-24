CREATE TABLE "public"."recipes" (
  id SERIAL PRIMARY KEY,
  names text,
  cooking_time text,
  rating int
);

INSERT INTO "public"."recipes" ("id", "names", "cooking time", "rating") VALUES
(1, 'Carbonara', 25, 3),
(2, 'Bolognese', 45, 4),
(3, 'Lasagne', 65, 4);