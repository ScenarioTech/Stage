# a very basic metatemplate applied to each template provided by this class

module.exports = (template, params) ->
    "<div class=\"{{entity.type}} {{entity.type}}-{{entity.id}}\">#{template}</div>"
