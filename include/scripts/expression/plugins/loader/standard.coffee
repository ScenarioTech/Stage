# Expression Plugin Loader: 
# Basic
#
# Loads template plugins, implementing hooks

module.exports = (template, plugins, params) ->
    if !params.templateHooks
        params.templateHooks = []
        
    # this list contains the possible IDs for template hooks:

    templateHookIds = [ 'head', 'foot', 'dialogHead', 'dialogFoot' ]    
    
    # template hooks take the form of an HTML comment containing the hook ID like this:
    # <!-- hook.hookId -->
    # these comment strings are replaced with the aggregate text of the template plugins below
    
    for x in [0..(templateHookIds.length - 1)]
        if !params.templateHooks[templateHookIds[x]] or typeof params.templateHooks[templateHookIds[x]] isnt 'string'
            params.templateHooks[templateHookIds[x]] = ''
    
    for x in [0..(plugins.length - 1)]
        plugins[x] template, params
                    
    for x in [0..(templateHookIds.length - 1)]
        template = template.replace "<!-- hook.#{templateHookIds[x]} -->", '\n' + params.templateHooks[templateHookIds[x]] + '\n'

    template
