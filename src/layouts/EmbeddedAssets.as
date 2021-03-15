package layouts {
public class EmbeddedAssets {

    [Embed(source="../../assets/textures/atlas.png")]
    public static const atlas:Class;

    [Embed(source="../../assets/textures/atlas.xml", mimeType="application/octet-stream")]
    public static const atlas_xml:Class;

    [Embed(source="../../assets/textures/builder.png")]
    public static const builder:Class;

    [Embed(source="../../assets/textures/builder.xml", mimeType="application/octet-stream")]
    public static const builder_xml:Class;

    [Embed(source="../../assets/images/backgroundImage.jpg")]
    public static const backgroundImage:Class;

    [Embed(source="../../assets/images/startButton.png")]
    public static const startButton:Class;

}
}
