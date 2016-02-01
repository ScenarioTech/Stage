###
# Expression Template:
# Standard Stage Element
# 
# A basic stage element template. Includes a media container class to hold cue images and a dialog box.
# The effect manifests a scrollbar in the dialog box if there is too much content to fit at once.
# 
###

module.exports =
    template: """
    <div class="element-inner">
        <!-- hook.head -->
        <div ng-repeat="(emKey, emValue) in entity.aspects.prime.components.media" ng-class="{ 'image-holder' : emValue.subtype === 'images' }">
            <!-- hook.imagesHead -->
            <div ng-if="emValue.subtype === 'images'" class="image image-{{emKey}}" style="background-image: url('{{emValue.items[emValue.index.i].src.def}}');"></div>
            <div
                ng-if="emValue.subtype === 'svg' && emValue.items[emValue.index.i] && emValue.items[emValue.index.i].src.def"
                class="svg svg-{{emKey}}"
                ng-include="emValue.items[emValue.index.i].src.def"
            ></div>
            <!-- hook.imagesFoot -->
        </div>

        <div class="dialog-holder">
            <div class="dialog" ng-class="{ paused: state.paused }">
                <!-- hook.dialogHead -->

                <p class="statement" ng-if="entity.aspects.prime.features.text.dialog">
                    <span ng-bind-html="entity.aspects.prime.features.text.dialog"></span>
                </p>

                <input class="entity-input" name="text_input-{{entity.id}}" ng-if="state.inputActive" ng-model="state.inputData[entity.id]" />
                <button class="entity-submit" name="submit-{{entity.id}}" ng-if="state.inputActive" ng-click="scenarioOps.enterInput(state.inputData)">Ok</button>

                <p ng-if="entity.aspects.option.length > 0 && entity.compo.properties.replyHeading" ng-bind-html="entity.compo.properties.replyHeading"></p>

                <ol class="responses">
                    <li ng-repeat="optionItem in entity.aspects.option" ng-click="scenarioOps.choosePath(optionItem.i)">
                        <span class="opix">{{$index+1}}.</span> <span ng-bind-html="optionItem.features.text.option"></span>
                    </li>
                </ol>

                <!-- hook.dialogFoot -->
            </div>
        </div>
        <!-- hook.foot -->
    </div>
    """

    effect:
        generate: (params) ->
            fx = (directParams) ->
                if params and params.hooks and typeof params.hooks.start is 'function'
                    params.hooks.start @effectParams, directParams

                if params and params.hooks and typeof params.hooks.end is 'function'
                    params.hooks.end @effectParams, directParams
            fx
