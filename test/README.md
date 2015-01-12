<!-- TITLE/ -->

# Scenario Stage Unit Tests

<!-- /TITLE -->

This directory contains unit test scripts for the stage constructor. They are described in more detail below.


## Discrete Test Suites

These tests are applied to specified resources within the stage builder system. 

### expression-preprocessor.coffee

Tests for the expression preprocessor. Meant to verify that the preprocessor correctly derives singular expressions from multiplexed expressions and applies meta-templates, meta-effects and plugins to the templates and effects found within expressions.

### meta-effects-common.coffee

Tests for the stage's meta-effects. They verify that the meta-effects can correctly encapsulate effects.

### selector.coffee

Tests for the selector functions used to derive singular expressions from multiplexed expressions.

### config-transition.coffee

Tests for the stage transition configurations, verifying that the configuration objects have all the necessary 


## Batch Test Suites

These tests are applied to all files matching a given path pattern. They are useful in that they will be automatically applied to all files in a particular location, which are meant to be all of a kind. You can test the basic properties of your newly created resources without having to write a line of code yourself.

### meta-template-batch.coffee

This is a batch test that checks each meta-template in the **include/scripts/expression/meta/template/** directory to verify that each one is correctly formatted for use as a meta-template. That means that each meta-template must be a function that produces a string.

### expression-batch.coffee

This is a batch test that checks each expression in the **include/scripts/expression/** directory, checking their validity as expressions. It checks for either singular expressions with "template" and possibly "effect" properties, or multiplexed expressions containing multiple properties with template and effect sub-properties.

