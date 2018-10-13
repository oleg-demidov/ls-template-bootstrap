

{component_define_params params=[ 'items', 'classes' ]}

<div class="btn-toolbar {$classes}" role="toolbar">
    {foreach $items as $key => $item}
        {if $key == 'buttons'}
            {component 'button.group' items=$item}
        {/if}
        
        {if $key == 'inputs'}
            {component 'input.group' params=$item}
        {/if}
        
    {/foreach}
</div>