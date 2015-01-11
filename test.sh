#!/bin/bash
# Run tests using CoffeeScript compiler

mocha --require coffee-script/register --compilers coffee:coffee-script/register
