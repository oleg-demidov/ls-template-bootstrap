{**
 * Навигация
 *
 * @param array     $items
 * @param string    $activeItem
 * @param string    $justify        Горизонтальное выравнивание
 * @param bool      $vertical       
 * 
 *}
{$component = "nav"}
{component_define_params params=[ 'items', 'activeItem', 'justify', 'vertical', 'isRoot' ]}

{if $justify}
    {$classes = "{$classes} justify-content-{$justify}"}
{/if}
{if $vertical}
    {$classes = "{$classes} flex-column"}
{/if}

{block 'nav_content'}
    <ul class="{$component} {bmods} {$classes}" {cattr list=$attributes}>
        {foreach $items as $item}
            {$isActive = ($activeItem and $item.name == $activeItem) or $item.active}
            {if $item.menu}
                {component "bs-dropdown" params=$item.menu tag="li" 
                    toggler={component "bs-button" 
                        com="nav-link"
                        classes="dropdown-toggle"
                        url="#"
                        text=$item.menu.text
                        attributes=[
                            "data-toggle"=>"dropdown", href=>"#", role=>"button", "aria-haspopup"=>"true", "aria-expanded"=>"false"
                        ]
                    }
                }
            {else}
                <li class="nav-item">
                    <a class="nav-link {if $isActive}active{/if} {if $item.disabled}disabled{/if}" href="{$item.url}">{$item.text}</a>
                </li>
            {/if}            
        {/foreach}
    </ul>
{/block}

