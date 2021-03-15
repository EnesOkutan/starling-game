package util {

import starling.display.Sprite;

public class Util {

    public static function createBuilder(context:Sprite, layout:Class):void {
        Game.uiBuilder.create(JSON.parse(new layout), true, context);
    }

}
}
