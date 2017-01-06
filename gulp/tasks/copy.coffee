
# Copy Tasks
module.exports = (gulp, config, plugins) ->

  # gulp.task 'copy', ['copy_fontawesome', 'copy_images']
  # gulp.task 'copy', ['copy_fontawesome']

  # Copy FontAwesome
  gulp.task 'copy_fontawesome', ->
    gulp.src config.copy.font_awesome.src
      .pipe plugins.plumber()
      .pipe gulp.dest config.copy.font_awesome.dest

  # Copy app/img -> build/img
  gulp.task 'copy_images', ->
    gulp.src config.copy.img.src
      .pipe plugins.plumber()
      .pipe gulp.dest config.copy.img.dest

  return
