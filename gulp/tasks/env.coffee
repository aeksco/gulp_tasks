
# Env Tasks
module.exports = (gulp, paths, plugins) ->
  gulp.task 'env_dev',   -> process.env.NODE_ENV = 'dev'
  gulp.task 'env_stage', -> process.env.NODE_ENV = 'stage'
  gulp.task 'env_prod',  -> process.env.NODE_ENV = 'prod'

  return
