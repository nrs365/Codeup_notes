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
the tags are supposed to define what's in the doc, not what it does, so maybe < em > is written as bold and italics, based on how it's styled, but we are trying to define how it should be styled
	same with < strong > - makes it bold
		
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

###CSS

<style>
p{
	color: orange;
}
</style>

<p style="color: green; font-family: Courier;">
</p>

<link rel="stylesheet" href="sites.css">
12px - pixles
12em - looks at all the font size and multiplies by the other fonts (em is preferable for making a page viewable by ppl whith vision problems)

responsive - page changes depending on the size of the page; useful for mobile devices(phone, tablet)

body {
background: pink;
}

background: #ffffff; // white
background: #000000; // black

#RRGGBB red, green, blue
short hand - #00f // blue
long hand #0000ff // blue

background: rgb(0,0,255); // blue
adobe kuler - palets

when defining fonts, the last should be a global font that everyone is going to have like sans-serif

font-family: Helvetica, Verdana, sans-serif;
font-weight: bold;
font-style: italic;
text-decoration: underline;
text-decoration: line-through;
text-align: center;

th,td {//table data
 border: 1px solid black;
 }
 
 border-bottom: 5px rgb(152, 2, 2) dashed;
 border-left: 5px
 border-right:
"that is so hedious that i love it"

####selectors
**elements are listed by just the element tag
classes have a period in front
id have a hashtag**


can make a class

.class - means we want to apply a style to a class
###id selector
.class class selector

/* comments */

id will override the class if both are set and an element has both an id and a class

.bold{
	fort-weight: bold
}

.underline {
	text-decoration: underline;
} 
<p class="underline bold">
</p>

.codeup > .td2 // creates a parent/child relationship between classes

<table class="codeup">
	<tr>
		<td></td>
	</tr>
.codeup .td3 // decendent 
.td1, .td2, .td3 // how to apply to multiple classes at one time

relationships in terms of ancestory
p.codeup // paragraph with class (will exclude anything that isn't a paragraph tag with the class of codeup)

psudo classes
a:link
a:hover
a:active
a:visited
p:hover

#container h1.fancy-header // no space between h1 element and class

###6/5/14
<style>
	#container h1{ // this will take all the h1s in the container 
		color:blue;
	}
</style
<div id='container'>
<h1>
	Hello
</h1>	

#container>h1 // style any h1 that is a direct child of #container
<div id='container'>
	<div id='inner'> 
	<h1>
		Hello // won't change the color to blue???
	</h1>
	</div>
</div>

	
can get really specific and can get really nested

psudo-class/psudo-selector

specificity (lol run T)

start studying CSS3 // it'll be supported in all major browsers soon'
browsers have a limit of how many styles per sheet
**its 23,000, btw**
so break the style sheet into multiple pages

colors?CMYK? additive?


unobtrusive javascript: // ?
<span onclick link>
bad b/c screenreader won't know it's a link
better option is
<a href='google.com' >Click me</a>

