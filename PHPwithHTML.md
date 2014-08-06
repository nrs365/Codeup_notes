###PHP and HTML

####5/29/14
can put html code in strings and echo it out
try to keep code grouped but it can be scattered a bit (within reason)
html can be forgiving, php not so much
can do <?php>
<br>
?>

can do
<table>
	<?php
	for($i = 0; $i < 16; $i++){
		echo"<tr><td>$i</td></tr>";
	}
	?>
	
"pay no attention to the css.  this is not the css you're looking for"

can use superglobals to... do... stuff
superglobals are always in caps

**<?php session_start(); ?> put at the top of the page line one**
$_SESSION - an array that gets saved somewhere on the server for a certain amount of time
use this to keep track of whether or not someone is logged in, etc
all	superglobals are arrays

$_SESSION[username] = 'Ben';

session_destroy(); // can set as a conditional (if logout)

$_SERVER — Server and execution environment information.
$_REQUEST — HTTP Request variables.
$_GET — HTTP GET variables.
$_POST — HTTP POST variables.
$_SESSION — Session variables.
$_COOKIE — HTTP cookies.
$_FILES — HTTP File Upload variable.

####5/30/14

reviewing superglobals

session is like a cookie that is stored on a server

files are uploaded through a form

<ol>
	<?php foreach ($items as $value) {?>
		<li><?php echo $value; ?></li>
	<?php } ?>	
</ol>

_GET requests always show up in the browser as a query
?item=value&item=value
?item=rubber+duck

form resubmission with get/post resubmits the form even if you don't type stuff in again, it resends the payload

