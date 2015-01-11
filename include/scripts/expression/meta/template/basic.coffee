# Expression Meta-Template: 
# Basic
#
# A very simple metatemplate that applies a top-level wrapper to templates with classes based on entity properties

module.exports = (template, params) ->
    "<div class=\"{{entity.type}} {{entity.type}}-{{entity.id}}\">#{template}</div>"
