###6/26/14

review addressbook with db

####Laravel
MVC stands for Model-View-Controller. MVC is a software pattern that separates data, programming logic, and presentation into separate parts to allow for a more organized and more easily maintained codebase.

Models represent the data layer of the application.
Views represent the presentation layer of the application.(browser)
Controllers provide the glue that link the Models and Views together.(logic)

____________

Route::get('/sayhello/{name}', function($name)
{
    return View::make('my-first-view');
});

this way takes a parameter and it chooses the route

Route::get('/contacts/{id}/{id2}', function($contactId, $contactId2){

});
view is an object and make is a public static method
:: (colon colon) calls an instance of a static method

view::make('hello'); // hello is a file in the view folder
so put the file name or use the . (period) to access a folder inside a folder
laravel is going to look for php files only so only put php files in yoru views


route::get('/contacts/{id}', function($contactId) {
return View::make('contacts.show')->with('contactId', $contactId);
}); // show is in the contacts folder; variables being passed don't have to be the same but the variable in the file has to match what is being passed in the with->();
in php (header:location) statement, but in laravel it's different


if($contactId == 1) {
return View::make('contacts.show')->with('contactId', $contactId);
} else {
return Redirect::to('/contacts');
}

anytime a var is showing you want to strip the tags and escaped

route::get('/contacts/{id}'), function($contactId) {
$data = array(
    'contact_id' => $contactId,
    'contact_name' =>'chris',
    
);

http://laravel.com/docs/responses
http://daylerees.com/codebright/responses

blade templating
all files must be name.blade.php
{{ $random }} // echo
{{{ $random }}} // echo with escaped characters and strip tags on the output
the only time you don't want to use curly braces is when you actually want that to happen (dunno when that is)

**{{{ $name }}}**
Instead of:
<?php echo htmlentities($name, ENT_QUOTES, 'UTF-8'); ?> or:
<?= htmlentities($name, ENT_QUOTES, 'UTF-8'); ?>

**{{{ !empty($name) ? $name : 'You must have a name, right?' }}}**
Instead of:

<?= !empty($name) ? htmlentities($name, ENT_QUOTES, 'UTF-8') : 'You must have a name, right?' ?>

**@if (!empty($name)) // make sure the @if, @else, and @endif are all on new lines
    <h1>{{{ $name }}}</h1>
@else
    <h1>You must have a name, right?</h1>
@endif**

Instead of:

<? if (!empty($name)): ?>
    <h1><?= htmlentities($name, ENT_QUOTES, 'UTF-8'); ?></h1>
<? else: ?>
    <h1>You must have a name, right?</h1>
<? endif; ?>

**@foreach ($names as $name)
    <h1>{{{ $name }}}</h1>
@endforeach**

Instead of:

<? foreach ($names as $name): ?>
    <h1><?= htmlentities($name, ENT_QUOTES, 'UTF-8'); ?></h1></h1>
<? endforeach; ?>

###6/27/14

**controllers in laravel**

Route::get('/', 'HomeController@showWelcome');
Controllers should be placed in the app/controllers directory.
Controllers must be classes that are named _____Controller, where the blank is a descriptive word of what is being controlled.
Generally, all controllers should extend from BaseController.
The name of the file should be the same as the class name and end with .php.
Any methods that you declare inside the controller for routing must be public or they will not be accessible.


route::get('/sayhello/{name}', 'HomeController@sayHello');
this is a function and it's expecting a parameter


public function showWelcome()
public function showBye($name)
return View::make('temp.my-first-view')->with($data);

return Redirect::action('HomeController@sayHello', array('Bob'));

public function login() {
if person logged in
return redirect::action('HomeController@showProfile')
else return
}

action('')

action('HomeController@showWelcome');
can use action to link to a file that isn't in the same place as listed in the router?

change in route and change in home controller
methods will be show resume and showportfolio
change in route to new methods from the controller

_____________

named linked routes - thing you can do
CT likes to use controlers

one page sites - static sites
use anchor tags to change to different sections in the single page
can still link to external pages

reverse routing - controler action - path it is on
renders view, and path

return Redirect::action('HomeController@sayHello', array('Bob'));//have an array b/c actions can have multiple parameters

REST - representational state transfer
doesn't care about previous state or future state
GET and POST

vagrant ssh into blog.dev and php artisan to see a list of all the commands

use snake case for making tables, and camel case for making controllers


###6/30/14

laravel used for rapid application development - meaning finished product is ready in like two weeks instead of two years; downside is we have to use their routing not use our own

there is no official REST spec; concept we all agree on and hasn't been blessed by the W3; RESTfulness helps us discover what something is supposed to do
if I create a resourceful controller it's going to have CRUD (create, read, update, destroy)


in posts controller - those commetns for the resource the @param @return can be used with a certain type of compiler that will take those comments and sort of build documentation around that for project

read the controllers docs from laravel

controller returns content and all blade outputs text?

**retrieving GET and POST**
$inputs = Input::all(); // gets all
$input = Input::get('name'); // returns the value for name assuming name was set

if (Input::has('name')) // checks to see if the input has a value

$name = Input::get('name', 'Bob'); // sets a default
// would be equivalent to:
$name = 'Bob';
if (isset($_REQUEST['name']))
{
    $name = $_REQUEST['name'];
}   
}

