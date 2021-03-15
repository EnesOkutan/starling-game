package layouts.components.popup {

import layouts.EmbeddedLayouts;
import util.Util;

public class NoPopup extends Popup {

    public function NoPopup() {

        super()

        Util.createBuilder(this, EmbeddedLayouts.no_popup)

        setPosition()

        addChild(_root)

        initListener()

    }

}
}
