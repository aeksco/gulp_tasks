gulp    = require 'gulp'
plugins = require '../config/plugins'

# # # # #

coffeeHelpers =

  # getNPMPackageIds: -> # Read package.json and get 'dependencies' package ids
  #   packageManifest = {}
  #   try
  #     packageManifest = require('../../package.json')
  #   catch e # package.json not found
  #   plugins._.keys(packageManifest.dependencies) or []

  # # # # #

  genBrowserifyBundle: (paths, config) ->

    # Entries (DEV)
    if process.env.NODE_ENV == 'dev'
      entries     = config.entries
      devEntries  = config.devEntries || []
      entries     = entries.concat(devEntries)

    # Entries (BUILD / PROD)
    else
      entries = config.entries

    # New Browserify
    bundle = plugins.browserify
      # basedir:        config.basedir
      # commondir:      config.basedir
      entries:        entries
      debug:          config.debug
      extensions:     config.extensions
      paths:          config.paths
      bundleExternal: config.bundleExternal

    # Jade Transform
    if plugins._.indexOf( config.extensions, '.jade' ) != -1
      bundle.transform plugins.jadeify,
        runtimePath: require.resolve('jade/runtime')
        compileDebug: true
        pretty: false
        basedir: paths.nodeModules

    # Coffee Transform
    if plugins._.indexOf( config.extensions, '.coffee' ) != -1
      bundle.transform plugins.coffeeify,
        bare: false
        header: false

    # External Bundles
    # if config.externalBundles?.length > 0
    #   bundle.external( config.externalBundles )

    # Ignore Modules
    # QUESTION - how do we want to do this?
    # if config.ignoreModules?.length > 0
      # config.ignoreModules.forEach (module) => bundle.ignore(module)

    # Include cm_libs
    # TODO - this can be simplified once we include cm_libs in package.json.
    # if config.includeLibs
    #   bundle.require( paths.nodeModules + 'cm_libs/js/', { expose: 'CM' } )

    # Exclude NPM (vendor bundles)
    # if config.excludeNpm
    #   @getNPMPackageIds().forEach (id) => bundle.exclude(id) unless id == 'cm_ui'

    # Add dependencies from package.json
    # TODO - we want to retire this in favor of a more generalized vendor bundle,
    # allowing us to keep build-specific dependencies bundled with their respective builds.
    # if config.bundleNpm
    #   @getNPMPackageIds().forEach (id) => bundle.require(plugins.resolve.sync(id), { expose: id }) unless id == 'cm_ui'

    return bundle

# # # # #

module.exports = coffeeHelpers
