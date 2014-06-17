###Javascript and jQuery

####5/26/14

Reviewing POST and GET - use GET with pagentation;
forms almost always use POST;
when putting PHP in HTML, JS prefers to have it at the top; don't leave white space beteen php and html headers b/c it'll effect the headers

###Javascript
Javascript - happens inside the browser
dynamically typed language; object oriented langauge - everything is an object
nodeJS - new fad - allows you to run javascript like ______

interactive HTML5 - talking about javascript, PHP, HMTL together
robby leonardi - really cool interactive resume
arduino - cheaper on internet than at radio shack can be used to feed koi - cheap and programmable in Javascript (used to work with C) - check make magazine/maker community

mobile apps - using Javascript - like titanium and phonegap using javascript and html

browser and game engines are being written in javascript and html

Main thing to know is that Java and Javascript are not related (lol)

Ecma - design crew that votes on things (sounds like MLA)
gs5.github.io

javascript: the good parts - doug crockford

using javascript in the web browser console -

five data types in javascript - bool, num, string, undefined, and null

complex type - object
special object type - function, array

var value = 'codeup'; - don't use dollarsigns;
var group = 'codeup', cohort = 'badlands'; // can define multiple variables at one time on one line
debate on using semi colons at the end of the line in javascript - javascript will run without using the semicolon, so it's not really needed
if the semicolor doesn't exists, and we get an error, try it again with a semicolon, and it'll prob work but it'll be slower - JS suggests using semicolons at the end of the line.  DO IT.

variables are mutable - we can change the type and change the value;

typeof group; // give the type of the variable stored (bool, num, string, undef, null)
const pi = 3.14;
constants = immutable - like pi 
javascript will not give an error message when you try to set a constant;
null - a value that contains nothing;
undefined - not null, not string, not an object; undefined is what a variable is before it's been given a value

can do var codeup; codeup == undefined; -> true

code comments - // in console, single line
/* comments <3 */ for multi line comments

var n = null;
n; // null
typeof n; //"object" - has to do with object oriented language
typeof doSomething = function () {};
typeof doSomething; // returns function;

Javascript these return as false:
false, null, , 0, '' and "", 

undefined, NaN (special constant for not-a-number) // not acutally evaluating to true or false

Other values will return true

logical operators - &&, ||, !
In JavaScript, the basic logical operators ordered from HIGH to LOW precedence are as follows:
NOT is evaluated before
AND, which is evaluated before
OR
use parenthesis for grouping
don't use double negatives, but only see double negation when trying to cast to a bool (!!var)


####5/27/14
notes got lost b/c macs don't always just work :(

####5/28/14
review - Javascript functions
overloading not allowed in PHP and JavaScript
functions in Javascript are treated as first class
dialogue (dialog?) with alert/confirm/prompt


Variable scope - 
global variables - variable that are declared outside of the function (the scope in PHP says variables declared outside of the function are not in the same scope)
the variable will get attributes of its parent object?  windows?

"javascript is the cockroach of the internet.  you just can't kill it"

local variables - variables inside the function can be seen inside the function but not outside, globals can be seen anywhere

can change value of global variable in a function

hoisting - Javascript -
var globalVar = 'global';
brings the variable up to the top of the function; hoisting overrides the parameter passed (if you pass the same parameter)
if variables have errors saying undefined, it' probably being hoisted from inside the function
sayHello();
sayHello2();

function sayHello() { // won't have hoisting
alert('hello');
}
var sayHello2 = function(){ // anon function, subject to hoisiting
alert('hello2');
}
two ways to declare a function
hoisting moves the variable declaration to the top but it makes it undefined
best practice - declare variables at the top of the function.  still going to have to declare vars inside the fuctions, but just put everything you can at the top

use var keyword when creating variables, don't use var when reassigning it, (unless you're redeclaring it inside a function, maybe?)

[you hang up first
no you hang up first]

**Self Invoking function (Immediatly Invoked function expressions IIFE)**
wrap the anon function in parenthesis and add () at the end of the function
(function() {
alert('hello');
})();

