chai = require 'chai'
chai.should()

configs = 
    transition: require '../include/scripts/transition/config/standard'

utils =
    sampleEffect: (effect, params) ->
        fx = ->
            "Meta-effect: " + effect()

describe 'Config: The transition configuration', ->
    it 'should be an object', ->
        configs.transition.should.be.a 'object'
    
    it 'should include an update interval', ->  
        configs.transition.should.have.property 'updateInterval'
    
    it 'should include a "curtain" property', ->
        configs.transition.should.have.property 'curtain'
        
    it '...which should be an object', ->
        configs.transition.curtain.should.be.a 'object'
