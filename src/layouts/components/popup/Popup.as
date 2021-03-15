package layouts.components.popup {
import starling.core.Starling;
import starling.display.Button;
import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.utils.Align;

public class Popup extends Sprite{

    public var _root:Sprite
    public var _startButton:Button
    public var _closeButton:Button

    public function Popup() {

        super()

    }

    public function closePopup(e:Event):void {
        this.visible = false
    }

    public function initListener():void {
        _closeButton.addEventListener(Event.TRIGGERED, closePopup)
        _startButton.addEventListener(Event.TRIGGERED, closePopup)
    }

    public function setPosition():void {
        _root.alignPivot(Align.LEFT, Align.TOP)
        var stage:Stage = Starling.current.stage;
        _root.x = (stage.stageWidth - _root.width) * 0.5;
        _root.y = (stage.stageHeight - _root.height) * 0.5;
    }

}
}
