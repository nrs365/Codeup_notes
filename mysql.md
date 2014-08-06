####MySQL
using excel spread sheet - sheets can be related, meaning the value changed on one sheet will change data on another sheet
difference between __ and __ is a GUI

mysql is a Relational Database Management System, or RDBMS. This means it stores data in tables and creates relationships between the data in the different tables. This is much like having multiple spreadsheets and having the data from one sheet use data from another. We use the Structured Query Language (SQL) to interact with MySQL. 

root user in mysql has all access
often removed when in production or deployed so no one can find the password and change stuff
maria DB is 100% compatiable with mysql; made by same programers

sql commands are in all caps; can use lowercase but uppercase is BP
MySQL has a predefined table information_schema that is defined in the MySQL Reference Manual as:

INFORMATION_SCHEMA is the information database, the place that stores information about all the other databases that the MySQL server maintains.

it exists and it holds all the info about itself, don't mess with it.

mysql -u root -p

mysl database will have the users in it
USE mysql;
SHOW TABLES;

CREATE USER 'name'@'localhost' IDENTIFIED BY 'password'
GRANT ALL PRIVLEGES ON *.* TO 'name'@'localhost' WITH GRANT OPTIONS;

http://dev.mysql.com/doc/refman/5.1/en/grant.html

CREATE DATABASE name;
DROP DATABASE name; // deletes db
can't use certain words  https://dev.mysql.com/doc/refman/5.5/en/reserved-words.html

________

Values in VARCHAR columns are variable-length strings. The length can be specified as a value from 0 to 255 before MySQL 5.0.3, and 0 to 65,535 in 5.0.3 and later versions.
https://dev.mysql.com/doc/refman/5.0/en/char.html
http://dev.mysql.com/doc/refman/5.0/en/data-types.html

mysql we have to specify what type of data we want and where we want it put
bool is a synonym for TINYINT
decimal col do not have floating point number errors (use this for storing money)
date time falls into the 1% of the fact that it's different between databases
mysql does pretty good

creating a table
CREATE TABLE name (col_name data_type(size), col_name2 data_type(size));

CREATE TABLE quotes (content VARCHAR(240), author VARCHAR(50));

can do - 
CREATE TABLE quotes (content VARCHAR(240) NOT NULL, author VARCHAR(50) NOT NULL);

nulls in sql are strange;
null is the absense of value;

give rows id
CREATE TABLE quotes (
id UNSIGNED INT NOT NULL,
content VARCHAR(240), 
author VARCHAR(50)
);
(unsigned means it will always be positive (no negative sign)); id's will always be positive anyone in a db
by saying it's unsigned, we get to put in more values b/c ususally the range is split between positive and negative

add AUTO_INCREMENT - other db systems handle this different

CREATE TABLE quotes (
id UNSIGNED INT NOT NULL AUTO_INCREMENT,
content VARCHAR(240), 
author VARCHAR(50),
PRIMARY KEY(id)
);
primary key says that its not a null and 

By adding the PRIMARY KEY constraint, we can enforce the uniqueness of the key, and each table can have only one primary key. A primary key column cannot have NULL values, so we must use the NOT NULL constraint also. Combined with the AUTO_INCREMENT attribute, our id column will be unique, indexed, and will automatically increase for us.

DESCRIBE and EXPLAIN

The DESCRIBE and EXPLAIN statements are synonyms. In practice, the DESCRIBE keyword is more often used to obtain information about table structure, whereas EXPLAIN is used to obtain a query execution plan (that is, an explanation of how MySQL would execute a query).
http://dev.mysql.com/doc/refman/5.1/en/explain.html

CREATE TABLE quotes (
id UNSIGNED INT NOT NULL AUTO_INCREMENT,
content VARCHAR(240), 
author VARCHAR(50) NULL DEFAULT 'Some Guy',
salary DECIMAL(6,2), // six is total number of digits, two is the decimal places (so four, decimal point, two),
phone_number CHAR(10),
zip_code CHAR(5),
is_codeup_awesome ENUM('yes', 'duh', 'hell yea'),
created on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id)
);
adds a default value
always use decimal col for money
anytime you're doing math, use integer, never tried to add two zip codes together.  'you're never going do math on a phonenumber or zipcode'

you want to keep track of when things happen in databases
primary key def goes at the end as convention, but can go anywhere

CRUD code - CREATE READ UPDATE DESTROY
in mysql insert select update delete

CREATE TABLE quotes (
id UNSIGNED INT NOT NULL AUTO_INCREMENT,
content VARCHAR(240), 
author VARCHAR(50),
PRIMARY KEY(id)
);
INSERT INTO quotes VALUES (1, 'quote','author');

INSERT INTO quotes VALUES (NULL, 'quote', 'author');

INSERT INTO quotes (author, content) VALUES ('author', 'quote');

in mysql use backslash to escape out of single quotes
in other db use ' to escape out of single quotes
INSERT INTO quotes (author, content)
VALUES( 'author', 'quote'), ('author', 'quote'), ('author', 'quote')

