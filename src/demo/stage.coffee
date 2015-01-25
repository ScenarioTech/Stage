###
# This is a typical top-level stage build script.
# 
###

# Require the stage medium builder class from the script reference directory.
# Most stages use a class like this as a common foundation.
builder = require './../../include/reference/scripts/medium/build-simple'

# Include common expressions.
curtainExpr = require './../../include/scripts/expression/curtain-standard'
elementExpr = require './../../include/scripts/expression/element-standard'
mediaExpr = require './../../include/scripts/expression/media-standard'

# A common meta-template that wraps the expression template in tags that identify it as a whole.
commonMetaTemplate = require './../../include/scripts/expression/meta/template/basic'

# An effect that visually manifests transitions within the scenario -- it is most commonly used as a loading indicator.
transitionMetaEffect =  require './../../include/scripts/expression/meta/effect/transition-basic'

# A template plugin used to manifest a glyph that appears to indicate when the player may click to advance to the next piece of dialog.
nextArrowGlyphPlugin = require './../../include/scripts/expression/plugins/template/glyph-arrow-next'

# An effect plugin used to manifest the "perfect scrollbar" from the vendor library of that name
perfectScrollbarEffectPlugin = require './../../include/scripts/expression/plugins/effect/perfect-scrollbar'

# A selector that picks a random member of a multiplexed expression
randomSelector =  require './../../include/scripts/selector/random'

# A configuration for the transition manifestor/plugin loader included above
transConfig = require './../../include/scripts/transition/config/standard'

myBuilder = new builder()

# Generate the stage medium using the expressions included above and a function from the stage medium builder class.
myBuilder.generateMedium {
    element_elCurtain:
        expression: curtainExpr
        params:
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

    element:
        expression: elementExpr
        params:
            template:
                meta:
                    method: commonMetaTemplate
                plugins:
                    hooks:
                        dialogFoot: [ nextArrowGlyphPlugin ]
                    params: {}
            effect:
                plugins:
                    hooks:
                        start: [ perfectScrollbarEffectPlugin ]
                    params: {}
                params: {}

    media_images:
        expression: mediaExpr
        params:
            template:
                meta:
                    method: commonMetaTemplate
}

# Add the medium to the window DOM
myBuilder.loadMedium()
