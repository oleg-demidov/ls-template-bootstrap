{**
 * Группа кнопок
 *
 * @param string  $classes        Список классов основного блока (через пробел)
 * @param array   $attributes     Список атрибутов основного блока
 * @param array   $items          Массив параметров кнопок
 * @param string  $bmods          Моды через пробел
 *}
{$component="btn-group"}

{component_define_params params=[ 'items', 'classes', 'attributes', 'bmods', 'bg' ]}

{function bmods}
    {strip}

    {if $bg}
        {"bg-{$bg} "}
    {/if}

    {if $bmods}
        {cmods name=$component mods=$bmods delimiter="-"}
    {/if}
    
    {/strip}
{/function}
{block 'button_group_options'}{/block}

{block 'button_group_content'}
    <div class="btn-group {$classes} {bmods bmods=$bmods}" {cattr list=$attributes} role="group" >
        {foreach $items as $item}
            {if is_array($item)}
                {component 'bs-button' params=$item}
            {else}
                {$item}
            {/if} 
        {/foreach}
    </div>   
{/block}