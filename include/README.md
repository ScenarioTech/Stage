<!-- TITLE/ -->

## include/: Common Files for Building the Scenario Stage

<!-- /TITLE -->

Here you will find directories containing scripts and styles that serve as the basic elements of a scenario stage.

### reference/

Contains scripts and styles that are intended to serve as convenient points of access to resources from the scripts/ and styles/ directories. These scripts make it easy for designers to include common sets of expressions in their stages.

### scripts/

Contains CoffeeScript and Javascript libraries linked together using CommonJS. These scripts are used to generate scenario expressions with their templates and effects.

### styles/

Contains LESS stylesheet files that are linked and compiled into CSS. These styles are applied to the HTML templates provided by the scenario expressions.

### vendor/

This directory contains whatever vendor-provided files are included with the scenario stage files. Often, these files are symlinks to files from modules installed via NPM or other resource packaging services in the root directory.
