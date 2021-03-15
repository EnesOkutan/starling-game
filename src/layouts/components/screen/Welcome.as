package layouts.components.screen {
import events.NavigationEvent;

import layouts.EmbeddedLayouts;

import starling.core.Starling;
import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.utils.Align;

import util.Util;

public class Welcome extends Sprite {

    public var _root:Sprite;
    public var _sectors:Image;
    public var _startButton:Button;
    public var _startContainer:Sprite;
    public var _backgroundImage:Image

    public function Welcome() {

        super()

        Util.createBuilder(this, EmbeddedLayouts.welcome)

        setPosition()

        addChild(_root)

        initEvent()

    }

    private function onEnterFrame(e:Event) {
        _sectors.rotation += 0.1
    }

    private function startGame(e:Event) {

        this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true))

    }

    public function disposeTemporarily():void {
        this.visible = false
        if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, onEnterFrame)
    }

    private function setPosition():void {
        var stage:Stage = Starling.current.stage;

        _root.alignPivot(Align.LEFT, Align.TOP)
        _root.x = (stage.stageWidth - _root.width) * 0.5;
        _root.y = -30

        var diff:Number = Math.abs(stage.stageHeight - _backgroundImage.height)
        _backgroundImage.height = stage.stageHeight
        _startContainer.y += diff
    }

    private function initEvent():void {
        _startButton.addEventListener(Event.TRIGGERED, startGame)
        addEventListener(Event.ENTER_FRAME, onEnterFrame)
    }

}
}
