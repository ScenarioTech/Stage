<!-- TITLE/ -->

## include/scripts/expression/plugins: Expression Template and Effect Plugins

<!-- /TITLE -->

This directory contains plugins for use with expression templates and effects. Plugins are discrete modules that can be attached to templates and effects, allowing them to be highly customized beyond their standard parameters. Templates and effects allow for the addition of plugins by way of hooks -- parts of their code that allow for the addition of plugins through a standard API. When adding a plugin to a template or effect, a developer generally must specify which hook it will attach to and what other parameters, if any, will be passed to it.

### effect/

Contains effect plugins. Effect plugins generally take the form of functions that are invoked by a functions within the parent effect that invoke them based on the hook they are associated with.

### loader/

Contains loader methods used to attach plugins to templates and effects.

### template/

Contains template plugins. These usually take the form of functions that produce text strings that are added . Generally, when multiple template plugins are attached to a single hook, the strings of text they produce are appended in series at the hook point.
