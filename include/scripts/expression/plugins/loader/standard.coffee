module.exports = (template, plugins, params) ->
    for x in [0..(plugins.length - 1)]
        template = plugins[x] template, params
        
        if x is (plugins.length - 1)
            template