making sticky form <input type="text" name="name" value="{{{ Input::old('name') }}}"> // not really getting sticky form anyway

redirect back to the form with the old function input(return Redirect::back()->withInput();
// or:
return Redirect::action('PostsController@create')->withInput();

and all of these add the html special char with these commands

front controler design pattern - always ship inputs to the exact same place - the very beginning of our framework

App::abort(404);
Just call App::abort() with the HTTP error code you would like to use. Here are some common ones:

403 - Access Denied
404 - Page Not Found
500 - Server Error
Notice that you do not need to use return. Just call App::abort().

Laravel allows you to define a custom handler for 404 errors. To define the 404 handler, just add the following code to app/start/global.php:

App::missing(function($exception)
{
    return Response::view('errors.missing', array(), 404);
}); // no idea what is happening here

Log::info('This is some useful information.');

Log::warning('Something could be going wrong.');

Log::error('Something is really going wrong.');

from terminal tail -f app/storage/logs/laravel.log to constantly show the log updates
___________

public function store()
    {
        Log::info(Input::all());
        return Redirect::back()->withInput();
    }
    
migrations - add bit by bit; up method and down method, meaning we can add and delete; this only has to do with the schema, not the data itself

    php artisan migrate:install
    php artisan migrate:make create_posts_table
    php artisan migrate
    php artisan migrate:rollback
    php artisan migrate:reset

the public functions up and down are for managing the migrations
    

class CreatePostsTable extends Migration {

    public function up()
    {
        Schema::create('posts', function($table)
        {
            $table->increments('id');
            $table->string('title', 100);
            $table->text('body');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::drop('posts');
    }

}

Eloquent ORM - Object Relational Mapper - way to create and query the database

class Post extends Eloquent {
    protected $table = 'posts';
}

###7/1/14

ORM - wants to deal with database like it was a whole bunch of objects
active records style - find post and manipulate it
easier to maintain, easier to read, lets you migrate which is awesome

model - gives us the ability to make something but it doesn't let us actually manipulate it
**Eloquent is the ORM in Laravel** anything that extends eloquent automatically becomes a ORM object

model name is singular of the table it's named after
FAT models and skinny controllers - all business logic in the post extends eloquent
controllers are skinny and contain the min amount of stuff
post asks database what it has
ORM maps to databases (mango, mysql, whatever)

echo link_to_action('HomeController@getIndex', $title, $parameters = array(), $attributes = array());
http://laravel.com/docs/helpers

don't put html in the controller

laracasts.com - core developer on laravel project; 


laravel has a validation model
static public $rules = [
        'title' => 'required|max:100'
    ];
    
rules have to be public static is a keyword that means that no new instance of the class or model

<span class="help-block">:message</span>')
why using :message is b/c I18N - can put a language file in there and it'll show error message for language and put it in there and we can override what the error message can say  
rules should be on the model not the controller; keys are what we are checking against, use pipes
**look up validation rules on docs**

@if ($errors->has('title')) 
{{ $errors->first('title', '<span class="help-block">:message</span>') }}
@endif  
can do it without the if statement; and can add validation to multiple things on the form

 can use passes() or fails() for validation
 
** forms ** 
{{ Form::open(array('action' => 'PostsController@store')) }}
{{ Form::close() }}

Laravel can use this to prevent **Cross Site Request Forgery (CSRF)** attacks. These can occur when another webpage or program tries to submit a form for processing on your site.

_token - this is the CSRF check
all controllers extend the base controller - so make a constructor

public function __construct()
    {
        $this->beforeFilter('csrf', array('on' => ['post', 'delete', 'put']));
    }
When you specify a method of PUT or DELETE a special hidden form input named _method gets added so that Laravel knows how it should process the request. You can manually add the _method, but it is nice to have the form builder do it for us.

_________________


bonus bonus for the post
public function store()
{
    $this->update(null);
}

public function update($id) {
    $post = new Post();
    $post = Post::findOrFail($id);
    $validator = Validator::make(Input::all(), Post::$rules);
    if ($validator->fails()) {
        return Redirect::back()->withInput()->withErrors($validator);
    } else {
        $post->title = Input::get('title');
        $post->body = Input::get('body');
        $post->save();
        
        return Redirect::action('PostsControllers@show', $post->id);
    }
}


**pagination** 

public function index()
{
    $posts = Post::paginate(4);
    return View::make('posts.index')->with(array('posts' => $posts));
}   

{{ $posts->links() }} // add this where you are wanting the page numbers to show up

if you have more than one set of data on the page it won't work.

Laravel includes a library called **Carbon** makes working with dates easy. You can find more information by visiting the documentation on Github. See the additional info section for links.

time and date

->format('l, F jS Y @ h:i:s A');

diffForHumans - time ago output;

By default, Laravel is configured to use UTC time. You can re-configure this by changing the timezone in app/config/app.php.
cho  $post->created_at->setTimezone('America/Chicago')->format('l, F jS Y @ h:i:s A');
https://github.com/briannesbitt/Carbon

controller breaks down the logic of the program


###7/2/14
infinite scrolling - type of pagination - JS hates it - bad UI for blogs; it crashes browsers
ajax and javascript do a lot of stuff that looks pretty

**Sessions**

like sessions in php - same thing - sessions are a way to store information between page loads; langauge, authorized, admin, preferences, data about user

sessions work as a key value store
can ask for a value

// set a value in the session
Session::put('key', 'value');

// retrieve a value from the session
$value = Session::get('key');

// check if a value exists in the session
if (Session::has('key'))
{
    // do something here
}

// remove a value from the session
Session::forget('key');

// clear all session variables
Session::flush();

like validation - validation::has, validation::put

this will go in controllers, possibly in view if showing messages

could use forget - uncheck a box to always do this on that page;
use "remember me" with session
usually two week sessions with laravel
session highjacking - cookies can be seen by javascript - put in a comment and then add javascript and get the info from the cookie
session keys need to change and be big so people can't guess it

**using flash** - will remember session data for the next (one) page load and then it's gone
// set flash data
Session::flash('key', 'value');

// retrieve flash data (same as any other session variable)
$value = Session::get('key');

put this in the master blade and don't have to keep track of it 

@if (Session::has('successMessage'))
    <div class="alert alert-success">{{{ Session::get('successMessage') }}}</div>
@endif
@if (Session::has('errorMessage'))
    <div class="alert alert-danger">{{{ Session::get('errorMessage') }}}</div>
@endif

success message and error message can be set to whatever we want them to be

**Authentication**

making a table for users in the blog db
php artisan migrate:make command. Next, the up method of the migration should be modified to include the following:

Schema::create('users', function($table)
{
    $table->increments('id');
    $table->string('email', 200)->unique();
    $table->string('password', 100);
    $table->timestamps();
});

use php artisan migrate to execute the file

one way hash on passwords - creates some sort of algorithm and if the converted thing matches then it's authenticated

always produces the same hash
rainbow tables - like a translation/decoder table so they made salt(random string only the server knows that's concatinated on the end of the password')
$hashedPassword = Hash::make('abc123!@#');
can put has in a database
always will be 60 characters

**seeders**
sometimes we need tables to have a certain amount of data in automatically
probably not going to run the seeder in production

______________
in vagrant ssh

sudo su - // switch to root user
top in home directory in vagrant will show all processes, then you can find the number of the process, and then do "kill 3938938" whatever process ID and it'll force close the process

________

###7/3/14

double hashing and mutators

using Tinker in the vagrant ssh
queries
vagrant ssh cd blog.dev
php artisan tinker

$users = DB::table('users')->get();
returns an array of the users and info

foreach($users as $user) {
    echo $user->email;
}

$posts = DB::table('posts')->get();

http://laravel.com/docs/function


can do joins in tinker too
$post = Post::where('title', 'test')->first();

$post = DB::table('posts'); // will return results from queries; could use this if it has nothing to do with resources
 
$post = Post:://if was doing something with a specific resource sort of gets more bang for buck; this one comes with extra added stuff

DB:table('posts') can be replaced with Post::

$post = Post::('title', )->orderBy('created_at', 'asc');

logic should go inside the controller in the index (i think)

add "like" for the search query

_______________

the fucntionality to retrieve things from a model is an instance of the model?

Post:: - model of a class; getting an instance of a Post/model???

####Tables in Laravel

Schema::table('posts', function($table)
{
    $table->integer('user_id')->unsigned();
    $table->foreign('user_id')->references('id')->on('users');
});


**How to make a migration table:**

go into vagrnt box
go into blog.dev
php artisan migrate:made add_user_id_to_posts_table
check in sublime in database/migrations and check for a file
copy and paste into the up and drop

in the schema table we add the ID key and the foreign key
the down is always going to undo whatever the up did in the opposite order you did the up in

public function posts()
{
    return $this->hasMany('Post'); // Post is the name of the model b/c this is going to return instances of the Post model
}

belongsTo() part of one-to-many relationship

php artisan migrate - throws an error so CT drops all tables then does migrate --seed (don't know this yet; missed it yesterday)

return Users::find(3)->posts; // with eloquent, if we are accessing an entry and not making changes we pretend like it's a col in the database; if you want to change, do posts() instead of just posts; at the end of a chained query it needs a get(); if not chaining don't put the ();

eagar loading - don't load something until i ask you to load it

$posts = Post::all(); - lazy load 11 queries
$posts = Post::with('user')->get(); - eagar load 2 queries

final project

$post->user()->associate($user); // associates the user with the post


###7/7/14

another popular view is json instead of html

hasMany() and belongsTo() - bidirectional

all ORM will lazy load by default; lazy load says if I'm going to load ten posts I'm not going to load the users so I'm going lazily load the post but not the user; then go back and get the user if you ask for it (n+1) algorithm? 
eagar load - instead of making several queries, it'll make one big query and have the user information with it
want to lazy load when don't need the associated stuff
want to show related data - use eagar loading.

**authentication users in laravel**
if (Auth::attempt(array('email' => $email, 'password' => $password)))
{
    return Redirect::intended('dashboard');
}

if (Auth::check()) - show on master blade to show either a log in button or a create post button
http://laravel.com/docs/security#authenticating-users

_________

BB has in store function (i have this no where in my code)

$post = new Post();

$post->user_id = Auth::user()->id;
$post->user()->associate(Auth::user());

return $this->savePost($post);
return $this->update(null);

adding profile enhancements
adding first name and last name to users
create a new migration
add two columns: first_name, last_name
update seeder and run migraters and seeders
add to the view

image upload:
create a new migration

form::open add the 'files'=>true when we want to be able to add files (inc type multi part form data)

###7/8/14

is this related to user request flow? - checking if somthing is valid is part of that request flow, that fits into the controller
model - manipulating data
should i throw an error - controller

use gist - can upload snippets of code without a repo

**more markdown**
http://daringfireball.net/projects/markdown/syntax

parsedown is an demo that parses it into html from markdown

checks html and fixes errors
http://htmlpurifier.org/demo.php

lets users write in markdown, not html, then checking the markdown and html for potentially bad stuff, and yea good stuff

how to install parsedown and html function purifier
don't install through going to the website, 
find the composer.json file in blog.dev and open in sublime
add "erusev/parsedown": "0.8.*",
"ezyang/htmlpurifier": "4.6.*" and save
install through going to vagrant ssh
cd blog.dev
composer update

__________

for preview

linked css file - pagedown.css

apply special classes and id based on what pagedown said
button bar
use sample code for something

preview div below body
include additional javascript that is specific to pagedown

download stuff when it's front end like javascript or css
use composer for php stuff
but some php libraries that doesn't support in composer


###7/9/14

####git and git branching

master is like a time line tree trunk
two ways to branch: feature branching and team branching
**feature branching**: can do stuff to the project and make mistakes and not damage anything; tracks the changes in the new branch but the master branch stays, can then merge it back in with the master branch when you're done adding stuff

team branching - gate keeper or keymaster? 
can do git pull origin master to get a copy of the repo and create individual branches for each person; can merge and can push to master; git push origin isaac (name of the branch) then submit a pull request, then when the gate keeper approves it, it'll merge with master then will be added back to the team (individual) branch

the branch you're on is called "checked out"
git branch new_feature
git checkout new_feature
git checkout -B test // creates a new branch and checked it out in one command
git checkout master // puts back on master branch
git branch -D test // deletes the branch

when you do git merge it will tell you which files are in conflict; go into those files and look for
<<<<<<<<<<< head
<div>
	==========
<p></p>
==========

two different things on the same line, which one do you want

git clone ssh way-
git clode git.github.com:gocodeup/vagrant-lamp.git // downloads the files from the terminal instead of from the	website
can pass a name after the git clone request and it will create a folder by that name

git pull origin master // will attempt to merge the repos/files

1) git check out master (b/c that's the branch I want to merge into)
2) git merge new_feature (this updates the master i think)

git add -A // will commit deleted files
git add . // does not do deleted files

git log // will show the commit history; press "q" to exit the log history

____________

checking the user and restricting privledges
gocodeup/laravel-blog/blob/master/app/models/user.php

put a filter in the controller and that will protect routes and can check if the user owns the post or is an admin before trying to edit or delete

1) don't show users buttons they can't use
2) need to protect edit, update, and delete methods
3) just applying protection in the view is no protection at all

