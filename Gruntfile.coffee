module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    jade:
      options:
        pretty: true
      compile:
        expand: true
        cwd: 'html'
        src: '*.jade'
        dest: 'html'
        ext: '.html'

    coffee:
      compile:
        expand: true
        cwd: 'js'
        src: '*.coffee'
        dest: 'js'
        ext: '.js'

    stylus:
      options:
        'include css': true
        'compress': false
      all:
        files: [
          expand: true
          src: [
            'css/**/*.styl'
          ]
          ext: '.css'
        ]

    preprocess:
      build:
        src: [
          'html/index.html'
        ]
        options:
          inline: true
          context:
            DEBUG: false
            PRODUCTION: true

    useminPrepare:
      html: 'html/index.html'
      options:
        dest: 'build'

    usemin:
      html: 'html/index.html'

    htmlmin:
      build:
        options:
          removeComments: false
          collapseWhitespace: true
        files:
          'build/index.html': 'html/index.html'

    clean:
      temp: [
        'js/*.js'
        'css/*.css'
        'html/*.html'
        '.tmp'
      ]
      build: [
        'build/'
      ]

    esteWatch:
      options:
        dirs: [
          '{js,css,html}/**/'
        ]
        livereload:
          enabled: true
          port: 35729
          extensions: ['js', 'css', 'jade']
        beep: true

      coffee: (filepath) ->
        files = [{
          expand: true
          src: filepath
          ext: '.js'
        }]
        grunt.config(['coffee', 'default', 'files'], files)
        return ['coffee']

      jade: (filepath) ->
        grunt.config(['template'], filepath)
        return ['template']

      styl: (filepath) ->
        grunt.config(['stylus', 'default', 'files'], [{
          expand: true
          src: filepath
          ext: '.css'
        }])
        return ['stylus']

      css: (filepath) ->
        if grunt.option('stage')
          return 'cssmin'

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-preprocess'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-usemin'

  grunt.registerTask 'compile', ['coffee', 'stylus', 'template']

  grunt.registerTask 'template', ['jade']

  grunt.registerTask 'default', ['compile', 'esteWatch']

  # now, a rather complicated build task
  grunt.registerTask 'build', [

    'clean'

    # compile stylus + coffee
    'compile'

    # detect scripts and styles in html file, prepare it for concatenation
    'useminPrepare'

    # minify both css and js
    # these tasks are configured by usemin and cannot be executed standalone
    # i. e. the `grunt cssmin` and `grunt uglify` commands are not available
    'concat'
    'cssmin'
    'uglify'

    # remove dev scripts from html
    'preprocess'

    # rewrite paths in the html file
    'usemin'

    # minify html
    'htmlmin'

    # delete temporary files (optional)
    'clean:temp'

  ]
