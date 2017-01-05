
# Watch Tasks
module.exports = (gulp, config, plugins) ->

  # Watch
  gulp.task 'watch', ->
    gulp.watch config.src + config.watch.sass,    ['sass']
    gulp.watch config.src + config.watch.coffee,  ['coffee_app']
    # gulp.watch config.src + 'index.jade',  ['jade']

    # TODO - abstract this into configuration
    # gulp.watch config.src + 'coffee/**/*.coffee',  ['coffee_app']
    # gulp.watch config.src + 'coffee/**/*.jade',    ['coffee_app']
    # gulp.watch config.src + 'sass/**/*',           ['sass']
    # gulp.watch config.src + 'index.jade',          ['jade']
    gulp.watch config.nodeModules + 'aeksco_client/**/*.coffee',  ['coffee_app']
    gulp.watch config.nodeModules + 'aeksco_client/**/*.jade',    ['coffee_app']
    gulp.watch config.nodeModules + 'aeksco_client/**/*.sass',    ['sass']

  return
