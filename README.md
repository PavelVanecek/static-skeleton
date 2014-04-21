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
    └── package.json


How to install
--------------

    git clone git@github.com:PavelVanecek/static-skeleton.git mysite
    cd mysite
    rm -rf .git
    npm install

How to develop
--------------

1. `grunt`
2. `open html/index.html`
3. Type! Browser will refresh on save.

How to build
-------------

`grunt build`
App will be deployed in `build/` directory, with minified html, css and js.
