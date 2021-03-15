package layouts.components.popup {

import layouts.EmbeddedLayouts;
import starling.text.TextField;
import util.Util;

public class LostPopup extends Popup{

    public var _giftText:TextField

    public function LostPopup() {

        super()

        Util.createBuilder(this, EmbeddedLayouts.lost_popup)

        setPosition()

        addChild(_root)

        initListener()

    }

}
}
