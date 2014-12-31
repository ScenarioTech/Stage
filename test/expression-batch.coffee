chai = require 'chai'
fs = require 'fs'
chai.should()

expressions = {}
portalIndex = 1

# for some reason, this must be done synchronously
files = fs.readdirSync "./include/scripts/expression"

for portal in files
    do (portal) ->
        if portal.substr(-7) is '.coffee'
            expressions[portal] = require "../include/scripts/expression/" + portal
            describe "Expression No. #{portalIndex}: " + portal.replace('.coffee', ''), ->
                portalIndex += 1
                
                evalExpression = (exp) ->
                    expKeys = Object.keys exp
                    if expKeys.length > 1
                        expKeys.should.include.members ["template", "effect"]
                        expKeys.length.should.not.be.above 2                
                    if typeof exp.template is 'string'
                        exp.template.should.be.a 'string'
                    else if typeof exp.template is 'function'
                        exp.template.should.be.a 'function'

                it 'should be an object', ->
                    expressions[portal].should.be.a 'object'
                    
                it 'should either have a "template" property (i.e. be a singular expression) and no other properties besides "effect"', ->
                    if expressions[portal].template
                        evalExpression expressions[portal]
                
                it '...or it should have a set of properties each with a "template" property (i.e. have sub-expressions) and no other properties besides "effect"', ->
                    if !expressions[portal].template
                        for subKey, subData of expressions[portal]
                            evalExpression expressions[portal][subKey]

                it 'if it has an "effect" property, that property should either be a function or an object containing a function under the property "generate"', ->
                    evalEffect = (effect) ->
                        if typeof effect is 'function'
                            effect.should.be.a 'function'
                        else if typeof effect is 'object'
                            effectKeys = Object.keys effect
                            effectKeys.length.should.equal 1
                            effect.generate.should.be.a 'function'
                    
                    if expressions[portal].template
                        evalEffect expressions[portal].effect

                    else
                        for subKey, subData of expressions[portal]
                            evalEffect expressions[portal][subKey].effect
                                
