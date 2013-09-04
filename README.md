#### node-web-skel
    This is a skel project with the intended goal of adding MVC by commit,
    and used in a blog series.

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

#### Switching Views
    in the HTML source, browse the Controller

````javascript
    var view = 'index';
    window.controller.displayView();
````

#### Running tests
A good way to determine if your system is ready to run this webstack, run

    $ npm test

It will tell you if redis and other dependencies arent met.
