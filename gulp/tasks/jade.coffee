
# Jade Tasks
module.exports = (gulp, paths, plugins) ->

  gulp.task 'jade', ->
    gulp.src paths.jadeSrc
      .pipe plugins.plumber()

      .pipe plugins.jade
        pretty: true
        basedir: 'node_modules'

      .pipe plugins.rename
        basename: if process.env.NODE_ENV == 'dev' then 'index' else 'mindex'
        extname: '.html'

      .pipe gulp.dest paths.dest

  return
