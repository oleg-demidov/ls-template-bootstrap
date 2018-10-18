{**
 * Кнопка
 *
 * @param mixed   $text             Массив либо строка с текстом уведомления. Массив должен быть в формате: `[ [ title, msg ], ... ]`
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 *}{strip}
 
 {* Название компонента *}
{$component = "btn"}

{component_define_params params=[ 'text', 'url', 'active', 'disabled' , 'bmods', 'bg', 'classes', 'attributes', 'type', 'value', 'tag' ]}

{block 'button_options'}{/block}

{block 'button_content'}{strip}
    {if $url}
        <a class="{$component} {bmods} {$classes}" 
           {cattr list=$attributes} {if $disabled}aria-disabled="true"{/if} href="{$url}" role="button">{$text}</a>
    {else}
        {if {$tag|default:"button"} == "button"}
            <button type="{$type|default:"button"}" class="{$component} {bmods} {$classes}" {cattr list=$attributes}>
                {$text}
            </button>
        {else}
            <input class="{$component} {bmods} {$classes}" {cattr list=$attributes} type="{$type|default:"button"}" value="{$value}">
        {/if}
    {/if}    
{/strip}{/block}{/strip}