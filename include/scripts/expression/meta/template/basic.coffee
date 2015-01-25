###
# Expression Meta-Template: 
# Basic
# 
# A very simple metatemplate that applies a top-level wrapper to templates with classes based on entity properties
# 
###

# A meta-template like this may contain a (params) argument after (template) but none is needed here.

module.exports = (template) ->
    "<div class=\"{{entity.type}} {{entity.type}}-{{entity.id}}\">#{template}</div>"
