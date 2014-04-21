# inspired by http://www.thomasboyt.com/2013/09/01/maintainable-grunt.html

fs = require('fs')
loadConfig = (path) ->
  object = {}
  fs.readdirSync(path).forEach (option) ->
    key = option.replace(/\.coffee$/,'')
    object[key] = require(path + option)
  return object

module.exports = (grunt) ->

  baseConfig =
    pkg: grunt.file.readJSON 'package.json'
    env: process.env

  config = grunt.util._.extend baseConfig, loadConfig './tasks/options/'

  grunt.initConfig config

  require('load-grunt-tasks')(grunt)
  grunt.loadTasks('tasks')
