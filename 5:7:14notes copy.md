5/7/14

#php - 
###heredoc nowdoc
$poem = <<<POEM
There was a young man of Japan
Whose limericks never would scan.
When asked why this was,
He replied "It's because
I always try to fit as many syllables into the last line as ever I possibly can.
POEM; (must be on new line to close the herenow

<<< can be caps or lowercase - will work either way
caps just makes it stand out more
can use var inside to have var interpolation

define(ALL CAPS, value); (you can put it in lowercase but BP is caps) - define can't be used in line in a string, can only be used with concat with string


define('MY_NAME', 'Ben');
define(MY_NAME, 'Batschelet');
echo MY_NAME; -> Ben
echo Ben; -> Batschelet

arrays -composites of data types, not scalar
scalar?  simple?  something with echo?
scalar vs primitive data types

data types/subtypes:
scalar is boolean, integer, float, string
compound - array, object
special - resource, null

print_r($name);
$my_name = array('Ben', 'Batschelet'); (older syntax - anything less than php 5.4)
$my_name = ['Ben', 'Batschelet']; - - both are acceptable syntax; backwards compat
numeric arrays - $variable[index]
use single quotes in arrays
$my_name = ['first' => 'John', 'last' => 'Doe']; (how to declare/define an associative array)

###multi-dimensional array 
$user = array('name' => array('first' => 'John', 'last' => 'Doe'));
print_r ($user['name']['first']);
______________________________
###static vs. dynamic
php dynamically typed language
don't complile with php
compilation (manual step) happens before you run the code - looks at source code and then interprets it and complies it
interpreted lang like php - in the browser - it'll have the source code, but web server interprets it and then produces a result


arrays again - $todos[0] = 'get groceries'; (replaced in the array)
echo $todos[1]; - print just the single entry as specified in the index

php returns the associative array in the order it was input/defined by the index; index (numeric or key value store) arrays will always return in numeric order

thinking of multidimensional arrays - table with rows and collums
$rows = array (
array(1,2,3,4),
array(5,6,7,8),
array(9,10,11,12)
);
$rows = [ 
[1,2,3,4],
[5,6,7,8],
[9,10,11,12]
];

accessing multi dem array - looking for 7;
echo $rows[1][2];

$rows = [1 => ['a' => 1, 'b' => 2, 'c' => 3, 'd' =>4],
[2 => 'a' => 5, 'b' => 6, 'c' => 7, 'd' => 8]etc];
echo $rows ['1']['b'];

echo $rows['3']['d'];

###assigning the reference of the variable x into y
$some_number = 5;
php > $another_number = &$some_number;
php > echo $another_number;
5
so whatever is in x is going to be in y
pass by reference and pass by value(making an alias that points to another var) (don't worry about it right now)
key thing seems to be that when the assignment happens of y based on x, when x changes y stays the same.  doesn't updated when changes happen.  when using assignment by reference is used, it DOES update and change instead of staying fixed

##5/8/14

###takeaway from type casting - we're really bad at assuming what the computer is going to do.  languages cast differently and so yea.

Incrementing/decrementing
$a == $b	Equal	TRUE if $a is equal to $b after type juggling.
$a === $b	Identical	TRUE if $a is equal to $b, and they are of the same type.
$a != $b	Not equal	TRUE if $a is not equal to $b after type juggling.

++$a	Pre-increment	Increments $a by one, then returns $a. (will never return original value, will only return next value)
$a++	Post-increment	Returns $a, then increments $a by one.
--$a	Pre-decrement	Decrements $a by one, then returns $a.
$a--	Post-decrement	Returns $a, then decrements $a by one.

####takeaways from incrementing- a) don't do more than one thing at a time; don't echo and increment/decrement at the same time, and b) possibly something about not being an asshole - edit: if you see other people doing it you will hate them

####logical operators: and, ||, !, &&,
xor - exclusive or - one or the other but not both;
|| - inclusive or - one or the other or both true;
&& has operator precedence over ||
_______________________________
github - 'add' is staging


###5/9/14
textmate - code editor like sublime - has a built in markdown previewer
.md - markdown - # - heading, ## - subheading, 
textmate - to see preview of .md use 'command, control, option, and p'


####ternary operator
handles if/else ?:
[ condition ] ? [value if true]: [value if false];

$age = 29;
$can_see_diehard = ($my_age >= 18) ? "yes" : "no, try Disney";


CT sets up git exercises repo for demo

while and do while loops

### 5/12/14

#####PHP CLI SAPI
PHP Command Line Interface (CLI) Server Application Programming Interface (SAPI), input/output (IO) streaming
STDIN - input from user (keyboard, barcode scanner)
STDOUT - output responses(monitor, printer)
STDERR - output errors(monitor, or a log file)
resources - a connection back to the computer (hardware)

fwrite - formatted write; gets to supply a resource to write out to (standard output, where i want it to echo -> monitor)
fgets - always going to return a string; get it from standard input (keyboard)

______

 
argv - argument v(borrowed from C); array of all the values passed to PHP
arg c - argument count
handles inputs like an array

for loop:
for([start value]; [test]; [incrementer/decrememter]){
	[code]
}


###5/13/14

review STDIN/STDOUT
echo will go STDOUT

use trim to remove whitespace at the front and end of string input - "enter" or newline char from input with fgets
$name = trim(fgets(STDIN));

vagrant ssh vagrant up - vagrant is the command, ssh up are arguments
self documenting code - variables that you can read and make sense of it
for loops - a lot of them have single letter variables

______
fputs - alias of fwrite (prob created for naming consistency; makes more sense with fgets and fputs)

when using commandline and argc, argv, put input in "" to make a string become one argument

#### for each
foreach (______ as ______){}
$numbers = array(1,2,3,4,5);
foreach ($numbers as $values){
	echo "\$number has a value of {$value}\n";}
use fuction count to give back number of items in the array
count($numbers) -> 5 items in the array
for ($i = 0; $i < count($numbers); $i ++) // do less than count when starting at 0 b/c the first item in the array starts at zero and it'll be off by one if you set it <= to count

for (){
	$todo = $todos[$i];
} so first todo is a, then todo is b, then todo is c, then the loop will stop b/c it's less than the count

foreach ($todos as $todo){
	echo $todo . PHP_EOL;}
	
may be times where you want to use the longer format; location and value in the array; or if you wanted to loop through and get every other value, or get to a certain offset and skip some; but foreach has an auto increment of 1;
the variable inside the foreach only exists inside the foreach loop
	
to display an array - use print_r; implode(); or var_dump;


foreach (array_expression as $key => $value) {
    statement
}
assign key value "key" => "value"

echo count($value) . "items are at key $key\n";

$things = [
	"one" => [ "A" => "A1", "B" => "B1", "C" => "C1"]]
	foreach ($things as $keys => $value)
		echo $key . "has an A value of " . $value["A"] . PHP_EOL;
	
echo ($key + 1) . 

### 5/14/14
unset($fruits[0]);
unset ($fruits[1]); - how to remove from an array; leave keys the same - doesn't reorder them (other items in the array have the same index/key number)
when using count() in the for loop, and using unset() to remove part of the array, it won't count all of the array and display the later values in the array

use isset() to check that an item in an array has been set to some value

#####break/continue
break - exits the loop; use break 2, break 3, to have it break out of multiple loops
continue - go back to the beginning of the loop and don't do anything else

goto - goes to a specified point in the program; problematic, but is used for multiple breaks


	`switch (variable) {
	    case 'value':
	        # code...
	        break;
    default:
        # code...
        break;
}

switch - makes it easier to not make mistakes, and easier to read.  makes code DRY
use when switch(single variable condition) - can't use switch with multiple parts in the condition
if you don't use the break the switch will just let everything fall through instead of catching on the condition; once the switch finds a true case, it'll do everything else below it too.

javascript: the good parts - doug prockford (sp?)
jslint jslent? - program to tell you what you could have done better
*never use a switch without breaks* unless Ben
ruby doesn't fall through; php and javascrip come from C so they have fall through;
________

functions that send back array - sometime the function might return back something that's not part of the array (like false)

can't foreach over something that isn't an array
check it - if(is_array($fruits)){foreach($fruits as $fruit => $details)}

when to use switch fall through - 

```switch($i % 2){ 
	case 1:
	echo "this is odd: ";
	default:
	echo "$i\n";
}```

i don't know/understand how this works or why it works or why fall through is important here??

so our vagrant boxes have a system timezone setting already set so we won't get an error message
date_default_timezone_set() is what tells php to check the computer's date and time so it can output the date and local time
N - outputs a number for the day of the week
D - a shortened form of the day of the week (Mon, Sun)


### 5/15/14
#####functions

use rtrim to remove whitespace from the end of the string
use ltrim to remove whitespace from the beginning of the string

procedural code - the code that starts at the top and executes step by step like a procedure

functions - variables in the function only exist inside the function.  b/c scope.  cannot be referenced outside the function, but also, variables declared out side the function cannot be refered to inside the function

richard feynman - manhattan project, physics - known for lectures - won NP - when asked where great theoretical physics is in the waste basket

is_int - checks if the input is an integer
is_float - checks for floats
is_numeric - checks for numbers or numeric string
__________
return - used in functions only
return exits the function
flexability with using return/echo
side effects - a function that does two things (returns a value and echo); try to avoid echoing inside functions; side effects are sometimes OK and nec, but yea.
don't really want to return null - the computer does it already
return only makes the value from inside the function acessible outside the function; doesn't actually display the returned value - so still use echo outside the function to get the variable values

function numeric_check($a, $b, $dividing = false) - why this works - the third parameter is a 'default' - meaning, by default, $dividing is going to be false, but in the one or two or three rare cases that it is true, those are the *exceptions* not the default case.  so 'setting a default' really means setting an exception

###5/16/14

sleep(1) - creates a pause in the display of the code here it's one second (that's kinda cool);

can use a function w/o passing perameters

built in functions BB uses alot - isset() and empty()
note on not using echo in the function - it seems to be happening left and right so don't worry about it -_-

using true/false with isset() counts as setting
setting a var to NULL will return a false (it's not set)
empty() will be true for NULL

setting the variable to 0 or false will return a true empty; - BB claims edge case, makes logical sense to me
to minimize edge cases, make it more precise/specific

if (isset($name['title']) && $name['title'] != '')
some ppl argue empty is not precise enough
just be careful when working with integers

don't need to set internal functions like isset() or empty() == true/false b/c it's automatically going to return a value when it is used


#####using serialize
var_dump(serialize($array) - gives count of characters in each string and key; cool and weird; handy if want to save complex data types and save it to a file, unserialize() it, and use it; serialize is a way of converting arrays to strings; only works with PHP, doesn't work with other langauges :/
$serial = serialzie($array);
$clone = unserialize($serial);

short circiting with if statements - nandake...

________
default peremeters come at the end of the function declaration
function do_something($do, $something = false){}

#### 5/18/14

$theCard = str_split($card); // This function (str_split()) takes a string and separates it into an array of characters. can specify the split string length, like if you want it split ever one or two characters


#### 5/19/14
#####sorting in PHP
$princesses = array( bunch of adventure time stuff)
print_r($princesses);
sort($princesses);
print_r($princesses);
$princesses = sort($princesses); // doesn't work that way

sorts alphabetically

*sorts alphanumerically with capital letters first, lower case, then numbers*

when looking at the docs and defs for functions, the square brackets mean that it's an optional parameter, you don't have to pass it that variable

anything that starts with an r sorts in reverse

#####($princesses, sort_natural|sort_flag_case) - sorts strings case insensitively (use single pipe (bitwise or))
**can use natcasesort() instead of asort($array, sort_natural | sort_flag_case) and the array will retain its original key values**

ucfirst() will uppercase only the first letter of a string passed through

ucwords() uppercase every first chraracter of every word in a string

sort() will eliminate associated keys and replace them with numeric keys

asort() - associative array sort; still orders by the value
ksort() - does it by the key

**sorting will not return a new array, it just sorts the array in place, so don't set it to a new variable**

if you use asort on an array that isn't an associative array, it will print_r in alphabetical order but the key number will be the numeric key of when it was assigned in the array
do ksort will keep keys on numerically indexed array

shuffle(); shuffle kills keys :/

ordered entered - sort by keys and keeping keys

$index = array_search('hotdog princess', $princesses);
always returns index location or false if not found

"it didn't lie to us.  i like it when code tells the truth" BB

when seaching for something in in an array_search() that isn't there it returns false

if(array_search)('princess bubblegum', $princesses);
echo "i found bubblegum";

and bubblegum is at index[0], it will return zero, which evaluates to false

if(array_search('princess bubblegum', $princesses) != false) // doesn't work, tests the value, not the type, need to use === for strict comparison, so !==
------------

when looking at PHP docs and you see an &, it changes the data type (changing an array to a bool)
php docs say array_search returns mixed - means doens't nec mean it returns one type - it could be false, if it wasn't found, but if it was, it finds the key of where it was found, which is an integer

second part of search_arrays.php exercise

stub - write something that is like a placeholder for testing, doesn't do everything we need it to do.

function template - 

function array_common_count($array1, $array2) {
	return 0;
} // need to be doing loop, use a foreach w/ array
	//do the loop through one of the arrays and increment the count and return count
	use first function inside this function
var_dump(array_common_count($names, $compare)); 

didn't get exercise working - moving on anyway;

#####push, pop, shift, unshift

array_push($array, thing you want added) - &(assigning by reference) push one or more elements onto the END of the array and returns the new length of the new array

array_pop()& - returns the last value of the array; pops the element off the end of the array; returns what was popped off

array_shift() - shifting the element off the begining of the array (takes the key with it)

array_unshift() - prepend on or more elements to the begninning of an array
**doesn't return a new array, so don't set it to a new variable**

stack - stack of papers- when you put things on the stack, the next thing goes on the top.  the top of the stack is the end of the array(push) and pop something, so the way it works is the last thing in is the firstthing out

cheque - take a number system - first in, first out, add things to the end and remove things at the begninning;


####5/20/14

reviewing array_search, pop, shift, unshift
reviewing return in functions

return in a function - gives the option of doing something with the value or echoing the value later

everything is going to live inside of functions later;

using explode()
$array = explode('delimiter', $string);
remember that often following a comma in a series there is a space, so check delimiter to see whether it should include comma space

using implode()
$string = implode('glue', $array);
__________________

#####reading files

read only opening a file
$handle = fopen($filename, 'r');

$fileSize = filesize($filename);

$princessString = fread($handle, $fileSize); // $filesize tells it how much to read, so if you passed it 5 instead of $filesize, it would only read 5 characters/bytes; always returns strings (text)

delimiter for text list is a new line character, so
$princesses = explode("\n", $princessesString)
$princessString = trim(fread($handle,$filesize));

total code looks like:
$filename = 'princesses.txt';
$filesize = filesize($filename);
$read = fopen($filename, 'r');
$princessString = trim(fread($handle, $filesize));
$princesses = explode("\n", $princessString);
$hots = array_rand($princesses);
$result = "string {$princesses[$hots]}";
//echo $results;
fwrite(STDOUT, $result);
//fclose($read);
$write = fopen('hots.txt', 'w');// 'w' deletes the contents of the file, then writes over it
$write = fopen('hots.txt', 'a'); // adds to
fwrite = ($write, $result);
fclose($write); 

// best practice to close filehandles at the end of the code.

$filename = absolute path //this has something to do with vagrant vs mac
$filename = '/vagrant/exercises/princesses.txt';
$filename = '../exercises/princesses.txt';

save changes

**ok so writing to files was not part of today's lesson.  LOL**

going back to 
$filename = 'princesses.txt';
$filesize = filesize($filename);
$read = fopen($filename, 'r');
$princessString = trim(fread($read, $filesize));
$princesses = explode("\n", $princessString);
$hots = array_rand($princesses);
$result = "string {$princesses[$hots]}";
echo $results;
fclose($read);

$princessString = trim(fread($read, filesize($filename)));

####5/21/14

$filename = 'princess.txt';
$filename = '../notes/princess.txt';
absolute path '/vagrant/notes/princess.txt';

echo _ _FILE_ _ . PHP_EOL;
echo _ _DIR_ _ . PHP_EOL; magic constants - bc they look like constants and act like constants but we can change it

is_readable($filename); - checks to see if the file exists and is readable; is it read only, write only, or somefiles that can't be read b/c it has passwords
put in header of an if statement and if it returns true, then it can open the file.  important b/c if i type in a file that doesn't exist or the wrong path then it'll return false

handle tells php what we are opening, what the permissions are that we set (read, write, append), and where we are in the file
pointer = finger running along the words in the file

feof($handle); - end of file; checks to see if it's at the end of the file - returns true;

$princessString = fread($handle, $fileSize);
$princessString = fread($handle, filesize($filename));
fclose($handle);

can do assignment inside of while loop heading
while(($string = fread($handle, $bytes)) && strlen($string) > 100)
echo string;
sleep(1);

while(!feof($handle)){
$string = fread($handle, $bytes);
echo $string;
sleep(1);
}
fclose($handle);

function readBytesAtATime ($filename, $bytes = 100){
	= } // dunno what this is doing
	$contents = '';
	if(is_readable($filename)) {
		$handle = fopen($filename, 'r');
		while(!feof($handle)){
		$string = fread($handle, $bytes);
		echo $string; (change to $contents .= fread($handle, $bytes);)
		sleep(1);
		}
		fclose($handle);
		} return $contents;
		
####file writing

'a' - append data to it (put it at the end)
'w - writes and overrides
'c' - puts pointer at the beginning of the file and writes there

we will use the w and a more than the others

fwrite(STDOUT, implode("\n", $princess)) - has a new line char at the end of the file when it gets read

so don't put a new line at the beginning
do - 
foreach ($princesses as $princess){
	fwrite(STDOUT, $princess . PHP_EOL);
}
fwrite(STDOUT, implode("\n", $princesses) . "\n");

$handle = fopen('hots.log', 'a');
fwrite($handle, "The ice king as he hots for");
 open up a handle for reading and a handle for writing;
 
 **list of commands**
  
 'r' — Open for reading only; place the file pointer at the beginning of the file.
 'r+' — Open for reading and writing; place the file pointer at the beginning of the file.
 'w' — Open for writing only; place the file pointer at the beginning of the file and truncate the file to zero length. If the file does not exist, attempt to create it.
 'w+' — Open for reading and writing; place the file pointer at the beginning of the file and truncate the file to zero length. If the file does not exist, attempt to create it.
 'a' — Open for writing only; place the file pointer at the end of the file. If the file does not exist, attempt to create it.
 'a+' — Open for reading and writing; place the file pointer at the end of the file. If the file does not exist, attempt to create it.
 'x' — Create and open for writing only; place the file pointer at the beginning of the file. If the file already exists, the fopen() call will fail by returning FALSE and generating an error of level E_WARNING. If the file does not exist, attempt to create it. This is equivalent to specifying O_EXCL|O_CREAT flags for the underlying open(2) system call.
 'x+' — Create and open for reading and writing; otherwise it has the same behavior as 'x'.
 'c' — Open the file for writing only. If the file does not exist, it is created. If it exists, it is neither truncated (as opposed to 'w'), nor the call to this function fails (as is the case with 'x'). The file pointer is positioned on the beginning of the file. This may be useful if it's desired to get an advisory lock (see flock()) before attempting to modify the file, as using 'w' could truncate the file before the lock was obtained (if truncation is desired, ftruncate() can be used after the lock is requested).
 'c+' — Open the file for reading and writing; otherwise it has the same behavior as 'c'.

is_writeable/is_writable() - tells us whether or not a file exists and is able to be written to

________

CT - preference is small reuseable methods/functions
tiny ass little functions
function save_file($filename, $contents) {
$handle = fopen($filename, 'w');
fwrite($handle, $contents);
fclose($handle);
}
function open_file($filename){
$handle = fopen($filename, 'r');
$contents = fread($handle, filesize($filename));
fclose($handle);
}

can do
save_file($filename, implode "\n", $items);
