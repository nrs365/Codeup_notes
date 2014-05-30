###HTML & CSS

####HTML

#####5/21/14
HTML - HyperText Markup Language

elements - p - paragraph tags, h - header, etc
normal elments like <p> and void elements
normal - have tags and then some text in the middle
normal tags have content between the tags
so, we have open tags <p> and a close tag </p>

void elements don't require open and closing tags (so literally the contents of the tag is void) <br> = "\n"

maybe see <br> </br> - older stuff, new stuff doesn't close.  bc void.
voids - area, base, br, col, embed, hr, img, input, keygen, link, meta, param, source, track, wbr

element/tag - same

add attributes - <p id="1">content</p> (no spaces around the equal sign, use double quotes)

img - images - add attribute - <img src="">

doc type declaration - <!DOCTYPE html>

how to comment - <!-- coments -->

semantic markup - the elements should describe what is being represented in the document
tags look the same when it's output tothe website, but use the most descriptive tag for the element

agent - user agent - describes the type of browser that is being used

can use line break <br> inside <p>
	<p>Gimme a break,<br>gimme a break,<br>break me off a piece... well, you know the rest.</p>
<em>Emphasis in italics</em>
the tags are supposed to define what's in the doc, not what it does, so maybe <em> is written as bold and italics, based on how it's styled, but we are trying to define how it should be styled
	same with <strong> - makes it bold
		
normal elements have content
block elements vs inline elements - block elements are, by default, set to take up the full width of the page
headings, paragraphs

inline - part of the flow of text in the page,

block can contain inline, but don't put block elements inside inline

####5/22/14

HTML was actually invented in the 40's where you could references things like books through hypertext.

CERN needed a faster and easier way of sorting through and referencing all the research.

seven actions it can do - GET request- put a url in my browser, it sends GET request over http to a server, then gives a response, and if there are no errors, it sends back the html
good - 200 code
stateless - server isn't constantly connecting;
html is great b/c it's everwhere
semantic markup - use elements that best represent/describe the contents inside of it

acessability - wrapping with proper tags help those with accessability issues, like screen reader programs

google, yahoo, use this stuff to rank searches (search engine optimization)

<h> tags, can go smaller than 6, can make own tags, but mostly h1, h2, h3

h1 are block, inline are used (literally) in the line

HTML only recognizes one space between characters (that explains so much...)

