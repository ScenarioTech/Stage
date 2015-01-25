chai = require 'chai'
fs = require 'fs'
chai.should()

pluginLoader = require '../include/scripts/expression/plugins/loader/template/standard'

describe 'Plugin Loader.Template.Standard: A template with plugins applied by the standard template plugin loader', ->

    template = '<body><!-- hook.head --> <dialog><!-- hook.dialogHead --> <!-- hook.dialogFoot --></dialog> <!-- hook.foot --></body>'
    template2 = '<body><!-- hook.head --> <dialog><!-- hook.dialogHead --> <!-- hook.dialogFoot --></dialog> <!-- hook.foot --></body>'
    
    hooks =
        head: [ 
            (template, params) -> 
                "Test1" + params.test
            
            (template, params) -> 
                " TestA"
        ]
        foot: [ (template, params) -> "Test2" + params.test ]
        dialogHead: [ (template, params) -> "Test3" + params.test ]
        dialogFoot: [ (template, params) -> "Test4" + params.test ]

    params =
        test: "x"

    # may want to divide this into multiple sub-tests
    it 'should return a template consisting of the plugin hooks applied to the original template through replacement of the <!-- hook.x --> comments, concatenating the results of multiple member functions of a hook array in the order of those functions\' inclusion in the hook array', ->
        pluggedTemplate = pluginLoader template, hooks, params
        pluggedTemplate.should.equal """
        <body>
        Test1x TestA
         <dialog>
        Test3x
         
        Test4x
        </dialog> 
        Test2x
        </body>
        """