don't need to add an extra call at the bottom. happens as soon as the page loads; could use to call a library
JS uses it to wrap other code

#####Arrays
in javascript everything is an object

**var shapes = ['square', 'rectangle', 'circle', 'triangle'];**

**var emptyArray = new Array();**
can run methods on it
console.log(shapes.length);//number of items in array // zero key
can do console.log(shapes[]); // and it'll list the whole array
PHP is unique in that it can be associative arrays or indexed arrays, but javascript doesn't work that way
other languages use lists, hashes, dictionaries
in Javascript if we wanted to do the associative array stuff you have to make it an object

console.log(shapes[1] + ' ' + shapes[2]);
splicing will remove items from the arrray

For loops with arrays
for (var i = 0; i < shapes.length; i++) {
	console.log('the shape at index ' + i + ' is: ' + shapes[i]);
} // very interesting

new - **foreach**
if you're writing code in browsers that are only going to be using the big major browsers, then use it, but if it's gonna be on older browsers, don't use it yet (it'll break in IE8)

shapes.forEach(function (element, index, array)) {
console.log('The shape at index ' + index + ' is: ' + element);
}

#####Manipulating arrays

push - users.push("thomas"); adds at the end
unshift - users.unshift("michael"); adds at the beginning of the array
pop - users.pop(); takes the last one off and returns back the removed element
shift - users.shift(); removes from the front of the array and returns the removed element

var index = users.indexOf(''); // searches the array for the matching element and returns the location; if the element doesn't exist it returns -1

"i was imagining facebook putting out a javascript array of all of its users."
"stack overflow"
"yes"

**splice** - removes a specific element from the array
returns removed item

removed = colors.splice(colors.indexOf('green'), 1)
console.log(removed) // ['green']

function fireSomebody(who) {
	var index = users.indexOf(who);

	if(index != -1) {
	users.splice(index, 1); // if you change 1 to two or three, it'll take off the elements that come after it
	
	}
	fireSomebody('chris');
}
users.splice(index, 0); doesn't remove anything
if the number to remove is larger than the number of items proceeding the element to be removed, it won't throw an error. it will remove what it can and keep going

*add**
function addBeforeSomebody(who, where)
users.splice(index, 0, who); third parameter allows you to add elements to the array, will add before the element you find; splice can take any number of parameters, so it can add multiple elements

**replace**
function replaceSombody(who, where)
var index = users.indexOf(where);
if(index != -1){
	users.splice(index, 1, who);
}

indexOf - searching from the first element to the last
lastIndexOf - searches from the last elemenet to the first

reverse - reverses the order of the array
users.sort().reverse();
can chain objects

**splitting**

namesString.split(','); PHP explode

var namesString = namesArray.join(','); PHP implode

###6/9/14
Javascript
BOM and DOM

Browser Object Model - entire window itself; things can get hazy b/c it's in a window instead of a tab

DOM - Document object model - everything inside the frame
BOM- window object- parent
doc is another object we can use to access ____
node - and element can be used interchangably; any piece of HTML code that can be used as a single entity; any html tag is an element or node

<b>getelementbyid</b>
document.getElementById(string)(document is everything rendered out as html in the browser)
document.getElementById('first_user');
var first_user_node=document.getElementById('first_user');
typeof first_user_node "object"

document.getElementsByClassName() // make sure it elements is plural - b/c we can have more than one item per class, can get back array of items
used for getting access to html document from within our javascript; even if there is only one item, it'll be returned as an array; classname will always be an array, ID will not be an array

getElementsByTagName() // must be plural (li);
var first_user = document.getElementById("first_user");
first_user; //<(li class='odd' data-userid='1' id='first_user'>BB</li>)
first_user.innerHTML = 'MG';//changes the first_user
the HTML source has not changed, but the source code does; hit refresh and it all goes back.

<b>first_user.innerText(string);</b> took the literal string and put it in there as text
first_user.innerHTML = "";replaces everything not just the string