added can manage post
pub func canManagePost($post) {
return $this->isAdmin() || $this->id == (something)
}

in laravel, the route uses the name of the route itself

$slug(will me id for us) = $route->getParameter('posts');
$post = Post::findBySlug($slug);
if(!Auth::user()->canManagePost($post)) return Redirect::action('PostsController@show', $slug);

Route::filter('user.protect', function($route) {
$id = $route->getParameter('users');
if (Auth::guest() || ($id != Auth::user()-> && !Auth()))
})

search engine optimization - looking by keywords also in the url not just in body or in description


str_limit($value, $limit = 100, $end = " ... ") (maybe add a link to action in the end to show/read more of the post)

________
###7/10/14

for capstone
Minimum Viable Product (MVP)

next wednesday - headshots- at about eleven
may cover ajax, geolocation
depends on what web apps we are working on and what it needs
more customized for what groups need

strike - credit cards for websites
twillio - send text messages through an api from a website

digital ocean- imploys git - make one first initial push then do updates and rollbacks

slug - getting the unique id (titleish) in the url instead of the id; do this for security and search engine optimization

get title, covert it to lowercase, convert spaces to dashes
findbySlug::()
select from posts where (slug)
add column to database, call it slug,

writing technical blog posts are great in interviews

disqus - add comments to blog posts; works with bootstrap
consider responsiveness
____________
filters for blog
// this code goes in filters.php
Route::filter('post.protect', function($route) {

    // retrieve post id from route (named based on table)
    $id = $route->getParameter('posts');

    // lookup the post
    $post = Post::findOrFail($id);

    // redirect if user cannot manage the post
    if (!Auth::user()->canManagePost($post)) return Redirect::action('PostsController@show', $id);
});

