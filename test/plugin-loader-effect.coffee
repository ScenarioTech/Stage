chai = require 'chai'
fs = require 'fs'
chai.should()

pluginLoader = require '../include/scripts/expression/plugins/loader/effect/standard'

describe 'Plugin Loader.Effect.Standard: An effect with plugins applied by the standard effect plugin loader', ->

    testString = ""

    effect = (params) ->
        if params.parentParams.hooks and params.parentParams.hooks.start
            params.parentParams.hooks.start()
        
        testString += "Hello"
        
        if params.parentParams.hooks and params.parentParams.hooks.end
            params.parentParams.hooks.end()
    
    hooks =
        start: [ (params) -> testString += "Test " ]
        end: [ (params) -> testString += " Test2" ]
        
    # a parentParams property is expected
    params =
        parentParams: {}
    
    it 'should return an effect function consisting of the plugin hooks applied to the original effect function through the params.hooks methods', ->
        pluginLoader effect, hooks, params
        effect params
        testString.should.equal 'Test Hello Test2'
