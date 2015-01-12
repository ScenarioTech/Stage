<!-- TITLE/ -->

# Scenario Stage Builder

<!-- /TITLE -->

This is a tool used to construct stages for use with interactive scenarios created using the Scenario Engine. A scenario stage is the medium through which scenario content is presented to users. If you're working on a scenario, you'll often want to create a stage to accompany it and convey your vision to the people who experience your scenario.

## The First Step: Building A Demo Stage

To get started using the build tools, first enter the repo directory and install the dependencies:

```
npm install
```

Then, to build the demo stage enter:

```
gulp dev
```

This will invoke the development build process. The generated Javascript and CSS files will be uncompressed. If you have a scenario ready to go into production, you should use:

```
gulp pro
```

This will generate compressed Javascript and CSS files.

After you run the build process, you will notice that the **out/** directory now contains a **demo/** directory like the one found in **src/**. The files inside are Javascript and CSS files compiled from the sources in the **src/demo/** directory.

Now that you understand how the build system works, you can try creating a stage of your own.


## Creating Your First Stage

The source files for each stage are located in **src/**. Add a directory there named for your stage, like **src/mystage/**. 

```
mkdir src/mystage
```

Stage names should consist of lowercase letters, digits and underscores, like the names of scenarios. In many cases, you will want your stage name to be the same as your scenario's name. Once you have created your stage directory, you should create...

### An Expression Model: stage.coffee (or .js)

An expression model is a script file with either the .coffee (CoffeeScript) or .js (JavaScript) extension. It contains the expression templates and effects that will be available for use by scenario elements.

Typically, your expression model will include files from the **include/scripts/stage/** directory to provide for its templates and effects. CoffeeScript is recommended, but use Javascript if you like.

### A Stylesheet: stage.less

A .less file that will be used to compile the stage's CSS styles. This .less file typically includes files from the **include/styles/stage/** directory.

## Going Into Production

Once you have generated your production code with "gulp pro" your code is ready for live use. Sync the contents of your **out/** folder with your scenario media CDN of choice.

### Testing

To run the scenario stage test suite in a *nix environment, just run:

```
./test.sh
```

### Guide to Contents

The directory **src/** contains each stage's source file directory. These source files typically reference standard modules and other resources that can be found in **include/**. Once built, elements of a scenario stage are written to that stage's directory in **out/**. Mocha/Chai unit tests for the stage system components can be found in **test/**.
