chai = require 'chai'
fs = require 'fs'
chai.should()

selectorRandom = require '../include/scripts/selector/random'

describe 'Selector: Random selector', ->
    it 'should be a function', ->
        selectorRandom.should.be.a 'function'
    
    it '...that may take an array and return one of its members', ->
        selectorRandom([ 'a', 'a', 'a' ]).should.equal 'a'

    it '...or may take an object and return one of its members', ->
        selectorRandom({ first: 'a', second: 'a', third: 'a' }).should.equal 'a'