// this code goes in the __construct function in PostsController
// run post protect filter to make sure users can only manage their own posts
$this->beforeFilter('post.protect', array('only' => array('edit', 'update', 'destroy')))

adding slug


###7/14/14
git branching model

check out a branch/switch to a branch
git checkout <branch>

check out a new branch
git checkout -b <new branch name>

list all branches
git branch a-


git merge --no-ff<branch to mergin into>

git push
git pull

branch naming- person's name, feature name

once pull request and merge is done, go to master branch in terminal and
git pull origin master
everyone in the team needs to do the pull to have it on their computer

someone else has been working in their branch
git checkout master
git pull
git checkout new branch
git merge --no-ff master // adds master into all the local code
__________

**gitmaster**

composer create-project laravel/laravel [project domain]

ansible-playbook ansible/site-create.yml -e "domain=[project domain]" -l vagrant

subl /etc/hosts

Create repo on github

git init
git remote add origin [git url]
git push -u origin master
grant access to teammates

adding code for teammates

git clone [git url] [project domain]

ansible-playbook ansible/site-create.yml -e "domain=[project domain]" -l vagrant

subl /etc/hosts

composer install
composer update

____


###7/15/14
php artisan controller:make UsersController

###7/16/14

#####resizing images

manipulating images to get it to fit the layout of the website
resize will work with jpg files
png may work differently


