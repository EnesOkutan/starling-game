package layouts {
public class EmbeddedLayouts {

    [Embed(source="builder/wheel.json", mimeType="application/octet-stream")]
    public static const wheel:Class;

    [Embed(source="builder/welcome.json", mimeType="application/octet-stream")]
    public static const welcome:Class;

    [Embed(source="builder/win_popup.json", mimeType="application/octet-stream")]
    public static const win_popup:Class;

    [Embed(source="builder/no_popup.json", mimeType="application/octet-stream")]
    public static const no_popup:Class;

    [Embed(source="builder/lost_popup.json", mimeType="application/octet-stream")]
    public static const lost_popup:Class;

}
}
