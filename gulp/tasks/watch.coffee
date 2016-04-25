
# Watch Tasks
module.exports = (gulp, paths, plugins) ->

  # Watch
  gulp.task 'watch', ->
    gulp.watch paths.src + 'sass/**/*',   ['sass']
    gulp.watch paths.src + 'index.jade',  ['jade']

  return
