DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
id SERIAL PRIMARY KEY,
first_name VARCHAR(255),
second_name VARCHAR(255),
house_name VARCHAR(255),
age INT
);

CREATE TABLE houses(
id SERIAL PRIMARY KEY,
house_logo VARCHAR(255),
house_name VARCHAR(255),
student_id INT REFERENCES students(id) ON DELETE CASCADE
);

--seed data to create the students
INSERT INTO students(first_name, second_name, house_name, age) VALUES ('Harry', 'Potter', 'Gryffindor', '12');
INSERT INTO students(first_name, second_name, house_name, age) VALUES ('Ron', 'Weasley', 'Gryffindor', '12');
INSERT INTO students(first_name, second_name, house_name, age) VALUES ('Hermione', 'Granger', 'Gryffindor', '12');
INSERT INTO students(first_name, second_name, house_name, age) VALUES ('Draco', 'Malfoy', 'Slytherin', '12');
INSERT INTO houses(house_logo, house_name) VALUES('https://cdn.shopify.com/s/files/1/2597/5112/products/hptvtgryat_1_1200x1200.jpg?v=1517443538', 'Gryffindor.')
