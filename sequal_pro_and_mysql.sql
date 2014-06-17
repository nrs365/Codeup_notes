SELECT * FROM departments;
SELECT * FROM employees WHERE hire_date = "1985-01-01";
SELECT * FROM employees WHERE birth_date = "1960-06-18";
SELECT * FROM employees WHERE first_name = 'Joanna';
SELECT * FROM employees WHERE first_name LIKE '%nna%';
SELECT * FROM employees WHERE first_name LIKE 'J%';
SELECT * FROM employees WHERE emp_no BETWEEN 10000 AND 11000;
SELECT * FROM employees WHERE last_name IN ('Facello', 'Simmel', 'Peac') AND gender = 'F' AND emp_no < 11000;
SELECT DISTINCT first_name FROM employees WHERE first_name LIKE "%sus%";

SELECT * FROM employees WHERE emp_no = '101010';
SELECT * FROM employees WHERE hire_date = '1990-10-22';

SELECT emp_no, first_name, last_name
FROM employees
WHERE (
	last_name IN ('Herber','Baek')
	OR first_name = 'Shridhar'
    )
    AND emp_no < 20000;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber','Baek')
    AND emp_no < 20000
    OR first_name = 'Shridhar'; *\/


SELECT * FROM employees WHERE emp_no = '101010';
SELECT * FROM employees WHERE hire_date = '1990-10-22' AND emp_no <= 101010 AND gender = 'F';

SELECT * FROM employees ORDER BY last_name;

SELECT * FROM employees ORDER BY last_name DESC;
SELECT * FROM employees ORDER BY birth_date DESC;
SELECT * FROM employees ORDER BY last_name ASC, first_name ASC, birth_date DESC;

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC;
SELECT DISTINCT dept_name FROM departments ORDER BY dept_name ASC;

SELECT first_name, last_name, hire_date
FROM employees
GROUP BY hire_date;

SELECT last_name FROM employees GROUP BY first_name ORDER BY last_name;

SELECT * FROM titles GROUP BY title;

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC;

SELECT DISTINCT title FROM titles;

SELECT * FROM employees ORDER BY emp_no LIMIT 10;
SELECT * FROM employees ORDER BY emp_no LIMIT 10 OFFSET 200; 

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
SELECT DISTINCT title FROM titles ORDER BY titles DESC OFFSET 2;

SELECT concat(first_name,)
SELECT * FROM employees WHERE `first_name` LIKE 'Georg%';
SELECT * FROM employees WHERE 'first_name' NOT LIKE 'Georg%'; *\/

SELECT curdate(), curtime(), now();

SELECT * FROM employees WHERE hire_date LIKE '%-10-30';

SELECT * FROM employees
WHERE MONTH(hire_date) = 10
	AND DAY(hire_date) = 30;
	
SELECT first_name, last_name, unix_timestamp(hire_date)
FROM employees LIMIT 25;

SELECT from_unixtime(1403029097);	

SELECT count(DISTINCT last_name) FROM employees;

SELECT last_name, count(*) FROM employees 
GROUP BY last_name
ORDER BY count(*) DESC;

SELECT avg(salary) FROM salaries;
SELECT sum(salary) FROM salaries;

SELECT emp_no, max(salary) FROM salaries GROUP BY emp_no;

SELECT count(*) FROM employees WHERE first_name LIKE '%aso%';
SELECT COUNT(first_name) FROM employees WHERE first_name LIKE '%aso%';
SELECT count(DISTINCT first_name) FROM employees WHERE first_name LIKE '%aso%';

SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT concat(first_name, ' ', last_name) AS full_name FROM employees ORDER BY full_name;

SELECT concat(first_name, ' ', last_name) AS full_name,
birth_date AS day_of_birth,
datediff(now())...;

SELECT concat(last_name, ' ', first_name) AS full_name FROM employees LIMIT 10;

SELECT concat(last_name, ' ', first_name) AS full_name, birth_date AS DOB FROM employees LIMIT 10;

SELECT concat(emp_no, ' - ', last_name, ' ', first_name) as full_name, birth_date AS DOB FROM employees LIMIT 10;

DESCRIBE employees;
DESCRIBE titles;
DESCRIBE departments;
DESCRIBE salaries;

ALTER TABLE albums
ADD UNIQUE(name, artist);

describe albums;


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


SELECT u.name, u.email, r.name AS role_name
FROM users u
RIGHT JOIN roles r ON u.role_id = r.id;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date IS NULL; */
