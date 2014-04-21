module.exports =
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
