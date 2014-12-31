<!-- TITLE/ -->

## include/: Common Files for Building the Scenario Stage

<!-- /TITLE -->

Here you will find directories containing scripts and styles that serve as the basic elements of a scenario stage.

### reference/

Contains scripts and styles linked from src/ folders. These scripts and styles are typically simple, meant to form a link between the src/ folders and resources in the scripts/ and styles/ folders described below.

### scripts/

Contains CoffeeScript and Javascript libraries linked together using CommonJS. These scripts are used to generate scenario expressions with their templates and effects.

### styles/

Contains LESS stylesheet files that are linked and compiled into CSS. These styles are applied to the HTML templates provided by the scenario expressions.

### vendor/

This directory contains whatever vendor-provided files are included in the scenario stage files.