header('Location:/todo_list.php); //sends a raw http header; always exit after a header request

header('Location:/todo_list.php);
exit(0);

reviewing sessions
session_start();
$_SESSION[]; // array, stores key values
to restart the session reset the session to an empty array, then destroy; best practice

if (isset($_GET['logout']) && $_GET['logout'] === 'true') {
    $_SESSION = array();//starts a new session
    session_destroy();ends the session
    header("Location: process-form.php");
    exit(0);
}

move the logout to the top so it doesn't keep processing the rest of the page

**$_FILES**
<**form method="POST" enctype="multipart/form-data"** action="/file-upload.php">
    <p>
        <label for="file1">File to upload: </label>
        <input type="file" id="file1" name="file1">
    </p>
    <p>
        <input type="submit" value="Upload">
    </p>
</form>

know that you need to know that you need to find the enctype bc if you forget it it doesn't work
everyone makes this mistake so learn it and don't do it
if you don't have enctype it defaults to urlencoded
only use POST for files

move_uploaded_file(); - moves an uploaded file to a new location
basename() - returns trailing name companent of path// 
move_uploaded_file($_FILES['existing_file']['tempfile'],$saved_file_name)
don't get the actual file from the superglobal but there's a temp location
filenames will override so make unique file names

optimizing code
formatting/indentation
the only thing gtml needs to know is the list of todo items
move the html heading down to the bottom where the form is
only have the foreach in the html, all other php at the top
put all variables that are being set to some default at the very very top
use camel case or snakecase but not a mix for variables/functions
making a sep $error_message in php and use it in html (not sure why)

things I learned today:
$_FILES is a post but it does not work like $_POST (i think...)
array_merge() still returns a new array, but if you take that array and set it to the original array, you can just keep resusing that array (i know this but i keep forgetting it)
uploading a file is always going to return an array with five values inside (always)
my functions aren't always right, but some times i'm really really close

####6/2/14

array search
inarray
can be used to check if an item already exists in the todo list so it can't be duplicated

**Alternative Synatx**
<? ?> - short tags 
?= - PHP echo; ?=$color // echo $color;
: for each, while, then add endforeach; <? foreach ($colors as color) : 
endif;?>
endforeach;?> //
PHP offers an alternative syntax for some of its control structures; namely, if, while, for, foreach, and switch. In each case, the basic form of the alternate syntax is to change the opening brace to a colon (:) and the closing brace to endif;, endwhile;, endfor;, endforeach;, or endswitch;, respectively.

XSS - cross site scripting

xss-game.appspot.com - xss game area

htmlspecialchars() - converts html tags and characters instead of allowing html tags to do stuff
always wrap user input in htmlspecial chars tags b/c it's tot going to allow html or javascript

strip_tags() - php function that works with html and php tags from string; can set it to allow certain tags

make sure you strip the tags in the right order:
htmlspecialchar(string_tags($stringuserinput));

htmlentities(); converts everything (safer of the two)
always sanitize user input

*"it feels better when you're in it, if you're nervous use the payphone"*

__________

**writing csv data**

fgetcsv();
fputcsv();


###6/3/14

while(!feof($handle)) {
$address_book[] = fgetcsv($handle);
}
fclose($handle);

foreach ($addressbook as $entry) :
foreach ($entry as $value) :
<td><?= $value; ?></td>

________
####starting objects and classes

<?php
//building robo car

class RoboCar {

public $name = 'unknown'; // we have visability - public is saying this name should be accessible outside of these curly braces; part of syntax, name for any car we make will be unknown
public $color = 'blue';

public function(){ //use modifier infront of the thing give it visability
	echo "Honk honk! from " . $this->name; // $this is equal to the current instance of what you're working with or do "{$this->name}"
}	
}

$roboCar = new RoboCar(); // uppercase first letter for class
$roboCar1->name = "RoboCar One";
echo $roboCar->name;
$roboCar->honk();

?>

not all functions go inside of one big class
put the functions in the class that has something being used over and over ($filename)

class attributes - the stuff we set inside the class
class methods - functions inside classes
"so the next thing i want to do is honk robocar one's horn"

class encapsulates the attributes and function/method

**constructor**
constructors are a type of magic method
class gets called by name, want it ot be capitalized for the first letter
can do 
public function __construct($carName) // underscore underscore
{      
	$this->name = $carName;
}      
$roboCar1 = new RoboCar("RoboCar One");       


addressbook outline


####6/4/14
going over classes and objects
classes are blueprints for objects
we make an instance of a class

constructors- have double underscore - means it's magical
methods live inside class
object - instance of a class
javascript doesn't use classes, it uses prototypes, in javascript you end up with an object but they give us the prototype
class only can have one constructor (one constructor per class)
$this refers to myself inside a class, refers to other parts of the blue print
can call methods using $this inside the class
$this can only be accessed inside the class


####destructors
__destruct()
runs when class is no longer referenced by any instances
doesn't take any arguments
function __destruct() {
}
unset(instance of class) - runs the destructor; house keeping
lots of classes have destructors

typically classes get their own files
include('filename.php');//only use double quotes when interpolating a variable
**always set includes at the top**, might have to be listed in a certain order depending on if one class is using the other one

library is a collection of classes, frame work is collection of libraries that all work towards fixing the same thing

php only gives us a warning if it can't find the file
change include to require
require(filename);
makes it to where the rest of the code wont execute unless the file exists

can do inculde_once
**require_once();** best of both worlds - works well with dependencies// this should be our default one
**difference between include and require once: include will let you keep going even if the file isn't there, and will try and execute the rest of the code BUT require_once() will throw a fatal error and not continue**


###6/18/14
Classes and objects
Inheritance - 
<?php

class Car {
	public $name = 'Default';
	public function honk() {
		echo "Honk Honk from " . $this->name . "!" . PHP_EOL;
	}
}
$car = new Car();
$car->name = "Honda";
$car->honk();
?>

class which other classes extend and inherit the functionality of the parent
say it's a vehicle instead of a car, and all vehicles can honk, can make a car and a truck, vehicle is the parent class

class Vehicle {
}

class Car extends Vehicle {}

class Truck extends Vehicle{}
the honk method is given to the child so it can do what the parent does
can add certain functionality that other vehicles might not have (trunks, trailer hitch)

class Car extends Vehicle {
public function openTrunk()
	{
	echo 'Opened the trunk' . PHP_EOL;
	}
}
public function closeTrunk() {
echo 'Closed the trunk' . PHP_EOL;
}
$car = new Car();
$car->name
$car-> honk();
$car->openTrunk;

can override parent functionality
can call methods of the parent functionality in the child class


### 6/19/14

doing classes and extends
filestore is the base class, starting point
extend that to another class

construct runs when the class is instanciated and used to configure file

overriding -

class Car {
public $wheels = 4;
public $doors = 4;
}

overriding doors by calling the same variable as the parent class by changing it in the child class
class Solara extends Car {
public $doors = 2;
}
can do the same things with methods
just call the same method and set it to something different

class Solara extends Car {
	
public function __construct()
{ // runs first
	echo 'this construct runs instead';
}
$myCar = new Solara();

**parent::__construct(); // will out put both of them** static method

constructs run automatically


protected
private

PHP provides us with the following types of visibility:

public - accessible from everywhere.

protected - accessible only within the defining class and by inherited & parent classes.

private - only accessible from within the class that defines the method or property.

visability with private construct

class conversation {
private $name = '';
}
$chat = new Conversation('isaac');
//no lo se
$chat->n


getters and setters
public function get_name()
{
	return "string";
}

have to call get_name to get the name bc have access to get_name and not $name

can only set name in the parameter

setters
private function set_name($name) {
if(is_string($name)) {
$this->name = trim($name);
}
}	

change the construct at the top to change it to
public function __construct($name = '')
{
$this->name = set_name($name)
}

__________

public/private/protected allow flexability for encapuslation

protected - i don't want this to be accessible completly outside of this class, however any children of this class i want them to be able to use it or see it.

can use a public function to access a private attriute

private - only accessed inside that specific class


setter and getter
setting a variable
returning a value

private value/attribute/name - can create a public function getName() {
return $this->name;
}

function getName acts as a middleman (sort of?)
have control over middleman

###6/20/14



public function __construct($filename) {
	$this->filename = $filename;
	
	if (substr($filename, -3)) == 'csv') {
	}
}

$fs->filename = 'someotherfile.csv'; // don't do this it won't work

class AddressDataStore extends Filestore {
	//I have $filename
	//and I have $is_csv_
}

when we change it to private they don't get those things from the class

BB sticks with protected b/c of the parent/child thing (?)

best practice is that descendent classes should have access

can do getter and setter
$fs->setFilename('someotherfile.csv');
public function setFilename($filename) {
$this->filename = $filename;
if (substr($filename, -3) == 'csv') {
	$this->is_csv = true;
} else {
	$this->is_csv = false;
}
}

public function __construct($filename) {
$this->filename = $filename;
}

public function write_lines($array) {
$handle = fopen($this->filename, 'w');

exceptions - throw;


if (!is_array($array)) {
	throw new Exception('You can only pass arrays to write_lines');
}

foreach($array as $line) {
fwrite($handle, $line . PHP_EOL);
}
fclose($handle);
}//didn't get to copy the rest down

**try/catch**
try {
$fs->write_lines($todos);
} catch(Exception $e) {
	echo "something when wrong, I'm sorry.\n";
	echo $e->getMessage() . PHP_EOL;
}

try {
	if (!empty($_POST)) {
	check $post value
	throw exceptions
	push to the array
	}
} catch(Exception $e) {
	save the message to some variable
	use the variable later in the file (HTML) to print out an error to the user
}

not everything has to go in a try catch
$e is a class exception???
mesage is a protected property
getMessage is a getter
$e $exception; usually only have one instance of an exception in a file
put at the top of html


____________

still doing try and catch
throwing exceptions - the execution of the code where ever you were stops, and if it isn't being handled by a error handler 

uncaught exception - different types of exceptions; can give you the information about that was passed when the exception was thrown

php handles the exceptions and that changes it to uncaught b/c try/catch

"its a graceful way to handle a failure"

exceptions control the flow, if you don't handle it php will handle it on it's own
custom exceptions
throw new Exception(string);// basic type of exception and can catch one type of thing
want to handle more specific sort of way

try {
	if ($argc != 2) {
		throw new Exception("You need to pass exactly one arugment");
	}
	if ($argv[1] != 'test') {
		throw new Exception('the first argument must be 'test');
	}
	var_dump($argv);
} catch (Exception $ex)
{
	echo "Exception: " . $ex->getMessage() . PHP_EOL;
}

so we can create a custom exception type and class

class InvalidInputException // usually put the last word in the class name as exception

class InvalidInputException 
{
	throw new InvalidInputException();
}
add a catch
catch (InvalidInputException $ex) {
	echo "Invalid Input Exception: " . $ex->getMessage() . PHP_EOL;
}
must be derived from base class (parent/inheritance)

so it becomes
class InvalidInputException extends Exception {}

#####PDO
PHP Data Object - class in PHP, lots of public methods

We will be using the PHP Data Object (PDO) extension to connect to our database. PHP has other extensions for connecting to MySQL; however the original MySQL API has been deprecated—the replacement, MySQL Improved (MySQLi), is still under active development. PDO is generally preferred as it is more flexible and feature rich.

PDO - database abstraction layer - one way to communicate with multiple databases
communicate w/ MySQL, SQL server, Oracle, Postgres
more layers can add more functionality
PDO - database abstraction tool
single API that communcates with multiple databases





// Get new instance of PDO object
$dbc = new PDO('mysql:host=127.0.0.1;dbname=database_name', 'USERNAME', 'PASSWORD');
different formats for different types of databases
$dbc - data base connection

$dbc = new PDO(mysql:host) // this part will change
check PDO docs, the dsn is the part have here
only going to do it one place in code and not going to have to do it multiple times

$dbc->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);// this tells PDO how to handle errors and exceptions - we want to have exceptions thrown as the error handling system and gives us the option of how to handle them

echo $dbc->getAttribute(PDO::ATTR_CONNECTION_STATUS) . "\n"; // this checks for a connection

$dbc->exec($query); // takes query with create table arguments
paste the $query with all the stuff in the php file
// Create the query and assign to var
$query = 'CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(240) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)';

insert statement : INSERT INTO users (email, name) VALUES ('email') // don't pass id b/c auto increment does it 

delete query code, replace with insert code as a new query
exec - execute returns something,
// Execute Query
$numRows = $dbc->exec($query);
echo "Inserted $numRows row." . PHP_EOL; 

lastInsertId() - returns last added autoincremented id number
$users = [
    ['email' => 'jason@codeup.com',   'name' => 'Jason Straughan'],
    ['email' => 'chris@codeup.com',   'name' => 'Chris Turner'],
    ['email' => 'michael@codeup.com', 'name' => 'Michael Girdley']
];

foreach ($users as $user) {
    $query = "INSERT INTO users (email, name) VALUES ('{$user['email']}', '{$user['name']}')";

    $dbc->exec($query);

    echo "Inserted ID: " . $dbc->lastInsertId() . PHP_EOL;
}
lastInsertId() only works that one time; the connection gets established and then ends when the php script stops, so last insert only works in that instance of adding rows

reflect and share: TFIG;


###6/23/14

inside objects - properties and methods
when searching by ID is faster b/c it cuts the db in half for each query until it finds the one that matches
exec can only get back the number of rows effected, not the actual info about anything
use query when selecting

using query with 
pdo statements
only get objects back with query either a pdo statement object or an exception object with metadata

$stmt = $dbc->query('SELECT * FROM users');

echo "Columns: " . $stmt->columnCount() . PHP_EOL;
echo "Rows: " . $stmt->rowCount() . PHP_EOL;

dbc and stmt - data base connection and statement - don't usually use supershorthand abbrevitions for coding but these are so prevalent are going to know these and use these

stmt is going to hold some sort of object
on that statement object, we can run column count (above)

The most common way to get our results from the PDOStatement instance is to use the fetch() method. By default, this function will return the current database row as an array and advance to the next row. By putting our call to $stmt->fetch() in the heading of a while statement we can iterate through all the results, like the following:

$stmt = $dbc->query('SELECT * FROM users');

echo "Columns: " . $stmt->columnCount() . PHP_EOL;
while ($row = $stmt->fetch()) {
    print_r($row);
}

**query returns metadata, execute executes it and returns rows affected, and fetch is going to retrn an array and then the next row as an array**

its sort of like a little pointer; usually in a while loop
b/c its an array want to make sure we use print_r() when using debug to figure out how things are working

run the fetch method on the results set

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print_r($row);
}
PDO::FETCH_ASSOC - constant that returns the fetch as an associative array
PDO::FETCH_BOTH - returns both; default when fetch() is empty

print_r($stmt->fetch());
print_r($stmt->fetch(PDO::FETCH_ASSOC));
print_r($stmt->fetch(PDO::FETCH_NUM));
print_r($stmt->fetch(PDO::FETCH_BOTH));


function getUsers($dbc) {
$stmt = $dbc->query('SELECT * FROM users');

$rows = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
$rows[] = $row;
}
return $row;
}
foreach didn't get the rest

