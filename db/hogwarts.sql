DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses(
id SERIAL PRIMARY KEY,
logo TEXT,
house_name VARCHAR(255)
);

CREATE TABLE students(
id SERIAL PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
house_id INT REFERENCES houses(id) ON DELETE CASCADE,
age INT
);
