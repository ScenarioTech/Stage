chai = require 'chai'
chai.should()

utils =
    commonMetaTemplate: (template, params) ->
        "<div class=\"templateShell\">#{template}</div>"
    
    commonMetaEffect: (effect, params) ->
        fx = ->
            'Meta-effect: ' + effect()

    setupEffectSampleParams:
        data: 'Arbitrary Data'
        element: 'Arbitrary Element'
    
sampleExpressions =
    basic:
        template: '<div style="width: 100%; height: 100%"> Test content.</div>'
        effect:
            fx = ->
                "Testing."

    intermediate:
        template: """
                <div style="width: 100%; height: 100%"> 
                    Test content.
                </div>
            """

        effect:
            generate: (params) ->
                fx = (fxParams, transData, element) ->
                    console.log "TEST"
                fx

expPreprocessor = require '../include/scripts/expression/preprocessor/standard'

describe 'Preprocessor.Standard: The object returned by the preprocessor', ->
    expression = 
        template: '<div>Test content.</div>'
        effect:
            fx = ->
                "Testing."
    processed = expPreprocessor expression, {}
    processed.setupEffect utils.setupEffectSampleParams.data, utils.setupEffectSampleParams.element

    it 'should be an object', ->
        processed.should.be.a 'object'

    it 'should have a template property', ->
        processed.should.have.property 'template'

    it '...that contains the text of the template passed in if no meta-template is implemented and the template is a string', ->
        processed.template.should.equal '<div>Test content.</div>'
    
    it 'should have an effect property', ->
        processed.should.have.property 'effect'

    it '...that is identical to the one in the expression if no meta-effect is implemented', ->
        processed.effect().should.equal 'Testing.'

    it 'should have a method called setupEffect', ->
        processed.should.have.property 'setupEffect'

    it '...which serves to create an effectParams property on the object', ->
        processed.should.have.property 'effectParams'
    
    it 'once setupEffect has been run, should have a property called data under effectParams', ->
        processed.effectParams.should.have.property 'data'

    it '...which contains the first property passed to setupEffect', ->
        processed.effectParams.data.should.equal 'Arbitrary Data'
    
    it 'once setupEffect has been run, should have a property called element under effectParams', ->
        processed.effectParams.should.have.property 'element', 

    it '...which contains the second property passed to setupEffect', ->
        processed.effectParams.element.should.equal 'Arbitrary Element'

describe 'Preprocessor.Standard: A preprocessed object with a meta-template and a meta-effect', ->
    expression = 
        template: '<div>Test content.</div>'
        effect:
            fx = ->
                "Testing."
    
    processed2 = expPreprocessor expression, {
        template:
            meta:
                method: utils.commonMetaTemplate
        effect:
            meta:
                method: utils.commonMetaEffect
    }

    it 'should return a template consisting of the meta-template applied to the original template', ->
        processed2.template.should.equal '<div class="templateShell"><div>Test content.</div></div>'
    
    it 'should return an effect function consisting of the original effect function wrapped with a meta-effect function', ->
        processed2.effect().should.equal 'Meta-effect: Testing.'


describe 'Preprocessor.Standard: A preprocessed object created from an expression with multiple sub-expressions', ->
    expression =
        first:
            template: '<div>Test content.</div>'
            effect:
                fx = ->
                    'Testing.'
        second:
            template: '<div>Second test content.</div>'
            effect:
                fx = ->
                    'Testing.'

    expression2 =
        first:
            template: '<div>Test content.</div>'
            effect:
                fx = ->
                    'Testing.'

    processed3 = expPreprocessor expression, {
        selector: 
            method: (exps, params) ->
                expKeys = Object.keys exps
                exps[expKeys[1]]
    }
    
    processed4 = expPreprocessor expression, {}
    processed5 = expPreprocessor expression2, {}

    it 'should be an object', ->
        processed3.should.be.a 'object'
    
    it 'should return the expression according to the selector function if a selector function and sub-expressions is present', ->
        processed3.template.should.equal '<div>Second test content.</div>'

    it 'should return the expression as the first sub-expression enumerated in Object.keys if a selector function is not present', ->
        processed4.template.should.equal '<div>Test content.</div>'

    it 'should return the expression as the sub-expression if for some reason there is only one sub-expression', ->
        processed5.template.should.equal '<div>Test content.</div>'

describe 'Preprocessor.Standard: A preprocessed object created from an expression with a template-generating function', ->
    expression =
        template: (params) ->
            "<div>#{params.test}</div>"
    
    processedEffectGen = expPreprocessor expression, {
        template:
            params:
                test: 'Generated Template Content'
    }

    it 'should be an object', ->
        processedEffectGen.should.be.a 'object'
    
    it 'should return an object with an effect property modified by the "generate" property of the prototype\'s "effect" property', ->
        processedEffectGen.template.should.be.a 'string'
        processedEffectGen.template.should.equal "<div>Generated Template Content</div>"

describe 'Preprocessor.Standard: A preprocessed object created from an expression with an effect generator', ->
    expression =
        template: '<div>Test content.</div>'
        effect:
            generate: (params) ->
                fx = ->
                    'Testing: ' + params.test
    
    processedEffectGen = expPreprocessor expression, {
        effect:
            params:
                test: 'Generator Test'
    }

    it 'should be an object', ->
        processedEffectGen.should.be.a 'object'

    it 'should return an object with an effect property modified by the "generate" property of the prototype\'s "effect" property', ->
        processedEffectGen.effect.should.be.a 'function'
        processedEffectGen.effect().should.equal 'Testing: Generator Test'

describe 'Preprocessor.Standard: When the preprocessor receives an expression with a template and a template plugin, it', ->

    expression =
        template: '<div>Test content.</div>'
        effect: 
            generate: (params) ->
                test = (testParams) ->
                    append = if params.testParam then params.testParam else ""
                    "Hello " + append

                test

    templatePluginLoader = (item, plugins, params) ->
        for thisPlugin in plugins
            item = thisPlugin item, params

    testTemplatePlugin = (template, params) ->
        template + "<append>#{params.test}</append>"
        
    effectPluginLoader = (item, plugins, params) ->
        for thisPlugin in plugins
            thisPlugin params

    testEffectPlugin = (params) ->
        params.parentParams.testParam = params.test

    processedEffectGen = expPreprocessor expression, {
        template:
            plugins:
                loader: templatePluginLoader
                hooks: [ testTemplatePlugin ]
                params: { test: 1 }
        effect:
            plugins:
                loader: effectPluginLoader
                hooks: [ testEffectPlugin ]
                params: { test: 2 }
    }

    it 'it should return a template object modified according to the plugins and the plugin loader', ->
        processedEffectGen.template[0].should.equal '<div>Test content.</div><append>1</append>'
       
    it 'it should return an effect object modified according to the plugins and the plugin loader', ->
        processedEffectGen.effect().should.equal 'Hello 2'
