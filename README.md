Static project skeleton
======================

Skeleton for creating simple static webpages.

Collection of grunt plugins for stylus + coffee + jade compiling and minification, together with [grunt-este-watch](https://github.com/steida/grunt-este-watch) for easy development and build.

I suggest using this skeleton for very simple static pages only. For anything slightly more complicated, I recommend [este](https://github.com/steida/este).

Project structure
-----------------

    .
    ├── Gruntfile.coffee
    ├── README.md
    ├── css
    │   └── styles.styl
    ├── html
    │   └── index.jade
    ├── img
    ├── js
    │   └── app.coffee
    ├── package.json
    └── tasks

How to setup my machine
-----------------------

Install node.js and npm, then:

    npm install -g grunt-cli bower

How to download skeleton
--------------

    git clone https://github.com/PavelVanecek/static-skeleton.git mysite
    cd mysite
    rm -rf .git
    npm install

How to develop
--------------

    grunt

Open `html/index.html` in browser and type code! Browser will refresh on save.

How to build
-------------

    grunt build

App will be deployed in `build/` directory, with minified html, css and js.

How to add dependencies
-----------------------

e. g. jquery

    bower install jquery --save

in `index.jade` add script reference inside `// build:js` block

    // build:js js/app.min.js
    script(src="../js/app.js")
    // endbuild

to

    // build:js js/app.min.js
    script(src="../bower_components/jquery/dist/jquery.js")
    script(src="../js/app.js")
    // endbuild

jQuery will be included inside app.min.js.

Any `*.js` files inside `js/` folder will be deleted, as they are considered compiled coffeescript and not actual libraries.

TODO
-------------

- Image sprites
