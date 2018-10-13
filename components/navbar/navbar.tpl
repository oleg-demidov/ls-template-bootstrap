{**
 * Навигация
 *
 * @param string  $bmods
 * 
 *}

{extends "component@bootstrap"}

{component_define_params params=[ 'nav', 'brand', 'toggler' ]}

{block 'bootstrap_options'}
    {$tag = "nav"}
    {$component = 'navbar'}
    {$id = "navbar{math equation='rand()'}"}
{/block}



{block 'bootstrap_content' prepend}
    {if $brand}
        <{if $brand.url}a href="{$brand.url}"{else}span{/if} class="navbar-brand mb-0 h1">
            {if $brand.img}
                <img src="{$brand.img.src}" width="{$brand.img.width|default:'30'}" height="{$brand.img.height|default:'30'}" class="d-inline-block align-top" alt="{$brand.img.alt}">
            {/if}
            {$brand.text}
        </{if $brand.url}a{else}span{/if}>
    {/if}

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#{$id}" aria-controls="navbarNav" aria-expanded="false" aria-label="{$toggler|default:'Toggle navigation'}">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="{$id}">
        {$nav}
    </div>
{/block}