var user_list = document.getElementById('users');
append things to the parent - document.createElement('li')
var newItem = document.getElementById('users'); newItem.innerHTML = "BB";
document.getElementById('users').appendChild(newItem);

var users_list = document.getElementById('users');
users_list // displays list
users_list.removeChild(last_item); // removes child and returns it as a variable (so it can be set to something)

attributes - whatever is inside the html tags - href, id
link.attributes; // give back a bunch of stuff
link.attributes['href']; // href="http://www.codeup.com"
link.attributes.href; // same thing

link.attributes['href'].value // ?

plan b: styles

var bodyElement = document.getElementByTagName('body');
bodyElement['0'];
bodyElement['0'].style['background-color'] = '#fff';
document.getElementById[]

var oddItems = document.getElementsByClassName('odd');

for (var i = 0; i < oddItems.length; i++) {
	oddItems[i].style['background-color'] = '#aaa';
	} // this allows us to manipulate client side; might want to do that in javascript while on the back end send off to the server to do the same thing
data-userid attribute - when we get into doing valid html, there are only a certain amount of attributes that can be assigned (can't make up random stuff?) if we imagine that this list of users came back from a database and javascript might want to know the username/userid w/o the user seeing it.  use <b>data-</b> to add some arbitrary value.

document.forms //returns an array with all forms on the page
document.forms['user_form'];
document.forms['user_form']['first_name'].value; // goes inside the array of form to pull from the form in javascript

document.forms['user_form']//

big thing is getElementById
	
var mainHeader = document.getElementById('subh-header');	
mainheader.innerHTML = 'Javascript is cool';	
subHeader.style['color'] = "blue";

var listItems = document.getElementsByTagName('li') {
	for (var i = 0; i < listItems.length; i++) {
		if(i % 2 == 1) {
			listItems[i].style['color'] = "grey";	
		
}
var dbId = listItems[i].attributes['data-dbid'].value;
if(dbId == "1") {
	listItems[i].style['color'] = "blue";
}
}

var subParagraphs = document.getElementsByClassName('sub-paragraph');
subParagraphs[0].innerHTML = "Mission Accomplished";

cannot use a for each loop over an array
technically it's a node list

target.addEventListener(type, listener[, useCapture]);
Events can be registered on the window, document, or on an element. The object that an event listener is registered on is called the target. To register an event listener on a target, the addEventListener method can be used.

https://developer.mozilla.org/en-US/docs/Web/API/EventTarget.addEventListener

We have talked a little about event targets, now let's talk about even types. There are tons of options available. Here are a few common events:

keyup (key is released)
click (mouse is clicked)
change (input loses focus after it has been modified)
submit (form is submitted)
A complete event reference can be found here:

https://developer.mozilla.org/en-US/docs/Web/Reference/Events

<button id="btn1">Click Me!</button>
   <script>

       // create a handler function
       var listener = function (event) {
           alert('You clicked the button!');
       }

       // register the listener to handle clicks on btn1
       document.getElementById('btn1').addEventListener('click', listener, false);

   </script>
   
   
   
   var intervalId = setInterval(function() {
	   if (count >= max) {
		   clearInterval(intervalId);
		   console.log("All done");
   } else {
	   count++;
	   console.log("Repeating this line " + count);
   }
	   }, interval);
	   
	   
###6/10/14
DOM - everything from the address bar down
BOM - history, time outs, browser state

based upon how the user interacts with the site different events happen
events are about resonding to things and creating a response
need something to bind the event to - 
var fNameInput = document.getElementById('first_name');
var handler = function(e) {
	console.log("event type: " + e.type;
	
}	   
fNameInput.addEventListener("click", handler);


events we can bind to:

click
mouse down // when you press down on the mouse
mouse up // when you let go

change
keydown
keyup
focus
blur
submit // only forms
change

mouseenter
mouseleave

no hover event - triggered on whether the user has entered ot exited the 

focus - when user has entered the box
blur - when user has left the box
can do a lot of different click or key handlers

remove event handlers - we have to specify what we want to remove
anon functions - assign to variable and can remove it


var deleteAllUsers = function() {

}

don't use span to make an event that looks like a link when its not.
<a href

avoid single letter variable but use e is ok. for loops are ok. event listeners are ok with e.

e.preventDefault() // tells the browser not to do whatever it is supposed to do to not do it
	   
bubbling and capturing
bubling works from the inside out, and capture works from the outside in



document.getElementById("level 3").addEventListener() {
}	   


var changeHeader = function() {
var mainheader = document.getElementById('main-header');
mainheader.innerhtml = 'javscript is cool.";

btn1.addEventListener('click', changeHeader)
var changeHeader() function() {
var subheader = document.getElementById('sub-header');
subheader.style['color'] = "blue";
}

var numberPrimitive = 1;
var numberObject = new Number(1);

console.log(typeof numberPrimitive);           // number
console.log(typeof numberObject);              // object
console.log(numberPrimitive === numberObject); // false (values are equal, types are different)

Primitive Type	Object
boolean			Boolean
number			Number
string			String

var car = {}; // creates a new object
car.make = "toyota";	
	car['make']= "toyota";
	
car.is_awesome = true;
car.color = "black";
	
	
getting properties out of class
car.make[]// not the same as php

_______________

in this function; 'this' can refer to either the window or the stuff inside the function/method;can use window binding? to fix it
if youre doing front end validation, that doesnt override backend validation.  always do back end validation


####JSON - JavaScript Object Notation
API - application programming interfaces

a way to describe an object in javascript

{
    "name1": "value1",
    "name2": "value2",
	"object": {},
	"array": [],
	"boolean": true,
	"null": null		
}
//use double quotes for JSON
var person = {
	"firstName":"C",
	"lastName": 'T',
	"sayHello": function() {
		alert("Hello from " + this.firstName + " " + lastName);
	},
	somethingElse:
	} // javascript cares about extra commas
	
	
	{
	    "stringProp": "stringValue",
	    "numberProp": 1,
	    "objectProp": {
	        "prop": "console log me!"
	    },
	    "arrayProp" : ['console log me too', 'item2'],
	    "arrayOfObjectsProp" : [
	        {
	            "prop": "value"
	        },
	        {
	            "prop": "console log this" 
	        }
	    ],
	    "boolProp"  : true,
	    "nullProp"  : null
	}
	
	console.log(testJson.objectProp.prop);
	console.log(testJson.arrayProp[0]);
	console.log(testJson.arrayOfObjectsProp[1].prop);
	
	testJson.arrayOfObjectsProp.forEach(function(item)) {
		console.log(test.prop);
	}
	
	
no such thing as an associate array in javascript - it's an object
in php an array of books an be associative

<?php
$phpBooks = [
	["title"=>"fox in socks"
	"author"=>[
		"firstName"=> "dr.",
		"lastName"=> "Suess"
		]
	]
]	
?>
<script>
var books = <?= json_encode($phpBooks); ?>;
books.forEach(function (book, index) {
	console.log("Book #" + (index + 1));
	console.log("Title: " + book.title);
	console.log("Author: " + book.author.firstName + " " + book.author.lastName);
	console.log("---");
});

associative arrays in php is converted to objects in json

add var books = <?= json_encode($phpBooks, JSON_PRETTY_PRINT); ?>; // this makes the formatting in the console code is better
can use json_decode - php will convert them to standard objects instead of associative array
json_decode($encoded, true) will return the decoded as an array instead of standard object


####Math object is static

// Returns a random integer between min and max.
function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

The Math.round() function returns the value of a number rounded to the nearest integer.

The Math.floor() function returns the largest integer less than or equal to a number.

The Math.ceil() function returns the smallest integer greater than or equal to a number.

The Math.pow() function returns the base to the exponent power, that is, baseexponent.

The Math.sqrt() function returns the square root of a number.

Math.E
According to the documentation:

The Math.E property represents the base of natural logarithms, e, approximately 2.718.
Math.PI
According to the documentation:

The Math.PI property represents the ratio of the circumference of a circle to its diameter, approximately 3.14159.

yes you can extend the functionality in javascript, like if you wanted to add more math functions

this.radius - use this

###6/11/14
check out canvas element in javascript to have the circle show on the screen

##date object##
Creates a JavaScript Date instance that represents a single moment in time. Date objects are based on a time value that is the number of milliseconds since 1 January, 1970 UTC.
UNIX epoc time
UTC/GMT - six hr diff.  most servers are on UTC.

// get a date object that represents the current date/time
var today = new Date();

// create a date object based on a specific date/time
// notice that month is zero based in non-string constructors
var codeup = new Date("February 4, 2014 09:00:00");
var codeup = new Date("2014-02-04T09:00:00");
var codeup = new Date(2014, 1, 4);
var codeup = new Date(2014, 1, 4, 9, 0, 0);
javascript dates are zero based only for the month

The Date.now() method returns the number of milliseconds elapsed since 1 January 1970 00:00:00 UTC.

vanilla-js.c

going to go into jquery

###Jquery
John Resig created a selector that works in all browsers
one command to ask for selector, so wrote a library to query the DOM and return results
sizzle - separated selector eng
firefox hired Resig to work for them even though it's free
the con academy - math website - 

 jQuery 1.x - The current recommended version
- jQuery 2.x - Newest version, has same API as 1.x, but no support for IE 6, 7, or 8

$ is the same object as the jquery object. can run jquery in non-conflict mode
make sure the DOM has been built before running javascript

window.onload = function() {
    alert( 'The page has finished loading!' );
} // will wait for the images too load too, not just HTML

use this instead
$(document).ready(function() {
    alert( 'The DOM has finished loading!' );
});// this is really common; a lot of jquery will be wrapped in this function
will also see ppl not doing this and just putting this stuff at the bottom of the file so it loads last
prefernce for JS is using document.ready

_________

using jQuery
events
$('#btnTest').dbclick(function() {
	$('#page-heading').css('color', 'blue');
	var color = $('#page-heading) ...
}

.hover() takes two functions that can do that
$( selector ).hover( handlerIn, handlerOut )
$(#btnTest').hover(function () {
$('#page-heading').css('color', 'blue'):
} function () {

}

$('#btnTest').hover(hoverIn,hoverOut);
if you leave the second function empty, it'll stay how you had it
can pass mouseenter or mouseleave separately

$(this).css('background-color'), '#f10');

$('document').ready(function() {
    $('#codeup').hover(
        function() {
            $(this).css('background-color', '#FF0');
        },
        function() {
            $(this).css('background-color', '#FFF');
        }
    );
});

- .keydown() — Bind an event handler to the "keydown" JavaScript event or trigger that event on an element.
- .keypress() — Bind an event handler to the "keypress" JavaScript event or trigger that event on an element.
- .keyup() — Bind an event handler to the "keyup" JavaScript event or trigger that event on an element.

keypress()

Bind an event handler to the "keypress" JavaScript event or trigger that event on an element.
The keypress event is sent to an element when the browser registers keyboard input. This is similar to the keydown event, except that modifier and non-printing keys, such as Shift, Esc, and delete, trigger keydown events but not keypress events

$('#numberList').on('click', 'li', function ()
$this.css('color', 'blue');}
)(I think)

after class review:

numeral.js

####jQuery (whoo)
9m  

check out javascript keycodes

if you using canvas, make sure you check to see if you need to clear the canvas

konami code easter eggs
cornify - unicorns and rainbows

example of window-js.html

adding document.ready
var timeoutId = null;
function save(){
alert('saved')
};
function autosave() {
clearInterval(timeoutId);
timeoutId = setTimeout(function(){
	save();
	}, 5000);
};
$('#important').on('keyup', autosave);

"if there is anything jquery is good at, it's selecting things and manipulating things... in the DOM."

.html() is getter and a setter
Get the HTML contents of the first element in the set of matched elements or set the HTML contents of every matched element.
http://api.jquery.com/html/

could do
$(document).ready(function(){
$('#baddies').click(function()
	var h1 = $(#baddies).html()
	console.log(h1);
	alert(h1);
	});
});
);

better to do
var h1 = $(this).html();

take it one step farther
**alert($(this).html());**

change
.html() to .text() lets you get and set text inside a selected element

jesse pinkman reference

can use a getter, setter, getter
altering the .css - it's widely used; gets the value of the property or it sets the value; epmty, it gets, passed sets

event.preventDefaul(); - stops it from doing whatever it was going to do

click a link and high light the important parts - this could be useful >_>

can do <style> .hightlighted add a bunch of style </style> then do $('.class').addClass('highlighted');

debugging - id - no spaces - white space in ids will fsu.

toggle -  .toggleClass() — Add or remove one or more classes from each element in the set of matched elements, depending on either the class’ presence or the value of the switch argument. (use it with a link and yes) spoilers, question and answer, flashcards
<a href="#" id="highlighted-important"> Click</a> 

The traversing methods covered in this unit:
- .each() — Iterate over a jQuery object, executing a function for each matched element.
- .first() — Reduce the set of matched elements to the first in the set.
- .last() — Reduce the set of matched elements to the final one in the set.
- .parent() — Get the parent of each element in the current set of matched elements, optionally filtered by a selector.
- .children() — Get the children of each element in the set of matched elements, optionally filtered by a selector.


$('li').css('background-color', '#CCC');
$('li').each(function(index) {
	//$('li').css('background-color', '#CCC');->
-> $(this).css('background-color', '#CCC');

$('li').each(function(index) {
	$(this).css('background-color', '#CCC');
	
	
$('li').first().css('background-color');
$('li').last().css(' '' );

jquery objects are elements and vice versa	

sass - css preprocessor - zephyer - used in php, phalcon,

____
resume writing for tech

free lance web designer/developer
put whenever you started

______

traversing highlights the chaining in jquery


API - Appliation programming interface?
write own API so ppl can use your software

effects 
Using Basic Effects
jQuery offers these basic effects:
- .hide() — Hide the matched elements.
- .show() — Display the matched elements.
- .toggle() — Display or hide the matched elements.

While these effects do not offer animation, they can be useful for manipulating the visible elements on a page.	

toggle - just goes between hide and show

- .fadeIn() — Display the matched elements by fading them to opaque.
- .fadeOut() — Hide the matched elements by fading them to transparent.
- .fadeToggle() — Display or hide the matched elements by animating their opacity.

The syntax for fading elements is identical to their basic counterparts; the only difference is the method name called. Additional options allow for further customization; however, we will not be covering them in this course.

- .slideUp() — Hide the matched elements with a sliding motion.
- .slideDown() — Display the matched elements with a sliding motion.
- .slideToggle() — Display or hide the matched elements with a sliding motion.

.slide() -> .slideUp(time, function() {
	$(this).slideDown();
	
	$(this).next().slideUp().slideDown(); // jquery is waiting naturall, but could pass parameters like in the previous example
	
###6/13/14

pomadore app? - keep track of work time?
stashing in github
breadth before death - front end
death before breadth - back end	
mistakes made during questions- not asking the right questions, and thinking it's all about getting the right answer


reflect and share: had fun with whack-a-mole;
frustrated with whack-a-mole;
future ideas for whack-a-mole: increase speed and have chained theme for each round, have the background/mole image change through level progression, load different css files for different themes;
maybe need php for random css files to load	

###6/16/14
ideas with WaM:
to get and keep high score: make an array, take the last value of the array and compare it to an existing array of values;

make a reset game function which would reset game variables to zero but keep just highest score
could save in a database once we get to mysql later this week

jquery 2 doesn't go back for older browsers (not bakcwards compatible)

can maybe use localStorage to save stuff like score, prefs.


###6/16/14
setInterval(function() {}, time);
	loop; executes the loop at the specified time (parameter)
setInterval(some_function, time); 

setTimeout(function() {}, time);
	set Timeout(some_function, time);
	not a loop; it just waits and does it once
		
		