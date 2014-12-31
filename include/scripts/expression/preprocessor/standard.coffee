module.exports = (expression, params) ->

    processExpression = (exp) ->
        # each expression uses this function to set up a configuration for its effect method
        exp.setupEffect = (data, element) ->
            @effectParams =
                data: data
                element: element

        if typeof exp.template is 'function'
            exp.template = exp.template params.template.params

        if params.template
            if params.template.meta and typeof params.template.meta.method is 'function'
                exp.template = params.template.meta.method exp.template, params.template.meta.params

        if typeof exp.effect is 'object' and typeof exp.effect.generate is 'function'
            exp.effect = exp.effect.generate params.effect.params
        
        if params.effect
            if params.effect.meta and typeof params.effect.meta.method is 'function'
                exp.effect = params.effect.meta.method exp.effect, params.effect.meta.params
        exp

    templateKeys = Object.keys expression

    # if there is only one template, use it
    # a multiplexed expression - i.e. an expression with multiple possible sub-expressions - must not use the key "template" to refer to one of the sub-expressions
    # since the presence of that key is used to determine whether or not the expression is multiplexed
    if expression.template
        processExpression expression
        
    # if there is only one sub-expression for some reason, return it
    else if templateKeys.length is 1
        processExpression expression[templateKeys[0]]
    
    # if a selector function is present in the params, use it
    else if params.selector and typeof params.selector.method is 'function'
        processExpression params.selector.method expression, params.selector.params
    
    # otherwise just grab the first template from the list provided
    else
        processExpression expression[templateKeys[0]]
