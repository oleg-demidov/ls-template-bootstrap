{**
 * Выпадаеющее меню
 *
 * @param string   $text            Массив либо строка с текстом уведомления
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 * @param array   $buttons          Дополнительные кнопки перед переключателем
 * @param string  $direction        Направление выпадения меню
 * 
 *}
{$component="dropdown"}

{component_define_params params=[ 'items', 'text', 'toggler', 'buttons', 'text', 'bmods', 'bg','classes', 'attributes', 'direction' ]}

{if $buttons}
    {$component="btn-group"}
{/if}

{if $direction}
    {$component="btn-group drop{$direction}"}
{/if}


{block 'dropdown_options'}{/block}

{block 'dropdown_content'}
    <div class="{$component} {$classes}" {cattr list=$attributes}>
        {foreach $buttons as $button}
            {if is_array($button)}
                {component 'bs-button' params=$button bmods="{$bmods} {$button.bmods}"}
            {else}
                {$button}
            {/if} 
        {/foreach}
        
        {if $toggler}
            {if is_array($toggler)}
                {component 'bs-button' 
                    params=$toggler 
                    bmods=$bmods
                    classes="dropdown-toggle {$toggler.classes} {if $toggler.split}dropdown-toggle-split{/if}"
                    text="{$toggler.text|default:$text}{if $toggler.split}<span class='sr-only'>Toggle Dropdown</span>{/if}"
                    attributes=[
                        "data-toggle"=>"dropdown", "aria-haspopup"=>"true", "aria-expanded"=>"false", "data-offset" => $toggler.offset
                    ]
                }
            {else}
                {$toggler}
            {/if}
        {else}
            {component 'bs-button' 
                bmods=$bmods
                bg=$bg
                text=$text
                classes="dropdown-toggle"
                attributes=[
                    "data-toggle"=>"dropdown", "aria-haspopup"=>"true", "aria-expanded"=>"false"
                ]
            }
        {/if}
        
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            {foreach $items as $item}
                {if is_array($item)}
                    {$tag_item = "span"}
                    {$classes_item = "dropdown-item-text"}
                    
                    {if $item.url}
                        {$tag_item = "a"}
                        {$classes_item = "dropdown-item"}
                    {/if}
                    
                    {if $item.text == "-"}
                        {$tag_item = "div"}
                        {$classes_item = "dropdown-divider"}
                    {/if}
                    <{$tag_item} class="{$classes_item} {$item.classes}" href="{$item.url}">{$item.text}</{$tag_item}>
                {else}
                    {$item}
                {/if}
            {/foreach}
        </div>
    </div>
{/block}

