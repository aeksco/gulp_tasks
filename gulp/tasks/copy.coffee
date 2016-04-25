
# Copy Tasks
module.exports = (gulp, paths, plugins) ->

  gulp.task 'copy', ['copy_fontawesome', 'copy_images']

  # Copy FontAwesome
  gulp.task 'copy_fontawesome', ->
    gulp.src paths.nodeModules + 'font-awesome/fonts/*'
      .pipe plugins.plumber()
      .pipe gulp.dest paths.dest + 'fonts/'

  # Copy app/img -> build/img
  gulp.task 'copy_images', ->
    gulp.src paths.src + 'img/*'
      .pipe plugins.plumber()
      .pipe gulp.dest paths.dest + 'img/'

  return