INSERT INTO albums(name, year, artist) VALUES 
('Michael Jackson', 1982, 'Thriller'), 
('Pink Floyd', 1973, 'The Dark Side of the Moon'), 
('Eagles', 1976, 'Their Greatest Hits (1971-1975)'), 
('AC/DC', 1980, 'Back in Black'), 
('Bee Gees / Various Artists', 1977, 'Saturday Night Fever'), 
('Fleetwood Mac', 1977, 'Rumours'), 
('Whitney Houston / Various Artists', 1992, 'The Bodyguard'), 
('Shania Twain', 1997, 'Come On Over'),
('Led Zeppelin', 1971, 'Led Zeppelin IV'),
('Meat Loaf', 1977, 'Bat Out of Hell');

SELECT * FROM table; astrisk means select all

SELECT now();
SELECT now() FROM dual;

SELECT id, author, content FROM quotes;
SELECT author, content FROM quotes WHERE author = 'Mark Twain';
in sql you only use a single equal sign
if we just want to select one row  select by primary key quote from id 3
SELECT * FROM quotes WHERE id = 3;
SELECT author, content FROM quotes WHERE author = 'Mark Twain' OR author = 'kurt vonnegut';

SELECT author, content FROM quotes WHERE 1 = 1 AND author = 'MT' OR author 'KV';

=	Equal
!=	Not equal
<>	Not equal
<	Less than
>	Greater than
<=	Less than or equal to
>=	Greater than or equal to
BETWEEN	Find all BETWEEN 2 values

% put at the beginning or end of the value you want to search for

UPDATE quotes SET content = 'quote' WHERE id = 1;

UPDATE quotes SET author = 'SC', content = 'quote' WHERE author = 'MT';

We use UPDATE to replace data in rows in a database.

For the single-table syntax, the UPDATE statement updates columns of existing rows in the named table with new values.
http://dev.mysql.com/doc/refman/5.0/en/update.html

DELETE FROM tablename WHERE conditional;
always select what you want first
SELECT * FROM quotes WHERE id = 4;
select by ID instead of by another attribute to make sure you're only deleting that one row
DELETE * FROM quote WHERE id = 4;

TRUNCATE; -deletes table and starts it over
never use delete without a where clause

###6/17/14
CRUD

CREATE
READ
UPDATE
DELETE

sometimes do a soft delete; keep information but tells you it was deleted like email and passwords

ENUM - give options only, 'M', 'F'

Sequal Pro is fun >_>

use LIKE instead of equals with % (wildcard) to look for things that are similar or close or contain

use BETWEEN to stuff between ranges
SELECT * FROM employees WHERE emp_no BETWEEN 10000 AND 11000;

SELECT * FROM employees WHERE last_name IN ('Facello', 'Simmel', 'Peac') AND gender = 'F' AND emp_no < 11000; //can chain requests together to do a refined search;

While not a part of the WHERE clause, it is worth mentioning that we can add the DISTINCT keyword to our SELECT statement to only get non-repeating values.

SELECT DISTINCT first_name
FROM employees
WHERE first_name LIKE "%sus%";

IS NOT NULL - prob not in this database but something like middlename would be null

**daisy chaining and grouping (grouping changes it all)**
SELECT emp_no, first_name, last_name
FROM employees
WHERE (
	last_name IN ('Herber','Baek')
	OR first_name = 'Shridhar'
    )
    AND emp_no < 20000;
	
	SELECT column FROM table GROUP BY column_name [ASC|DESC];
	
However, GROUP BY returns only the unique occurrences of the column specified.

**Pagentation in a nutshell**
Pager - page listing at the bottom of web pages to allow the user to navigate forward or backwards
LIMIT 10
OFFSET 10 // gives you results 11-20
OFFSET 20

LIMIT 10 OFFSET 0; // returns first ten

	Mango DB
	neo4j graph db - relationships of ppl through other ppl
	
	all relational database systems
	mango is a document storer that has relation to each other
	
google made their own, amazon made their own bc nothing off the shelf was going to work
stuff can outgrow relational databases
______

CONCAT takes two and puts them together	
SELECT first_name|| ' ' ||last_name||' is awesome';

breaking up the sql functions in a certain way will allow the process to happen faster

**unix_timestamp can use to get back time in a format that PHP will recognize**	

SELECT first_name, last_name, unix_timestamp(hire_date)
FROM employees LIMIT 25;	
datediff() php?
dateadd()

SELECT from_unixtime(1403029097);	

SELECT count(DISTINCT last_name) FROM employees;

SELECT last_name, count(*) FROM employees 
GROUP BY last_name
ORDER BY count(*) DESC;
aggregate function - does a bunch of stuff

SELECT avg(salary) FROM salaries;
SELECT emp_no, max(salary) FROM salaries GROUP BY emp_no;

min, max, sum, count, most common functions


