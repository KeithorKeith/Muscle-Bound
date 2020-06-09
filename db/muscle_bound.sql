DROP TABLE IF EXISTS bookclasses;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS gymclasses;


CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE gymclasses (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(255),
    time VARCHAR(255),
    capacity INT
);

CREATE TABLE bookclasses (
    id SERIAL PRIMARY KEY,
    gym_class_id INT references gymclasses(id),
    member_id INT references members(id)
);