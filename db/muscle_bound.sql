DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS muscleboundclasses;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE muscleboundclasses (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(255),
    time INT,
    capacity INT
);