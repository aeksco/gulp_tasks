helpers = require '../helpers/coffee'

# # # # #

# Coffee (App) Task
module.exports = (gulp, paths, plugins, bundles) ->
  gulp.task 'coffee_app', ->

    config = bundles['app']

    console.log 'Bundling Application JS Assets...'

    helpers.genBrowserifyBundle(paths, config)
      .bundle()
      # Pass desired output filename to vinyl-source-stream
      .pipe plugins.source('app.min.js')

      # Buffer - allows for ```pipe func()```
      .pipe plugins.buffer()

      # Uglify Vendor Bundle
      .pipe if process.env.NODE_ENV in ['prod','stage'] then plugins.uglify() else plugins.gutil.noop()

      # Display Size
      .pipe plugins.size()

      # Pipe to destination
      .pipe gulp.dest( paths.coffee.dest )