fetchAll() - returns all without doing all the code i just wrote


function getUsers($dbc) {
$stmt = $dbc->query('SELECT * FROM users');
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC); // someway of making this whole section one line and returning that
return $rows;
}
foreach(getUsers($dbc) as $row) {
print_r($row);
}

__________

buttons?

function getOffset() {
$page = isset($_GET['page']) ? $_GET['page'] : 1;
return ($page - 1)*4;
}

$parks = $dbc->query('SELECT * FROM national_parks LIMIT 4')->fetchAll(PDO::FETCH_ASSOC);
$count = $dbc->query('SELECT count (*) FROM national_parks')->fetchColumn();
$numPages = floor($count / 4);


<ul class="pager">
	<li class="previous disabled"><a href="?">&larr; Previous</a></li>
	<li class="next"><a href="">
		
		
BB's solution:
<?php

function getOffset() {
    $page = isset($_GET['page']) ? $_GET['page'] : 1;

    return ($page - 1) * 4;
}

$dbc = new PDO('mysql:host=127.0.0.1;dbname=codeup_demo', 'bbatsche', 'NKKE9mNtyTL>hF2D');
$dbc->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$parks = $dbc->query('SELECT * FROM national_parks LIMIT 4)->fetchAll(PDO::FETCH_ASSOC);

$count = $dbc->query('SELECT count(*) FROM national_parks')->fetchColumn();

$numPages = floor($count / 4);

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>National Parks</title>

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" />

    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
    <div class="container">
        <h1>National Parks <small>Parks National</small></h1>

        <table class="table table-striped table-hover">
            <tr>
                <th>Name</th>
                <th>State</th>
                <th>Date Established</th>
                <th>Area in Acres</th>
            </tr>

            <?php foreach ($parks as $park): ?>
                <tr>
                    <td><?= $park['name']; ?></td>
                    <td><?= $park['location']; ?></td>
                    <td><?= $park['date_established']; ?></td>
                    <td><?= $park['area_in_acres']; ?></td>
                </tr>
            <?php endforeach ?>
        </table>
        <ul class="pager">
          <li class="previous disabled"><a href="?">&larr; Previous</a></li>
          <li class="next"><a href="?page=2">Next &rarr;</a></li>
        </ul>
    </div>
</body>
</html>

$query = 'SELECT * FROM national_parks LIMIT 4 OFFSET ' . getOffset();
$parks = $dbc->query('SELECT count(*) FROM national_parks')->fetchColumn();
		


something about using single quotes

$quote = 'can\'t or won\'t?';
$query = "SELECT * FROM quotes WHERE content='$quote'";

sql injection example
SELECT * FROM users WHERE id='7' OR ''=''; // i think

new function called prepare
$stmt = $dbc->prepare('SELECT * FROM users WHERE id = ?');
$stmt->execute(array($queryId)); // this does something to protect it
bind parameters:		
$query = 'INSERT INTO users (email, name) VALUES (?, ?)';

$stmt = $dbc->prepare($query);

$stmt->execute(array('benb@codeup.com', 'Ben Batschelet'));

the ? in the VALUES should be the same amount as the info you want added and then pass the variables as an array w/ execute

named parameters: start with a colon, go in the VALUES, not parsed by php parsed by mysql
$query = 'INSERT INTO users (email, name) VALUES (:email, :name)';

$stmt = $dbc->prepare($query);

bindValue()
PDO::PARAM_BOOL — boolean datatype
PDO::PARAM_INT — integer datatype
PDO::PARAM_STR — string datatype
PDO::PARAM_NULL — null datatype
no paramfloat or date, use PARAM_STR


foreach ($users as $user) {
    $stmt->bindValue(':email', $user['email'], PDO::PARAM_STR);
    $stmt->bindValue(':name',  $user['name'],  PDO::PARAM_STR);

    $stmt->execute();
	
do not quote parameters in VALUES
don't have to worry about sql injection if you use prepare
don't use string interpolation inside a query

$stmt->bindValue(:':limit', 5, PDO::PARAM_INT);
bindParam works almost the same as bindValue // 

____________
###6/24/14

binding attributes
bindValue() checks to make sure it can be saved to the database without executing a query; PDO takes care of it for us, it's a built in function, escapes special characters?

always bind value with any data coming from the user even if it's a page number we are getting back from the address bar

create the table- no need to use binding
need to bind values to protect database but also need to use html special characters remove and strip tags everytime you take in user input, escape out all user input, 
platform as a server - digital ocean

can bind off of a form by using bindValue(':email', $_POST['email'], PDO::PARAM_STR);

__________
parameterized queries - prevents sql injection

never want to concatinate variables esp var from the user


todo list ordering
php code at top
1) establish DB connection
2)Check if something was posted
a)is the item being added? => add todo!
b)is item being removed? => remove it!
c)is list being uploaded? => add todos?
3)query DB for total todo count
4)Determine pagination values
5)query for todos on current page

