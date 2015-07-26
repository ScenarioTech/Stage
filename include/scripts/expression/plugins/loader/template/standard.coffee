###
# Expression Plugin Loader: 
# Basic
# 
# Loads template plugins, implementing hooks
# 
###

module.exports = (template, hooks, params) ->
    if !params.templateHooks
        params.templateHooks = []
        
    # this list contains the possible IDs for template hooks:

    templateHookIds = [ 'head', 'foot', 'dialogHead', 'dialogFoot' ]
    
    # template hooks take the form of an HTML comment containing the hook ID like this:
    # <!-- hook.hookId -->
    # these comment strings are replaced with the aggregate text of the template plugins below
    
    for hookId in templateHookIds
        if !params.templateHooks[hookId] or typeof params.templateHooks[hookId] isnt 'string'
            params.templateHooks[hookId] = ''
        
        if hooks[hookId]
            for hookMethod in hooks[hookId]
                params.templateHooks[hookId] += hookMethod template, params
                    
        template = template.replace "<!-- hook.#{hookId} -->", '\n' + params.templateHooks[hookId] + '\n'

    template
