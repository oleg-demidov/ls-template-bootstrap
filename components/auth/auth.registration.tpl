{**
 * Форма регистрации
 *
 * @param string $redirectUrl
 *}

{$redirectUrl = $smarty.local.redirectUrl|default:$PATH_WEB_CURRENT}

<div class=" justify-content-center mt-3">
    {component 'auth.fields-user'}
</div>
