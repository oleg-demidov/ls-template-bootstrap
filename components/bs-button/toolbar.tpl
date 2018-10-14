{**
 * Панель инструментов
 *
 * @param string  $classes        Список классов основного блока (через пробел)
 * @param array   $attributes     Список атрибутов основного блока
 * @param array   $groups          Массив параметров кнопок
 *}

{component_define_params params=[ 'groups', 'classes', 'attributes' ]}

{block 'tollbar_options'}{/block}

{block 'tollbar_content'}
    <div class="btn-toolbar {$classes}" {cattr list=$attributes} role="toolbar" >
        {foreach $groups as $item}
            {if is_array($item)}
                {component 'bs-button.group' params=$item}
            {else}
                {$item}
            {/if}            
        {/foreach}
    </div>   
{/block}