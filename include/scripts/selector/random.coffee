###
# Sub-Expression Selector:
# Random
# 
# This selector picks a random member of an array or object.
# 
###

# A selector may contain a (params) argument after (ops) but none is needed here

module.exports = (ops) ->
    opKeys = Object.keys ops
    return ops[opKeys[Math.floor(Math.random() * opKeys.length)]]
