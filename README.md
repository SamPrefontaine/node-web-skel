#### node-web-skel
This is a skel project with the intended goal of adding MVC by commit, and used in a blog series.

#### Dependencies
  - bower 1.2.3
  - Node 0.10.17
  - Redis


#### Installation

  - npm install
  - bower install


#### Running

    // Single thread quick start
    $ npm start

    // testing
    $ npm test

    // Cluster
    $ node cluster.js

#### Accessing
    browse to http://localhost:3000

#### Creating Views
    $ mkdir ./views/aNewView
    $ echo "<div class=\"well\">HELLO</div>" > ./views/aNewView/body.jade

#### Switching Views
Open up the dev console:

````javascript
    window.controller.view = 'aNewView';
    window.controller.displayView();
````

#### Running tests
A good way to determine if your system is ready to run this webstack, 
run the tests. It will tell you if redis and other dependencies are not met. 

    $ npm test


