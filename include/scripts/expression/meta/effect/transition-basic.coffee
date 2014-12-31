# a meta-effect used for manifesting transitions
# values representing the transition's progress are derived and sent to the effect

module.exports = (effect, params) ->

    returnEffect = (effectParams) ->
        transConfig = params.transConfig
        
        transData = @effectParams.data.transitionData
        effectParams.element = @effectParams.element
        effectParams.transData = transData

        # set the curtain appear/rise states to 1 if the time requirements are 0 to prevent a divide by 0 error below
        if params.transConfig.curtain.timeToAppear > 0
            transData.curtain.appeared = 0
        else
            transData.curtain.appeared = 1
        if params.transConfig.curtain.timeToRise > 0
            transData.curtain.risen = 0
        else 
            transData.curtain.risen = 1
        
        transData.curtain.playbackOngoing = false
        transData.curtain.active = false
        transData.time = 0
        
        refresh = () ->
            transData.time += params.transConfig.updateInterval
            
            if transData.curtain.appeared < 1
                transData.curtain.appeared += (params.transConfig.updateInterval / params.transConfig.curtain.timeToAppear)
                if transData.curtain.appeared > 1
                    transData.curtain.appeared = 1
            
            if transData.curtain.appeared < 1 # the curtain effect has not appeared fully yet and the curtain has not started to rise
                if !params.transConfig.curtainBlocks and !transData.curtain.active
                    transData.curtain.active = true
            
            else # the curtain has appeared fully
                if !transData.curtain.active # if the curtain isn't active yet, make it so
                    transData.curtain.active = true
                
                if transData.completed >= transData.total # all items are finished loading
                    
                    if params.transConfig.curtain.playWhileRising and !transData.curtain.playbackOngoing
                        effectParams.finish()
                        transData.curtain.playbackOngoing = true
                    
                    if transData.curtain.risen < 1
                        transData.curtain.risen += (params.transConfig.updateInterval / params.transConfig.curtain.timeToRise)
                    
                    if transData.curtain.risen >= 1 # the curtain has risen all the way
                        if transData.curtain.risen > 1
                            transData.curtain.risen = 1
                        transData.curtain.isRisen = true

                        clearInterval ti # stop running this function and proceed with the scenario
                        if !params.transConfig.curtain.playWhileRising
                            effectParams.finish()

            if typeof effectParams.update is 'function'
                effectParams.update()
            
            effect effectParams

        ti = setInterval refresh, params.transConfig.updateInterval
    
    returnEffect
