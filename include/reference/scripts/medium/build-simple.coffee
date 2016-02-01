###
# Stage Build Script:
# Basic
# 
# A typical top-level stage build script. Includes common expression components and builds the template and effect for each expression.
# 
###

class builder
    constructor: ->
        @medium = {}

        @expPrep = require './../../../../include/scripts/expression/preprocessor/standard'
        @templatePluginLoader = require './../../../../include/scripts/expression/plugins/loader/template/standard'
        @effectPluginLoader = require './../../../../include/scripts/expression/plugins/loader/effect/standard'

    generateMedium: (exps) ->
        for expId, expContent of exps
            if expContent.params.template and expContent.params.template.plugins
                expContent.params.template.plugins.loader = @templatePluginLoader

            if expContent.params.effect and expContent.params.effect.plugins
                expContent.params.effect.plugins.loader = @effectPluginLoader

            # copy the base expression template with $.extend so it can be used in its original form by subsequent expressions
            @medium[expId] = @expPrep $.extend(true, {}, expContent.expression), expContent.params

    loadMedium: (callback) ->
        window.scenarioMedium = @medium
        
        if callback
            callback()

module.exports = builder
 
