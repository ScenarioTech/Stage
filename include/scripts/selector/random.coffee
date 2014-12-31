# fetch a random visualizer

module.exports = (exps, params) ->
    visKeys = Object.keys exps
    return exps[visKeys[Math.floor(Math.random() * visKeys.length)]]
