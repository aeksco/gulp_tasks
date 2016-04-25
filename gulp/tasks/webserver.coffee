
# Webserver Task w/ LiveReload
module.exports = (gulp, paths, plugins, port=8080) ->
  gulp.task 'webserver', ->
    gulp.src paths.dest
      .pipe plugins.webserver
        livereload: true
        port: port

  return
