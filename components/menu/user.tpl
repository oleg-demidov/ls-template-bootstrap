{**
 * Меню пользователя
 *
 * 
 *}
 
{$params.name = 'user'}  
{$params.url = $oUserCurrent->getUserWebPath()}
{$params.offset = "0,10"}

{if $oUserCurrent->getIsAdmin()}
    {$params.items[] = [ text => $aLang.admin.title, url => {router page="admin"}]}  
{/if}

{$params.items[] = {component "bs-button" com="dropdown-item"
    name    = 'feedback'
    text    = {lang 'user.userbar.nav.feedback'}
    attributes = ['data-toggle' => 'modal', 'data-target' => '#modalFeedback']
    url     = '#'
}}


{component 'bs-nav' 
    bmods="fill"
    classes=""
    items = [
        [ 
            name => 'items',  
            classes => "text-nowrap", 
            text => {component 'user.inline' oUser=$oUserCurrent},
            menu => $params 
        ],
        
        [ 
            icon   => [ icon => "sign-out-alt", display => "s", classes => "d-md-none d-inline"],
            'text' => "<span class='d-none d-md-block'>{$aLang.auth.logout}</span>",  
            'url' => "{router page='auth'}logout/?security_ls_key={$LIVESTREET_SECURITY_KEY}" ]
    ]
}


        