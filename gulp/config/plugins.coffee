# Empty plugins object
plugins = p = {}

# # # # #
# Gulp

p.coffeelint  = require 'gulp-coffeelint'
p.concat      = require 'gulp-concat'
p.gutil       = require 'gulp-util'
p.jade        = require 'gulp-jade'
p.minifyCss   = require 'gulp-minify-css'
p.plumber     = require 'gulp-plumber'
p.rename      = require 'gulp-rename'
p.sass        = require 'gulp-sass'
p.size        = require 'gulp-size'
p.uglify      = require 'gulp-uglify'
p.webserver   = require 'gulp-webserver'

# # # # #
# Vinyl

p.buffer  = require 'vinyl-buffer'
p.source  = require 'vinyl-source-stream'

# # # # #
# Browserify

p.browserify  = require 'browserify'
p.coffeeify   = require 'coffeeify'
p.jadeify     = require 'jadeify'

# # # # #
# Utility

p._           = require 'underscore'
p.fs          = require 'fs'
p.resolve     = require 'resolve'
p.runSequence = require 'run-sequence'

# # # # #

module.exports = plugins
