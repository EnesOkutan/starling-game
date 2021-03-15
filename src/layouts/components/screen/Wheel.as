package layouts.components.screen {

import layouts.EmbeddedLayouts;
import layouts.components.popup.LostPopup;
import layouts.components.popup.NoPopup;
import layouts.components.popup.WinPopup;

import starling.core.Starling;
import starling.display.Button;
import starling.display.Image;
import starling.display.Sprite;
import starling.display.Stage;
import starling.events.Event;
import starling.text.TextField;
import starling.utils.Align;

import util.Util;

public class Wheel extends Sprite {

    public var _root:Sprite;
    public var _turnButton:Button;
    public var _turnButtonPressed:Button;
    public var _sectors:Image;
    public var _arrow:Image;
    public var _goldText:TextField
    public var _backgroundImage:Image
    public var _mainContainer:Sprite

    private var totalGold:Number = 1500;
    private var spendGold:Number = 300;
    private var speed:Number;
    private var sections:Array = [1,2,3,4]
    private var sectionCount:Number = 3
    private var range:Number = (2 * Math.PI) / (sections.length * sectionCount);
    private var upAcceleration:Number = 0.01
    private var downAcceleration:Number = 0.0004
    private var acceleration:Number = upAcceleration
    private var maxSpin:Number = 0.5

    private var winPopup:WinPopup
    private var noPopup:NoPopup
    private var lostPopup:LostPopup

    public function Wheel() {

        super();

        //Create builder for ui
        Util.createBuilder(this, EmbeddedLayouts.wheel)

        //Set game component positions
        setPosition();

        //Update text fields
        updateText()

        //Init popups instance
        initPopup();

        //Adding child component
        addChild(_root)
        addChild(winPopup)
        addChild(noPopup)
        addChild(lostPopup)

        //Init game events
        initEvent();

    }

    private final function spinWheel(e:Event):void
    {

        if (totalGold < spendGold) {
            showNoPopup()
            resetGame()
            return
        }

        totalGold -= spendGold
        updateText()

        _turnButtonPressed.visible = true
        _turnButton.visible = false

        acceleration = upAcceleration
        speed = 0

        addEventListener(Event.ENTER_FRAME, spin);
    }

    private final function spin(e:Event):void {

        _arrow.rotation += speed;

        if (speed >= maxSpin) {
            acceleration = -downAcceleration
        }

        speed += acceleration

        if (speed <= 0) {

            removeEventListener(Event.ENTER_FRAME, spin);

            _turnButtonPressed.visible = false
            _turnButton.visible = true

            var rotate:Number = _arrow.rotation < 0 ? _arrow.rotation + 2 * Math.PI : _arrow.rotation
            var gain:Number = getGain(rotate)

            totalGold += gain

            updateText()

            gain < 0 ? showLostPopup(gain) : showWinPopup(gain)

        }

    }

    private final function getValue(rotate:Number):int {
        for(var i:int=0 ; i < sections.length; i++) {
            if (controlSection(rotate, i)) {
                return i + 1
            }
        }

        return -1
    }

    private final function controlSection(rotate:Number, section:int):Boolean {
        for(var i:int=0 ; i < sectionCount ; i++) {
            if (rotate >= range * (section + (i * sections.length)) && rotate <= range * (section + ((i * sections.length) + 1))) {
                return true
            }
        }

        return false
    }

    public function disposeTemporarily():void {
        this.visible = false
    }

    public function initialize():void {
        this.visible = true
    }

    public function initPopup():void {
        winPopup = new WinPopup();
        winPopup.visible = false

        noPopup = new NoPopup();
        noPopup.visible = false

        lostPopup = new LostPopup();
        lostPopup.visible = false
    }

    public function initEvent():void {
        _turnButton.addEventListener(Event.TRIGGERED, spinWheel)
    }

    public function setPosition():void {

        var stage:Stage = Starling.current.stage;
        var diff:Number = Math.abs(stage.stageHeight - _backgroundImage.height)

        //Component settings
        _backgroundImage.height = stage.stageHeight
        _mainContainer.y += diff / 2
        _turnButtonPressed.visible = false
        _sectors.alignPivot(Align.CENTER, Align.CENTER)

        //Root component settings
        _root.alignPivot(Align.LEFT, Align.TOP)
        _root.x = (stage.stageWidth - _root.width) * 0.5;
        _root.y = -20
    }

    private function getGain(rotate:Number):Number {
        var gain:Number
        switch (getValue(rotate)) {
            case 1:
                gain = 500
                break
            case 2:
                gain = 1000
                break
            case 3:
                gain = 200
                break
            case 4:
                gain = -500
                break
            default:
                break
        }

        return gain
    }

    public function updateText():void {
        _goldText.text = totalGold.toString()
    }

    private function showLostPopup(gain:Number):void {
        lostPopup._giftText.text = gain + " Coins"
        lostPopup.visible = true
    }

    private function showWinPopup(gain:Number):void {
        winPopup._giftText.text = "+" + gain + " Coins"
        winPopup.visible = true
    }

    private function showNoPopup():void {
        noPopup.visible = true
    }

    private function resetGame():void {
        totalGold = 1500;
        updateText();
    }

}
}
