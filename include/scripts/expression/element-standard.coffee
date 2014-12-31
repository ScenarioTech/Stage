module.exports =
    template: """
    <div class="image-holder" ng-repeat="(emKey, emValue) in entity.aspects.prime.components.media">
        <div
            ng-if="emValue.subtype === 'images'"
            class="image image-{{emKey}}"
            style="background-image: url('{{emValue.items[emValue.index.i].src.def}}');"
        ></div>
    </div>

    <div class="dialog" ng-class="{ paused: state.paused }">
        <p class="statement" ng-if="entity.content.prime.features.text.dialog">
            <span ng-if="compoConfig.properties.displayName">
                <span ng-bind-html="compoConfig.properties.displayName"></span>:
            </span>
            <span ng-bind-html="entity.content.prime.features.text.dialog"></span>
        </p>
        
        <input class="entity-input" name="text_input-{{entity.id}}" ng-if="state.inputActive" ng-model="state.inputData[entity.id]" />
        <button class="entity-submit" name="submit-{{entity.id}}" ng-if="state.inputActive" ng-click="scenarioOps.enterInput(state.inputData)">Ok</button>

        <p ng-if="entity.content.option.length > 0 && compoConfig.properties.replyHeading" ng-bind-html="compoConfig.properties.replyHeading"></p>

        <ol class="responses">
            <li ng-repeat="optionItem in entity.content.option" ng-click="scenarioOps.choosePath(optionItem.i)">
                <span class="opix">{{$index+1}}.</span> {{optionItem.features.text.option}}
            </li>
        </ol>
    </div>
    """