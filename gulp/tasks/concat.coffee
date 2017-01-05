gulp        = require 'gulp'
concat      = require 'gulp-concat'
plumber     = require 'gulp-plumber'
livereload  = require 'gulp-livereload'


# Concat
module.exports = (gulp, paths, plugins) ->

  gulp.task 'concat', ->
    stream = gulp.src([
        paths.components + 'jquery/dist/jquery.js',
        paths.components + 'underscore/underscore.js',
        paths.components + 'backbone/backbone.js',
        paths.components + 'backbone.babysitter/lib/backbone.babysitter.js',
        paths.components + 'backbone.wreqr/lib/backbone.wreqr.js',
        paths.components + 'backbone.marionette/lib/core/backbone.marionette.js',
        paths.components + 'bootstrap-3.2/assets/javascripts/bootstrap.js',
        paths.components + 'fullpage.js/jquery.fullPage.js'
      ])
      .pipe plugins.plumber()
      .pipe plugins.concat('vendor.js')

    # TODO - Env.
    # stream.pipe uglify() if environment == 'production'
    stream.pipe gulp.dest paths.dest + 'js/'