can shorten anything is double zero (#0000ff -> #00f)
RGB - subractive?
#ccc - grey
#030303 #F3F3F3

gimp has a color picker // did not know that...

#FF0000 = red
#00FF00 = green
#0000FF = blue
#000000 = black
#FFFFFF = white
#808080 = grey

.superscript{font-size:xx-small; vertical-align:top;} 
.subscript{font-size:xx-small; vertical-align:bottom;} 

element { background-image: url(http://www.example.com/images/bck.png); }
element { background-repeat: repeat-x; } // this is used a lot, an image will be repeated on the x and y axis

element { font-style: italic; }
element { font-family: Helvetica, Arial, Sans-Serif; } // prioritized list
element { font-family: "Times New Roman", Times, Serif; }
element { font-family: "Courier New", Monospace; } // **monospace** means that the space between the letters will all have the same spaceing no matter what the letter is; makes it really straight and even; up and down and left and right all line up

default browser behavior for em is italics
font-style:oblique

em for font size - corresponds to the current font size and multiplies; works well if you're going to be blowing up your screen to scale it to make it larger and it corressponds to the height of the letter M in the font set

ol { list-style: upper-alpha; } // very cool; much needed
ul { list-style: square; }
https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-type

/* make second-level headers green */
h2 { color: green; }
/* ...but leave those in the sidebar alone so they use their parent's color */
#sidebar h2 { color: inherit; } // can do this but it's sort of dumb? just be specific and name the color you want

JS doesn't want any style inline; wants it all exteral style sheets
inline style is ok for small stuff and in email templates


**Box model**
margin(border(padding(content)))
top, right, bottom, left

___________
JS
things to think about when designing websites:
seeing impared, hearing impared, colorblind, keyboard only user, mobile user, user experience design

colorblind - can't differenciate between green and red
have to rely on clarity in words to communicate; use alternate text for links besides 'click here' use 'apply now' or
arearollhidden hides it from screenreaders
to tabindex in forms
mobile users - responsive
508 compliance
html5 boilerplate
understand frameworks
mail chip for emails
color oracle - to see like colorblind

area attributes? - help with screen readers
eric ford - knows front end really well
battle of good design vs personal taste
_______________


overall width = width + padding-left + padding-right + border-left + border-right

overall height = height + padding-top + padding-bottom + border-top + border-bottom

div and span don't have anything to do with _____
they're just containers
one is a block element and one is an inline element
div is a block element

Div
The HTML <div> element (or HTML Document Division Element) is the generic container for flow content, which does not inherently represent anything. It can be used to group elements for styling purposes (using the class or id attributes) or because they share attribute values, such as lang. It should be used only when no other semantic element (such as <article> or <nav>) is appropriate.

span is an inline element
The HTML element is a generic inline container for phrasing content, which does not inherently represent anything. It can be used to group elements for styling purposes (using the class or id attributes) or because they share attribute values, such as lang. It should be used only when no other semantic element is appropriate. <span> is very much like a <div> element, but <div> is a block-level element whereas a <span> is an inline element.

div takes up the full width of the page
span only takes up the space of the content area
can change div width and height but doesn't change the block element of it (it's still going to take up the full width of the page, sort of)

div {
	border-right: 1px solid red;
	border-top: 10px solid green;
	width: 250px;
	height: 75px;
	padding: 20px;
	margin-bottom: 10px;
	
}

"i knew i loved chrome but i love it a little more" lol

is it better to use <br> or move the boxes to position things?
<br> is a line break, and it should be used to break lines b/c symantic, so no

window resizer for chrome
start with webpage view then scale it down, but it depends on the users; if the majority of ppl are going to be going to that website on a mobile device so be considerate of that

<div class="sample-div">
	This is a div
	<span>This is a span</span>
</div>

div.sample-div span {//
	border: 1px solid blue;
}	

div.sample-div>span //

something about the first child >_>

####floats

float- breaks element from the default contents of the page and it can move around, takes into account padding and margin, but all the other elements have moved too, it doesn't take up the full width of the page anymore
breaks free of the flow, moves over to the left or right of the container,
floats cool b/c the images wrap around the text of a paragraph

clear: - clears a float; can clear left or right;
text will wrap, so clear: the text; clear:left, clear:right, clear:both;
*if a container only has floated elements, it collapses (weird stuff floats do)*
google clearfix and it'll give solutions
bootstrap has some stuff that will do this
if floats hit the edge of a container, it'll go down and wrap around and shift to the next availible space

###positioning
**relative, absolute, and fixed positioning**
position:relative // using this one without knowing the other two make it confusing 

position: relative;
        top: 10px;
        right: 10px;
//from the right go this many, from the top go this many, so the box ends up moving down and to the left

absolute is used in conjuntion with relative
position:absolute will be relative to the container that has position:relative; if you put a box inside that container and set it position:absolute; it'll shift it from the top/bottom/left/right
position:absolute will override it being inside the container 

####fixed
position:fixed
this is the thing where something gets fixed relative to the browser window and stays in place while you scroll

css - media query - if the browser/viewport is more than 600px make it fixed, if it's less then let other stuff scroll with it

reflect and share: things i learned today:
sublime has this feature where it can have two windows open side by side and omg where have you been al my life
i've been having flashbacks of when i used to style my deadjournal in html.  that was like 15 years ago.
html/css sometimes is the devil.  but sometimes it's pretty cool
i think i want to start a blog >_> nooooooooooo.  must... not... write...
bootstrap might or might not be cool.  wordpress is generally hated by everyone.  not sure how to feel about that.

###6/6/14

z-index - can solve some problems that come up; x axis, y axis, z axis
z-index can be used to move in and out of the page, so things can go under or over something


has a lot of trouble predicting float behavior

document flow - document tries to flow up

when you position something it takes it out of the flow of the document, so content can get hidden under the fixed positioned thing
margin: vertical, horizontal;

css_positioning
no idea; floating positions relative to absolute and BB started and approached it in a totally different way than me.  and i have no idea how he got what he did
added a new container and put the other divs in it and made it wrap around?

divs float, not just text; clear green; put it in a diff container

_______

coordiates for moving div corresponds to the direction you're moving it in; so if you want it top right then top right is the new (0,0)

box model exercise - 
div {float:left;
		position:relative}// this makes the magic happen.  not sure why.  scoping the image in/to the box div

put the image in the div colored box

chrome web inspector lets you choose a place, see the px location and then save that in the code.
div>img{
	position:absolute;
	top:0;
	bottom:0;
	
}		
ribbons.
green box, clear:left; to get it on the new row


####TwitterBootstrap
CSS framework
weird.  no opinion formed yet

reflect and share: things I learned today:

