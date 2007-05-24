{section show=$attribute.content.filename}

    {switch name=mediaType match=$attribute.contentclass_attribute.data_text1}
    {case match=flash}
    <script type="text/javascript">
insertMedia( '<object type="application/x-shockwave-flash" data={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section} {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}>', '<param name="movie" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />', '<param name="loop" value="{section show=$attribute.content.is_loop}true{/section}" />', '<param name="play" value="{section show=$attribute.content.is_autoplay}true{/section}" />', '<param name="quality" value="{$attribute.content.quality}" />', '<p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player<\/a> avaliable!<\/p>', '<\/object>' );
</script>
    <noscript>
    <object type="application/x-shockwave-flash" data={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section} {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}>
        <param name="movie" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />
        <param name="loop" value="{section show=$attribute.content.is_loop}true{/section}" />
        <param name="play" value="{section show=$attribute.content.is_autoplay}true{/section}" />
        <param name="quality" value="{$attribute.content.quality}" />
        <p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player</a> avaliable!</p>
    </object>
    </noscript>
    {/case}

    {case match=quick_time}
    <object
        {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
        {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}>
        <param name="movie" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />
        <param name="controller" value="{section show=$attribute.content.has_controller}true{/section}" />
        <param name="play" value="{section show=$attribute.content.is_autoplay}true{/section}" />
        <param name="loop" value="{section show=$attribute.content.is_loop}true{/section}" />
        <embed src={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl}
               type="video/quicktime"
               pluginspage="{$attribute.content.pluginspage}"
               {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
               {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}
               play="{section show=$attribute.content.is_autoplay}true{/section}"
               loop="{section show=$attribute.content.is_loop}true{/section}" controller="{section show=$attribute.content.has_controller}true{/section}" >
        </embed>
    </object>
    {/case}

    {case match=windows_media_player}
    <object ID="MediaPlayer"  CLASSID="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" STANDBY="Loading Windows Media Player components..." type="application/x-oleobject"
            {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
            {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}>
        <param name="filename" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />
        <param name="autostart" value="{$attribute.content.is_autoplay}" />
        <param name="showcontrols" value="{$attribute.content.has_controller}" />
        <embed src={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl}
               type="application/x-mplayer2" pluginspage="{$attribute.content.pluginspage}"
               {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
               {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}
               autostart="{$attribute.content.is_autoplay}"
               showcontrols="{$attribute.content.has_controller}" >
        </embed>
    </object>
    {/case}

    {case match=real_player}
    <object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA"
            {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
            {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}>
        <param name="src" value={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl} />
        <param name="controls" value="{$attribute.content.controls}" />
        <param name="autostart" value="{section show=$attribute.content.is_autoplay}true{/section}" />
        <embed src={concat("content/download/",$attribute.contentobject_id,"/",$attribute.content.contentobject_attribute_id,"/",$attribute.content.original_filename)|ezurl}
               pluginspage="{$attribute.content.pluginspage}"
               {section show=$attribute.content.width|gt( 0 )}width="{$attribute.content.width}"{/section}
               {section show=$attribute.content.height|gt( 0 )}height="{$attribute.content.height}"{/section}
               autostart="{section show=$attribute.content.is_autoplay}true{/section}"
               controls="{$attribute.content.controls}" >
        </embed>
    </object>
    {/case}
    {/switch}

{section-else}
    {'No media file is available.'|i18n( 'design/ezwebin/view/ezmedia' )}
{/section}
