{**
 * Навигация
 *
 * @param string  $bmods
 * 
 *}

{extends "component@bootstrap"}

{component_define_params params=[ 'items' ]}

{block 'bootstrap_options'}
    {$tag = {$tag|default:"nav"}}
    {$component = {$component|default:"nav"}}
{/block}



{block 'bootstrap_content' prepend}
    {foreach $items as $item}
        {$isActive = (($activeItem and $activeItem == $item.name) or $item.active) }
        <li class="nav-item {$item.classes}">
            {if $item.content or !is_array($item)}
                {if !is_array($item)}
                    {$item}
                {else}
                    {$item.content}
                {/if}
            {else}
                <a class="nav-link {if $isActive}active{/if}
                    {if $item.disabled}disabled{/if}" href="{$item.url}">{$item.text}</a>
            {/if}
            
        </li>
    {/foreach}
{/block}

