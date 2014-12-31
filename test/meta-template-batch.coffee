chai = require 'chai'
fs = require 'fs'
chai.should()

mtemps = {}

utils =
    sampleTemplateInput: '<div></div>'

# for some reason, this must be done synchronously
files = fs.readdirSync './include/scripts/expression/meta/template/'

templateOutput = {}

for temp in files
    do (temp) ->
        if temp.substr(-7) is '.coffee'
            mtemps[temp] = require '../include/scripts/expression/meta/template/' + temp
            describe 'Meta-template: ' + temp.replace('.coffee', ''), ->
                templateOutput[temp] = mtemps[temp](utils.sampleTemplateInput, {})
                it 'should be a function', ->
                    mtemps[temp].should.be.a 'function'
                
                it '...that returns a string', ->
                    templateOutput[temp].should.be.a 'string'

