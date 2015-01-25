###
# Stage Build Script:
# Basic
# 
# A typical top-level stage build script. Includes common expression components and builds the template and effect for each expression.
# 
###

pluginLoader = require __dirname + '/expression/plugins/loader/standard'

curtainExpr = require __dirname + '/expression/curtain-standard'
elementExpr = require __dirname + '/expression/element-standard'
mediaExpr = require __dirname + '/expression/media-standard'
expressionsPrepro = require __dirname + '/expression/preprocessor/standard'

commonMetaTemplate = require __dirname + '/expression/meta/template/basic'
transitionMetaEffect =  require __dirname + '/expression/meta/effect/transition-basic'

nextArrowGlyphPlugin = require __dirname + '/expression/plugins/template/glyph-arrow-next'

randomSelector =  require __dirname + '/selector/random'
transConfig = require __dirname + '/transition/config/standard'

module.exports =
    element_elCurtain: expressionsPrepro curtainExpr, {
        template:
            meta:
                method: commonMetaTemplate
                params: null
        effect:
            meta:
                method: transitionMetaEffect
                params:
                    transConfig: transConfig
        selector:
            method: randomSelector
            params: null
    }

    element: expressionsPrepro elementExpr, {
        template:
            meta:
                method: commonMetaTemplate
            plugins:
                loader: pluginLoader
                items: [ nextArrowGlyphPlugin ]
                params: {}
    }
    
    media_images: expressionsPrepro mediaExpr, {
        template:
            meta:
                method: commonMetaTemplate
    }
