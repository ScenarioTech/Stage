chai = require 'chai'
chai.should()

utils =
    testEffect: (effect, params) ->
        fx = ->
            'Meta-effect: ' + effect()

    getTestParams: ->
        completed: 0
        portion: 0
        number: 5
        total: 5
        time: 0
        curtain:
            # these values range from 0 to 1, representing the extent to which the curtain has appeared/risen
            appeared: 0
            risen: 0
            isRisen: false
            playbackOngoing: false
            active: false
    
    sampleTransitionConfig:
        updateInterval: 1
        curtainBlocks: true
        dataManifestor: null
        curtain:
            timeToAppear: 5
            timeToRise: 1
            transferable: false # if true, the curtain can seamlessly proceed from an appearing state to a rising state
            playWhileRising: false # if true, the scenario starts and plays as the curtain is rising
    
metaEffects =
    transition: require '../include/scripts/expression/meta/effect/transition-basic'

describe 'Meta-effects: The transition meta-effect "transition-basic"', ->
    testEffect = (params) ->
        if params.done and !params.doneCalled and params.data is "Testing."
            params.doneCalled = true
            
            # set the curtain.appeared to 1 
            params.transData.curtain.appeared = 1
            #params.transData.curtain.active = true
            params.transData.completed += 1
            params.done()

    testEffect2 = (params) ->
        params.transData.completed += 1

    testObj =
        effectParams:
            data: null
            element: "TEST"
        transConfig: utils.sampleTransitionConfig
        metaOutput: metaEffects.transition testEffect, { transConfig: utils.sampleTransitionConfig }

    it 'should return a function', ->
        testObj.metaOutput.should.be.a 'function'

    it '...which repeats the function passed to the meta-effect as its first parameter while the transition is ongoing and finishes when the number of transition items complete equals the item total', (done) ->
        testObj.effectParams.data = { transitionData: utils.getTestParams() }
        testObj.metaOutput = metaEffects.transition testEffect2, { transConfig: utils.sampleTransitionConfig }
        fxOutput = testObj.metaOutput {
            data: 'Testing.'
            done: done
            doneCalled: false
            update: ->
            finish: ->
                if testObj.effectParams.data.transitionData.completed is testObj.effectParams.data.transitionData.total
                    done()
        }

    it '...and also repeats the function passed by the "update" parameter when invoking the effect while the transition is ongoing', (done) ->
        testObj.effectParams.data = { transitionData: utils.getTestParams() }
        testObj.effectParams.data.transitionData.updateRepeatCounter = 0;
        testObj.metaOutput = metaEffects.transition testEffect2, { transConfig: utils.sampleTransitionConfig }
        fxOutput = testObj.metaOutput {
            data: "Testing."
            done: done
            doneCalled: false
            update: ->
                testObj.effectParams.data.transitionData.updateRepeatCounter += 1
            finish: ->
                if testObj.effectParams.data.transitionData.updateRepeatCounter is testObj.effectParams.data.transitionData.completed
                    done()
        }

    it '...and calls the function passed by the "finish" parameter when the transition is complete', (done) ->
        testObj.effectParams.data = { transitionData: utils.getTestParams() }
        testObj.effectParams.data.transitionData.updateRepeatCounter = 0;
        testObj.metaOutput = metaEffects.transition testEffect2, { transConfig: utils.sampleTransitionConfig }
        fxOutput = testObj.metaOutput {
            data: "Testing."
            done: done
            doneCalled: false
            update: ->
            finish: ->
                done()
        }

    it '...and encapsulating a second function that takes as an argument the data sent to the meta-effect function', (done) ->
        testObj.effectParams.data = { transitionData: utils.getTestParams() }
        testObj.metaOutput = metaEffects.transition testEffect, { transConfig: utils.sampleTransitionConfig }

        fxOutput = testObj.metaOutput {
            data: "Testing."
            done: done
            doneCalled: false
            update: ->
                #console.log "UPD1"
                #console.log testObj.effectParams.data.transitionData.completed
            finish: ->
                #console.log "FIN"
                #console.log testObj.effectParams.data.transitionData.completed
                done()
        }

    it '...that calls a function passed with the parameter "finish" when done', (done) ->
        testObj.effectParams.data = { transitionData: utils.getTestParams() }
        testObj.metaOutput = metaEffects.transition testEffect2, { transConfig: utils.sampleTransitionConfig }

        fxOutput = testObj.metaOutput {
            data: "Testing."
            done: done
            doneCalled: false
            update: ->
                #console.log "UPD2"
                #console.log testObj.effectParams.data.transitionData.completed
            finish: ->
                #console.log "DONE"
                done()
        }
