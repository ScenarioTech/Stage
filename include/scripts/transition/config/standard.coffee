###
# Transition Config:
# Standard
# 
# This is the standard configuration for stage transition effects.
# It specifies half a second's time for the curtain to rise and fall and a 60FPS framerate for animations.
# 
###

module.exports =
    updateInterval: 16.666666 # 60FPS
    curtainBlocks: true
    dataManifestor: null
    curtain:
        timeToAppear: 500
        timeToRise: 500
        transferable: false # if true, the curtain can seamlessly proceed from an appearing state to a rising state
        playWhileRising: false # if true, the scenario starts and plays as the curtain is rising
