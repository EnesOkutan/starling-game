package {

import events.NavigationEvent;

import layouts.EmbeddedAssets;
import layouts.components.screen.Welcome;
import layouts.components.screen.Wheel;

import starling.display.Sprite;
import starling.utils.AssetManager;

import starlingbuilder.engine.DefaultAssetMediator;
import starlingbuilder.engine.IUIBuilder;
import starlingbuilder.engine.UIBuilder;

public class Game extends Sprite {

    public static var uiBuilder:IUIBuilder;
    public static var assetManager:AssetManager;

    private var screenWelcome:Welcome
    private var screenGame:Wheel

    public function Game() {

        assetManager = new AssetManager();
        uiBuilder = new UIBuilder(new DefaultAssetMediator(assetManager));

        assetManager.enqueue(EmbeddedAssets);
        assetManager.loadQueue(function(ratio:Number):void{
            if (ratio == 1)
            {
                init();
            }
        });
    }

    private function init():void
    {

        this.addEventListener(NavigationEvent.CHANGE_SCREEN, onchangeScreen)

        screenGame = new Wheel()
        screenGame.disposeTemporarily()
        this.addChild(screenGame)

        screenWelcome = new Welcome()
        this.addChild(screenWelcome);
    }

    private function onchangeScreen(event:NavigationEvent):void {
        switch (event.params.id) {
            case "play":
                screenWelcome.disposeTemporarily()
                screenGame.initialize()
                break
        }
    }


}
}
