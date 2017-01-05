module.exports = (gulp, paths) ->

  # Import Plugins
  plugins = require './config/plugins'

  # Import tasks
  require('./tasks/env')(gulp, paths, plugins)
  require('./tasks/copy')(gulp, paths, plugins)
  require('./tasks/sass')(gulp, paths, plugins)
  require('./tasks/jade')(gulp, paths, plugins)
  require('./tasks/watch')(gulp, paths, plugins)
  require('./tasks/webserver')(gulp, paths, plugins)
  require('./tasks/noop')(gulp, paths, plugins)

  return true
