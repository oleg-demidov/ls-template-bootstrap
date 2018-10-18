{**
 * Текст
 *
 * @param string  $readonly          Список классов основного блока (через пробел)
 * 
 *}
 
{extends "component@bs-form.field"}

{component_define_params params=[ 'readonly']}

{block name="field_input"}
    <input type="text" class="{$component} {bmods} {$classes}" {cattr list=$attributes} {if $readonly}readonly{/if}>
{/block}
    


