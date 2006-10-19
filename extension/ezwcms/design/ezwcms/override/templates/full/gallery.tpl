{* Gallery - Full view *}

<div class="box">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<div class="content-view-full">
    <div class="class-gallery">

		<div class="attribute-header">
        	<h1>{$node.name|wash()}</h1>
		</div>

    	{if $node.data_map.image.content}
        	<div class="attribute-image">
            	{attribute_view_gui image_class=medium attribute=$node.data_map.image.content.data_map.image}
        	</div>
    	{/if}

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>

        <div class="attribute-long">
           {attribute_view_gui attribute=$node.data_map.description}
        </div>

        {def $page_limit=12
             $children=fetch_alias( children, hash( parent_node_id, $node.node_id,
                                                   offset, $view_parameters.offset,
                                                   limit, $page_limit,
                                                   sort_by, $node.sort_array ) )
             $children_count=fetch_alias( children_count, hash( parent_node_id, $node.node_id ) )}

        {if $children|count}
            <div class="attribute-link">
                <p>
                <a href={$children[0].url_alias|ezurl}>{'View as slideshow'|i18n( 'design/base' )}</a>
                </p>
            </div>

           <div class="content-view-children">
               <table>
               <tr>
               {foreach $children as $child}
                   <td>
                      {node_view_gui view=galleryline content_node=$child}
                   </td>
                   {delimiter modulo=4}
                   </tr>
                   <tr>
                   {/delimiter}
               {/foreach}
               </tr>
               </table>
           </div>
        {/if}

        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=$node.url_alias
                 item_count=$children_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}
    </div>
</div>

</div></div></div></div></div>
</div>