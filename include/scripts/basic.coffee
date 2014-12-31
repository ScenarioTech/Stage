curtainExpr = require __dirname + "/expression/curtain-standard"
elementExpr = require __dirname + "/expression/element-standard"
mediaExpr = require __dirname + "/expression/media-standard"
expressionsPrepro = require  __dirname + "/expression/preprocessor/standard"

commonMetaTemplate = require __dirname + "/expression/meta/template/basic"
transitionMetaEffect =  require __dirname + "/expression/meta/effect/transition-basic"

randomSelector =  require __dirname + "/selector/random"
transConfig = require __dirname + "/transition/config/standard"

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
    }
    
    media_images: expressionsPrepro mediaExpr, {
        template:
            meta:
                method: commonMetaTemplate
    }