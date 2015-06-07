DROP TABLE landlords CASCADE;
DROP TABLE reviews CASCADE;

CREATE TABLE landlords(
  id SERIAL PRIMARY KEY,
  name VARCHAR(1000),
  address1 VARCHAR(1000),
  address2 VARCHAR(1000),
  city VARCHAR(1000),
  state VARCHAR(1000),
  zip INTEGER,
  review_id INTEGER
);

CREATE TABLE reviews(
  id SERIAL PRIMARY KEY,
  review VARCHAR(5000),
  landlord_id INTEGER
);
