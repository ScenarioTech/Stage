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

###
module.exports =
    updateInterval: 16.666666 # 60FPS
    curtainBlocks: true
    dataManifestor: null
    curtain:
        timeToAppear: 2000
        timeToRise: 500
        transferable: false # if true, the curtain can seamlessly proceed from an appearing state to a rising state
        playWhileRising: false # if true, the scenario starts and plays as the curtain is rising
###
