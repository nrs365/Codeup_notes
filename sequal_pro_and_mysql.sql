SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date IS NULL;
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;
SELECT u.name, u.email, r.name AS role_name
FROM users u
RIGHT JOIN roles r ON u.role_id = r.id;
SELECT u.name, u.email, r.name AS role_name
FROM users u
LEFT JOIN roles r ON u.role_id = r.id;
SELECT u.name, u.email, r.name AS role_name
FROM users u
JOIN roles r ON u.role_id = r.id WHERE r.name = 'reviewers';
CREATE TABLE roles (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE users (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  role_id int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);
INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');
INSERT INTO users (name, email, role_id) VALUES ('bob', 'bob@example.com', 1);
INSERT INTO users (name, email, role_id) VALUES ('joe', 'joe@example.com', 2);
INSERT INTO users (name, email, role_id) VALUES ('sally', 'sally@example.com', 3);
INSERT INTO users (name, email, role_id) VALUES ('adam', 'adam@example.com', 3);
INSERT INTO users (name, email, role_id) VALUES ('jane', 'jane@example.com', null);
INSERT INTO users (name, email, role_id) VALUES ('mike', 'mike@example.com', null);
describe albums;
show create albums;
DESCRIBE albums;
ALTER TABLE albums
ADD UNIQUE(name, artist);
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE departments;
DESCRIBE titles;
SELECT concat(emp_no, ' - ', last_name, ' ', first_name) as full_name, birth_date AS DOB FROM employees LIMIT 10;
SELECT concat(last_name, ' ', first_name) AS full_name, birth_date AS DOB FROM employees LIMIT 10;
SELECT concat(last_name, ' ', first_name) AS full_name AND birth_date AS DOB FROM employees LIMIT 10;
SELECT concat(last_name, ' ', first_name) AS full_name, AND birth_date AS DOB FROM employees LIMIT 10;
SELECT concat(last_name, ' ', first_name) AS full_name FROM employees LIMIT 10