blink and marquee - some one removed them :(

block will take up full width of container; right now the whole page is our container

#####Ordered and Unordered lists
<ul>unordered list</ul>
	<li>list items</li>
default behavior is to indent one tab space and put a bullet in front of it
<ol>ordered list</ol>
(yes, they start ordering at one instead of zero)

Definition Lists
<dl>
	<dt></dt>
	<dd></dd>	
**lists are block level not inline**

<a></a>
<hr> adds a blank line between blocks
	
####http://www.w3.org/TR/html-markup/	
MDN - Mozilla Deveoloper Network


Anchor tags - without the internet would be nothing but pitures of cats but we'd have no way to get from one cat picture to another
inline elements, so should be inside block level like <p></p>
href - hyperlink reference - link to somewhere else on the page, or link to an external place; this uses an http GET request, returns HTML as a response that is rendered on the page

<a href="url" target="_blank"> </a>opens new tab when you click on a link
	
html should do nothing but describe the element; should use javascript; this will be found in legacy code; will be depricated in newer versions 

Internal links
<a id="top">Top</a> - internal link
<a href="#top">Go tothe top of the page</a>

Image tag <img> // no closing tag

<img src="https://www.Google.com" alt="Google"> // alt tells what is supposed to be the image; for screen reader, Google SEO, whatever

hotlinking - using the url for another image on a different server, can change

________

####tables

inside a table 
<table>
	<tr>
		<th>header</th>
	</tr>
	<tr>
		<td>data</td>
	</tr>
			
&amp; - adding to html and encoding it for it for html to understand it
html entities
so if you want to use a less than sign
$lt; (less than)
$gt; (greater than)
$amp; (ampersand)
can use this for pretty much any unicode
check w3school for html entities

<form method="GET"> gets added on to the end of the URL
<form method="GET" action="/process-form.php">
    <p>
        <label for="username">Username</label>
        <input id="username" name="username" type="text">
    </p>
    <p>
        <label for="password">Password</label>
        <input id="password" name="password" type="password">
    </p>
    <p>
        <input type="submit">
    </p>
</form>	

Use POST to not have the stuff passed to the URL

this goes in the php file that is passed through the action;
<?php
var_dump($GET;
var_dump($POST);
?>

action="/process-form.php" name of file being worked on; action tells your form where to send/submit the data

value="" lets you pass sometext into the form box; can use this when redisplaying the form (if they typed in a value before); prepopulated data
placeholder="" greyed out text on the form box that goes when clicked; works even in the password form box

placeholder=" " required> - adding required the field chrome prevents it from submitting it blank

having the submit button allows the user to press enter to submit

<input type="submit" value="Log in">
<button type="submit">Log in</button>
<input type="reset"> // resets the whole form

autofocus - cursor jumps straight to the form box

<lable>Username: <input name="username" type="text"></lable>
this is valid, BB prefers the longer version


####5/23/14

Working with html forms - 
**when adding PHP inline on HTML, change file type to PHP from HTML.  PHP will not run if the file name isn't .php**

<textarea id="email_body" name="email_body">Content Here</textarea>

<textarea id="email_body" name="email_body" rows="5" cols="40">Content Here</textarea> // any spaces/newlines that you put in the text box just like it's written in between the tags

<input id="username" name="username" type="text" placeholder="username" maxlength="3"> - way to set maximum charater input

<input type="email"> give the user a special keyboard on the mobile

input type="search" search bar
input type="tele" // give number pad
url,number(dropdown menu), range (little bar), time (give time box), date (gives date box) datetime not implemented yet

input type="hidden" handy way of having data that needs to be submitted but the user doesn't need to know it's being submitted with it (like usernames, or date/time stamp)

<p><label>Text <input type="text"></label></p>
<p><label>Password <input type="password"></label></p>
<p><label>eMail <input type="email"></label></p>
<p><label>URL <input type="url"></label></p>
<p><label>Search <input type="search"></label></p>
<p><label>Telephone <input type="tel"></label></p>
<hr>
<p><label>Number <input type="number"></label></p>
<p><label>Range <input type="range"></label></p>
<hr>
<p><label>Time <input type="time"></label></p>
<p><label>Date <input type="date"></label></p>
<p><label>Date Time<input type="datetime"></label></p>

 <input type="checkbox" id="mailing_list" name="mailing_list" value="yes">// can do value="true" all these types return strings not bool
 if you leave a check box unchecked it does not return anything to the form, does not return to the POST/GET array, so no key or value will exists
to have it checked automatically, add checked after the value
<input type="checkbox" id="mailing_list" name="mailing_list" value="yes" checked>

multiple check boxes - can use the names of the inputs to create arrays that have multiple values 
<lable>things<input type="checkbox" id="things" name="items[]" value="yes"></lable>

Radio buttons - only can have one clicked at at time
<input type="radio" id="mailing_list" name="mailing_list" value="yes"> have to have the same name it will work.
if the radio buttons don't have the same name, multiple radio buttons can be selected at one time

if the radio button isn't checked it doesn't send anything

checked one of the radio buttons, need to uncheck it, can use reset button

can add the checked option with radio buttons too

________________

for="" links the lable to the id of the input w/ checkboxes and radio buttons

if it's a paragraph, put it in p tags

when writing radio/checked lables, if 
<p>
	<lable for="salinger">
		<input type="radio" id="salinger" name="writers" value="salinger">J.D.Salinger
	</lable>	
</p>
then the buttons will be on the left side, aligned, and the text of the option/answer will select the button/box when clicked

if
<p>
	<lable for="spanish">Spanish</lable>
	<input type="radio" id="spanish" name="languages" value="spanish">
</p>
then the radio buttons or the checked boxes will be on the right side of the answer/choice, the text will be aligned, but the answer/box will NOT select the answer/option choice

**table reviews**
<table>
	<tr> 
		<th>(gets bolded by default by the browser)</th>
	</tr>
	<tr>
		<td>Data1</td>
		<td colspan="2">Data1</td> // colspan does it horizontally
	</tr>
	<tr>
		<td rowspan="2">1</td> //rowspan puts it together vertically		
	</tr>		
</table>

**Forms review**

difference between GET and POST - really need to know this
GET posts in the query string in the URL

network tab in chrome inspec tells the info thats being passed
with get it says query string parameters
with post it says data passed

action="formtest.php?key=value" - makes a post?????
the passed info is different somehow?
passing paramaters does what?

i have no idea. ask.

action="formtest.php?key=value&another=thing"// how to pass multiple parameters

**select drop down menu**

<label for="transmission">Select your transmission type: </label>
<select id="transmission" name="transmission">
    <option>Automatic</option>
    <option>Manual</option>
</select>

<option>Automatic</option>
<option selected>Manual</option>// this becomes the default value that shows up in the box

    <option value="1">Automatic</option>
    <option value="2">Manual</option>


Multibox (multiple selections in a list box)
<label for="os">What operating systems have you used? </label>
<select id="os" name="os[]" multiple> // this multiple means that multiple options can be selected and passed back
    <option value="linus">Linux</option>
    <option value="osx">OS X</option>
    <option value="windows">Windows</option>
</select>

why you want to use this - depends on what you want the user experience to be; long lists,

harvesthq.github jquery chosen

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