Alias
SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees;
 can use AS to change col name
 can't use in where clauses
 can do SELECT concat(first_name, ' ', last_name) full_name FROM employees;
 
 A SELECT expression can be given an alias using AS alias_name. The alias is used as the expression's column name and can be used in GROUP BY, ORDER BY, or HAVING clauses.

 only use AND with WHERE

Indexes
Indexes, also referred to as indices, are used to optimize queries and ensure integrity of data.

Indexes are used to find rows with specific column values quickly. Without an index, MySQL must begin with the first row and then read through the entire table to find the relevant rows. The larger the table, the more this costs. If the table has an index for the columns in question, MySQL can quickly determine the position to seek to in the middle of the data file without having to look at all the data. If a table has 1,000 rows, this is at least 100 times faster than reading sequentially. If you need to access most of the rows, it is faster to read sequentially, because this minimizes disk seeks.
https://dev.mysql.com/doc/refman/5.0/en/mysql-indexes.html

primary key - first and most important part - fastest way to look up any data in a table
we can add other indexes
**alter table**

ALTER TABLE quotes
ADD INDEX (author);
adds a key to col? makes it faster to search

can make inserting rows slower b/c it has to recalcuate

when to add index: what am i going to be searching by?
mysql slow query log - if it takes more than ten seconds to search it's too long and you should look at an index on col a b c

unique index - content of this index has to be unique; tend to use for email addresses in db
ALTER TABLE quotes
ADD UNIQUE (content); // no duplicate

INSERT INTO quotes (author, content)
VALUES ('author', 'duplicate quote');// kicks it back

gotcha: change content to allow null values- 
INSERT INTO quotes(author, content)
VALUES ('author', null); // you can insert as many null values as you want
unique col allows you to no get duplicates, but you can always insert as many null values as you like unless you add NOT NULL


adding index on first name
first_name_idx (col name, idex)
first_name_unq(col name, unique)

EXPLAIN - helps us look at what's happeneing behind the scenes

EXPLAIN
SELECT * FROM employees WHERE first_name LIKE 'Georg%';

can put unique on two col we're concat

do describe then check table info tab in sequal pro
show create table works better to show what changes have been made and gives you info

MUL in the the key not sure what it means

FOREIGN KEY (role_id)
anything here has to reference a value in another table

Foreign Keys
We'll use foreign keys to relate tables that will be used in joins. We will be working with multiple tables in single queries soon, and foreign key constraints will be important.

If a table has many columns, and you query many different combinations of columns, it might be efficient to split the less-frequently used data into separate tables with a few columns each, and relate them back to the main table by duplicating the numeric ID column from the main table. That way, each small table can have a primary key for fast lookups of its data, and you can query just the set of columns that you need using a join operation. 
https://dev.mysql.com/doc/refman/5.5/en/optimizing-foreign-keys.html


CREATE TABLE `titles` (
  `emp_no` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`emp_no`,`title`,`from_date`),
  KEY `emp_no` (`emp_no`),
  CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use **UNSIGNED** when making id INT because it'll make it only positive ids starting at 1 and going on to 250, instead of starting at -250 and going to 250

SELECT * FROM users JOIN roles ON users.role_id = roles.id; // adding in two more col? lose two rolls?
roll id was null? inter joined
aliases on col
SELECT * FROM users u JOIN roles r ON u.role_id = r.id 

have to use where with original name not alias

SELECT u.name, u.email, r.name
FROM users u
LEFT JOIN roles r ON u.role_id = r.id;

RIGHT JOIN
joining?

many to many relationship

simple join (inner join)
left
right

start with parent table
users table is the parent table, join children (foreign key tables)
right joins feel weird

Reflect and share: everything was fine until we started trying to join things. I was having a lot of fun with db until now.  >_> joining... irony...

###6/18/14


associative table - many to many; if one side is one you need a left, right, or inner join



SELECT r.name, count(u.id) AS number_of_users
FROM roles r
JOIN users u 
ON r.id = u.role_id;
GROUP BY r.name; // same as running SELECT DISTINCT r.name

SELECT r.name FROM roles r GROUP BY r.name;// these two are the same things and do the same thing
SELECT DISTINCT r.name FROM roles r;



SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no;

SELECT d.dept_name, dm.emp_no
FROM departments d
LEFT JOIN dept_manager dm ON d.dept_no = dm.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date='9999-01-01';

__________________
**doing subqueries**

subqueries are nested select queries

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no
    IN
    (
        SELECT emp_no
        FROM dept_manager
    )
LIMIT 10;
returns a subset of employees with ____

the inner query gets modified (the nested select)

WHERE IN - where a set of things might be equal to other things
can get multiple results
WHERE emp_no IN (101010, 110022); // can pass multiple things to check
WHERE first_name = 'Aamer';
WHERE first_name OR first_name = 'Aamod';
WHERE first_name IN ('Aamer', 'Aamod');

using GROUP BY automatically asc, can use dsc for ordering


SELECT *
FROM employees
WHERE gender = 'F'
AND emp_no IN (
	SELECT emp_no
	FROM dept_manager
	....
	
	