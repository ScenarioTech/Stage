<!-- TITLE/ -->

## include/scripts/expression/: Expression Templates and Tools

<!-- /TITLE -->

In this directory, the script files define standard expressions used in scenarios. An expression is composed of at least an HTML template, which defines the appearance of the element using the expression, and often an effect, a function used to modify the appearance and behavior of the expression in real time. 

Many expressions are singular, but some have multiple sub-expressions, each with their own template and optional effect. Only one of these sub-expressions can be expressed at a time, effectively taking the place of the main expression.

### meta/

Contains meta-templates and meta-effects. These functions are like wrappers for templates and effects, respectively. Meta-templates often take the form of HTML tags that wrap the HTML comprising the template, while meta-effects are functions that wrap around the main effect functions.

### preprocessor/

Contains methods that are used to preprocess effects before they are delivered to the scenario, applying meta-effects and meta-templates and using selector functions to select from sub-expressions if needed.
