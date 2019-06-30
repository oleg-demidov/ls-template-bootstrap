{**
 * Информация о производительности движка
 *}

{component_define_params params=[ 'oUser', 'classes', 'classesLogin']}

<span class="{$classes}">
    <img class='rounded-circle mr-1' src='{$oUserCurrent->getProfileAvatar('25x25')}' style='height:25px;' alt='{$oUserCurrent->getLogin()}'>
    <span class="{$classesLogin}">{$oUserCurrent->getLogin()}</span>
</span>