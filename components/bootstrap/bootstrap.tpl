{**
 * Навигация
 *
 * @param string  $bmods
 * @param string  $classes
 * @param array   $attributes
 * @param string  $color
 * @param string  $bg
 * @param string  $tag
 *}

{function bootstrap_mods bmods=""}
    {strip}
        {* Моды *}
        {$aBmods = " "|explode:{$bmods|trim}}
        {foreach $aBmods as $mod}
            {if {$mod|trim}}
                {$str = "{$component}-{$mod} "}{$str}
            {/if}
        {/foreach}
    {/strip}
{/function}

{function bootstrap_param params="" name=""}
    {strip}
    {$aParams = " "|explode:{$params|trim}}
    
    {/strip}
{/function}

{function bootstrap_params}
    {strip}
    {$aParams=[]}
    
    {* Фон *}
    {if $bg}
        {$aParams[] = [str => $bg, name => 'bg']}
    {/if}
    
    {* Флекс *}
    {if $flex}
        {$aParams[] = [str => $flex, name => 'flex']}
    {/if}
    
    {foreach $aParams as $param}
        {$aCodes = " "|explode:{$param.str|trim}}
        {foreach $aCodes as $code}
            {if {$code|trim}}
                {$str = "{$param.name}-{$code} "}{$str}
            {/if}
        {/foreach}
    {/foreach}
    {/strip}
{/function}
    
{component_define_params params=[ 'bmods', 'classes', 'attributes', 'color', 'bg', 'tag', 'content', 'component' ]}

{* Smarty-блок для изменения опций *}
{block 'bootstrap_options'}{/block}



{block 'bootstrap_component'}
    {strip}
    <{$tag} class="{$component} {$classes} {bootstrap_mods bmods=$bmods} {bootstrap_params}" {cattr list=$attributes}>
        {block 'bootstrap_content'}{$content}{/block}
    </{$tag}>
    {/strip}
{/block}

