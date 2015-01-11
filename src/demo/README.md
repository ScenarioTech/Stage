<!-- TITLE/ -->

# Scenario Stage Sample Template

<!-- /TITLE -->

The files here demonstrate the construction of a simple scenario stage. Most stages are defined by two files: stage.coffee (or stage.js if using JavaScript) and stage.less.

### stage.coffee

This file is compiled to stage.js using the webpack system for building client-side Javascript modules. It contains all expressions and their component templates and effects. Often, as is the case here, the stage.coffee file is a link to a file in the include/reference/scripts directory. That directory contains common scripts for use by stage designers. In this case, the linked script's only function is to invoke the 'basic' stage expression builder script in the include/scripts directory. This script pulls together components from elsewhere in the include/scripts hierarchy to create a simple scenario stage expression. More documentation can be found within include/scripts.

### stage.less

This is the top-level style template for this stage. Typically, stage.less includes many LESS templates from the includes/styles directory, then adds on a few more unique styles.