Route::get('test', function () {

    $maxHeight = 200;
    $maxWidth = 200;

    $newHeight = 0;
    $newWidth = 0;

    $inputFile = public_path() . '/uploads/ct.jpg';
    $outputFile = public_path() . '/uploads/ct-small.jpg';

    // load the image to be manipulated
    $image = new Imagick($inputFile);

    // get the current image dimensions
    $currentWidth = $image->getImageWidth(); 
    $currentHeight = $image->getImageHeight();

    // determine what the new height and width should be based on the type of photo
    if ($currentWidth > $currentHeight)
    {
        // landscape photo
        // width should be resized to max and height should be resized proportionally
        $newWidth = $maxWidth;
        $newHeight = ceil($currentHeight * ($newWidth / $currentWidth));
    }
    else if ($currentHeight > $currentWidth)
    {
        // portrait photo
        // height should be resized to max and width should be resized proportionally
        $newHeight = $maxHeight;
        $newWidth = ceil($currentWidth * ($newHeight / $currentHeight));
    }
    else
    {
        // square photo
        // resize image to max dimensions
        $newHeight = $newWidth = $maxHeight;
    }

    // perform the image resize
    $image->resizeImage($newWidth, $newHeight, Imagick::FILTER_LANCZOS, true);  

    // write out the new image
    $image->writeImage($outputFile);

    // clear memory resources
    $image->clear(); 
    $image->destroy();

    return 'Done';

});


###7/18/14

