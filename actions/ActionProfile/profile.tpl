{**
 * Тестовая страница
 *}
{extends 'layouts/layout.base.tpl'}

{block 'layout_content'}
    <u>{$oUserProfile->getLogin()}</u><br>
    <h2>{$oUserProfile->getName()}</h2>
    
    {hook run='profile_about_before'}  
    
    {if $oUserProfile->getAbout()}
        {component 'bs-text' text=$oUserProfile->getAbout()}
    {/if}
    
    {show_blocks group='profile'}

    {hook run='profile_content_before'}
    
    {block name="profile_content"}

    {/block}
    
    {hook run='profile_content_after'}
{/block}
