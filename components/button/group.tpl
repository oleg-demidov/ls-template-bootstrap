
{component_define_params params=[ 'items' ]}

<div class="btn-group" role="group">
    {foreach $items as $item}
        {component 'button' params=$item}
    {/foreach}
</div>