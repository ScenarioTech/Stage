# Gulpfile for development and production builds
#
# The production build "gulp pro" is compressed, the development build "gulp dev" isn't

gulp = require 'gulp'
fs = require 'fs'

webpack = require 'gulp-webpack'
webpackPrime = require 'webpack'
webpackPluginUglify = new webpackPrime.optimize.UglifyJsPlugin()

less = require 'gulp-less'
lessPluginCleanCSS = require 'less-plugin-clean-css'
cleanCss = new lessPluginCleanCSS { advanced: true }

sourcePath = './src'
outPath = './out'

stageNames = fs.readdirSync sourcePath
webpackEntries = {}

runBuild = () ->
    gulp.task 'dev', () =>
        gulp.src sourcePath + '/**/stage.*'
            .pipe webpack {
                context: "#{__dirname}/"

                entry: webpackEntries

                module:
                    loaders: [ { test: /\.coffee$/, loader: "coffee" } ]

                resolve:
                    extensions: [ '', '.js', '.coffee' ]
                
                output:
                    filename: './[name]/stage.js'
            }
            .pipe gulp.dest outPath

        gulp.src './src/**/stage.less'
            .pipe less {}
            .pipe gulp.dest outPath

    gulp.task 'pro', () =>
        gulp.src sourcePath + '/**/stage.*'
            .pipe webpack {
                context: "#{__dirname}/"

                entry: webpackEntries

                module:
                    loaders: [ { test: /\.coffee$/, loader: "coffee" } ]

                resolve:
                    extensions: [ '', '.js', '.coffee' ]
                
                plugins: [ webpackPluginUglify ] 
                
                output:
                    filename: './[name]/stage.js'
            }
            .pipe gulp.dest outPath

        gulp.src sourcePath + '/**/stage.less'
            .pipe less {
                plugins: [ cleanCss ]
            }
            .pipe gulp.dest outPath

for x in [0..(stageNames.length - 1)]
    if fs.existsSync sourcePath + "/#{stageNames[x]}/stage.coffee"
        webpackEntries[stageNames[x]] = sourcePath + "/#{stageNames[x]}/stage.coffee"

    if fs.existsSync sourcePath + "/#{stageNames[x]}/stage.js"
        webpackEntries[stageNames[x]] = sourcePath + "/#{stageNames[x]}/stage.js"
        
    if x is (stageNames.length - 1)
        runBuild()
