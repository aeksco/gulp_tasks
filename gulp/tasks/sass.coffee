
# SASS Tasks
module.exports = (gulp, paths, plugins) ->

  # TOOD - add SASS_LINT
  gulp.task 'sass', ['sass_compile']

  gulp.task 'sass_compile', ->
    gulp.src paths.sassSrc
      .pipe plugins.plumber()
      .pipe plugins.sass()
      .pipe if process.env.NODE_ENV in ['prod','stage'] then plugins.minifyCss({ keepSpecialComments: 0 }) else plugins.gutil.noop()
      .pipe plugins.rename
        basename: 'app'
        extname: '.min.css'
      .pipe gulp.dest( paths.dest + 'css/' )

  return
