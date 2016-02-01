###
# Effect Plugin:
# Switchable Elements
# 
# Facilitates the display of particular page elements by clicking on controls that appear on the page
# 
###

module.exports = (params) ->

    #$(document).ready ->
    setupElements = ->
        config = params.switchableElements

        # check whether jQuery is loaded and the configuration is present
        if config and window.$
            if config.controlContainerClass
                controlElements = $('.' + config.controlContainerClass).children()

                processControlElement = (ciIndex) ->
                    thisElement = controlElements[ciIndex]
                    if thisElement
                        $(thisElement).click ->
                            displayableElement = $('#' + $(@).attr('id').replace(config.controlIdSuffix, ''))
                            
                            if $(@)[0].className.split(/\s+/).indexOf(config.activeControlClass) isnt -1
                                $(@)[0].className = ""
                                displayableElement.hide()
                            else
                                $('.' + config.displayElementClass).hide()
                                controlElements = $('.' + config.controlContainerClass).children()
                                for x in [0..(controlElements.length - 1)]
                                    controlElements[x].className = ""

                                $(@)[0].className = config.activeControlClass
                                displayableElement.show()
                        
                        processControlElement (ciIndex + 1)
                    
                processControlElement 0

    setTimeout setupElements, 200