forced order of events
don't worry too much about the uploading right now


more important is B as a post b/c of the database communication
put these comments in the code
<form id="formdelete" method="POST">
	<input type="hidden" name="remove_id">
</form> // something with javascript

replace the links with embedded php tags with button (make a class)
add attribute that says what item that todo item was associated with
fill in remove_id that corresponds to the item
<ul>
<li></li>

	

html button value something you could do but chris likes the idea of having a cancel prompt

<form id=>
	
	<form id="removeForm" action="todo-db.php" method="post">
	    <input id="removeId" type="hidden" name="remove" value="">
	</form>
	then go and get the jquery link
	
	used a table instead of an unordered list
	added some bootstrap stuff
	<td><?= $todo['item']?>
		
	use data- to make up an attribiute - data-todo="">Remove</button>
	
	<button class="btn btn-danger btn-sm pull-right btn-remove" data-todo="<?= $todo['id']; ?>">Remove</button>
	assign it a click event and delete it
	
$('#removeForm').submit();
$('.btn-remove').click(function())	

	______________
	
	<form id="removeForm" action="todo-db.php" method="post">
	    <input id="removeId" type="hidden" name="remove" value="">
	</form>
	<button class="btn btn-danger btn-sm pull-right btn-remove" data-todo="<?= $todo['id']; ?>">Remove</button>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script>

	$('.btn-remove').click(function () {
	    var todoId = $(this).data('todo');
	    if (confirm('Are you sure you want to remove item ' + todoId + '?')) {
	        $('#remove-id').val(todoId);
	        $('#remove-form').submit();
	    }
	});

	</script>
	__________________
	

	
