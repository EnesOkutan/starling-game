package layouts.components.popup {

import starling.text.TextField;
import layouts.EmbeddedLayouts;
import util.Util;

public class WinPopup extends Popup{

    public var _giftText:TextField

    public function WinPopup() {

        super()

        Util.createBuilder(this, EmbeddedLayouts.win_popup)

        setPosition()

        addChild(_root)

        initListener()

    }

}
}
