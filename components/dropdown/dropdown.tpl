{**
 * Выпадаеющее меню
 *
 * @param string  $bmods
 * 
 *}

{extends "component@bootstrap"}

{component_define_params params=[ 'items', 'text', 'toggler', 'text' ]}

{block 'bootstrap_options'}
    {$tag = {$tag|default:"div"}}
    {$component = {$component|default:"dropdown"}}
    {$id = "dropdown{math equation='rand()'}"}
{/block}



{block 'bootstrap_content' prepend}
    {if $toggler}
        {$toggler}
    {else}
        <button class='btn dropdown-toggle' id='{$id}' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
            {$text}
        </button>
    {/if}
    
    <div class="dropdown-menu" aria-labelledby="{$id}">
        {foreach $items as $item}
            <a class="{$component}-item {$item.classes} {if $isActive}active{/if}
                {if $item.disabled}disabled{/if}" href="{$item.url}">{$item.text}</a>
            
        {/foreach}
    </div>
{/block}

