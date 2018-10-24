{**
 * Выпадаеющее меню
 *
 * @param string   $text            Строка с текстом
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 * @param array   $buttons          Дополнительные кнопки перед переключателем
 * @param string  $direction        Направление выпадения меню
 * 
 *}
{$component="dropdown"}

{component_define_params params=[ 'items', 'text', 'toggler', 'buttons', 'bmods', 'bg','classes', 'attributes', 'direction', 'tag', 'isSubmenu']}

{if $buttons}
    {$component="btn-group"}
{/if}

{if $direction}
    {$component="drop{$direction}"}
{/if}

{if $isSubmenu}
    {$component="dropdown-submenu"}
{/if}

{block 'dropdown_options'}{/block}

{block 'dropdown_content'}
    <{$tag|default:"div"} class="{$component} {$classes}" {cattr list=$attributes}>
        {foreach $buttons as $button}
            {if is_array($button)}
                {component 'bs-button' params=$button bmods="{$bmods} {$button.bmods}"}
            {else}
                {$button}
            {/if} 
        {/foreach}
        
        {if $toggler}
            {$toggler}
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
        
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            {foreach $items as $item}
                {if is_array($item)}
                    {if $item.menu}
                        {component "bs-dropdown" 
                            isSubmenu = true
                            params=$item.menu 
                            toggler="<a class='dropdown-item dropdown-toggle' href='#'>{$item.text}</a>"}
                    {else}
                        {if $item.url}
                            <a class="dropdown-item {$item.classes} " href="{$item.url}">{$item.text}</a>
                        {else}
                            {if $item.text == "-"}
                                <div class="dropdown-divider {$item.classes} "></div>
                            {else}
                                <span class="dropdown-item-text {$item.classes} ">{$item.text}</span>
                            {/if}                            
                        {/if}
                    {/if}
                {else}
                    {$item}
                {/if}
            {/foreach}
        </ul>
    </{$tag|default:"div"}>
    
{/block}

