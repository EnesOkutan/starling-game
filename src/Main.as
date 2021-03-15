package {

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;

import starling.core.Starling;
import starlingbuilder.engine.util.StageUtil;

[SWF(frameRate=60, width=640, height=960)]
public class Main extends Sprite {

    public function Main()
    {
        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void
    {
        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        _start();
    }

    private function _start():void {
        var stageUtil:StageUtil = new StageUtil(stage);
        var size:Point = stageUtil.getScaledStageSize(stage.stageWidth, stage.stageHeight);

        var _starling:Starling = new Starling(Game, stage);
        _starling.viewPort = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
        _starling.stage.stageWidth = size.x;
        _starling.stage.stageHeight = size.y;
        _starling.start();
    }

}
}