###6/25/14
from todo list:
$stmt->execute(array($_POST['remove']));


__________
random address book stuff
<button>
<script>	
$(document).ready(function(){
$('.remove_btn').click(function(){
var contactId = $(this).data('contactId');
var contactName = $(this).data('contactName);
});
});

if(confirm(message)) {
$("#removeId").val(contactId);
$("#removeForm").submit();
}
</script>

<form action="index.php" method="POST" id="removeForm">

}	
}
we have function xdebug for debugging; MacGB3?

use breakpoints in browser window
can pause in debugger


if(!empty($_POST['removeId'])) {
$deleteStmt = $dbc->prepare('DELETE FROM contact WHERE id=?');
$delete->execute(array($_POST['remove_id']));
}

$contactStmt = $dbc->prepare('SELECT * FROM contact');
$contactStmt->execute();

$contacts = $contactStmt->fetchAll(PDO::FETCH_ASSOC);


function formatPhone($phoneNumber) {
return '(' . substr($phoneNumber, 0, 3) .') '. substr($phoneNumber, 3, 3) . '-' . substr($phoneNumber, 6, 4);
}

SELECT first_name, last_name, phone_number, count(ca.address_id) AS address_count
FROM contact c
LEFT JOIN contact_address ca ON c.id = ca.contact_id //ca is the alias of contact_address
GROUP BY first_name, last_name, phone_number
LIMIT :limit OFFSET :offset


