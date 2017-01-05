# gulp        = require 'gulp'
# browserify  = require 'gulp-browserify'
# plumber     = require 'gulp-plumber'
# concat      = require 'gulp-concat'

# Coffee Task
module.exports = (gulp, config, plugins) ->

  gulp.task 'coffee', ->
    stream = gulp.src(config.src + config.coffee.src, { read: false })
      .pipe plugins.plumber()
      .pipe plugins.browserify
        # debug:      environment == 'development' # TODO - ENV
        debug:      true
        transform:  ['coffeeify', 'jadeify']
        extensions: ['.coffee', '.jade']
      .pipe plugins.concat('app.js')

    # TODO - Env.
    # stream.pipe uglify() if environment == 'production'

    stream.pipe gulp.dest config.coffee.dest
