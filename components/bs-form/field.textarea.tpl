{**
 * Текст
 *
 * @param string  $readonly          Список классов основного блока (через пробел)
 * 
 *}
 
{extends "component@bs-form.field"}

{component_define_params params=[ 'readonly', 'rows', 'entity']}

{block name="field_input"}
    {$attributes.value = false}
    <textarea {cattr list=$validateRules}
        class="{$component} {cmods name=$component mods=$bmods delimiter="-"} {$classes}" 
        {cattr list=$attributes} rows="{$rows|default:3}">{$value}</textarea>
        
{/block}
    

