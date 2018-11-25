{**
 * Блок со списком блогов
 *}

{*component 'block'
    mods     = 'blogs'
    classes  = 'blog-block-blogs js-block-default'
    title    = {lang 'blog.blocks.blogs.title'}
    titleUrl = {router page='blogs'}
    tabs  = [
        'classes' => 'js-tabs-block',
        'tabs' => [
            [ 'text' => {lang 'blog.blocks.blogs.nav.top'},    'url' => "{router page='ajax'}blogs/top",  'list' => $sBlogsTop ],
            [ 'text' => {lang 'blog.blocks.blogs.nav.joined'}, 'url' => "{router page='ajax'}blogs/join", 'is_enabled' => !! $oUserCurrent ],
            [ 'text' => {lang 'blog.blocks.blogs.nav.self'},   'url' => "{router page='ajax'}blogs/self", 'is_enabled' => !! $oUserCurrent ]
        ]
    ]}
    
    {component_define_params params=[ 'content' ]*}

{$itemsTabs = [
    [ 'text' => {lang 'blog.blocks.blogs.nav.top'},    'url' => "{router page='ajax'}blogs/top", active=>true,  'content' => $sBlogsTop ],
    [ 'text' => {lang 'blog.blocks.blogs.nav.joined'}, 'url' => "{router page='ajax'}blogs/join", 'is_enabled' => !! $oUserCurrent ],
    [ 'text' => {lang 'blog.blocks.blogs.nav.self'},   'url' => "{router page='ajax'}blogs/self", 'is_enabled' => !! $oUserCurrent ]
]}
{$tabsId = $id|default:{"tabs{math equation='rand()'}"}}

{* Заголовок *}
{capture 'block_header'}
    <a href="{router page='blogs'}">{lang 'blog.blocks.blogs.title'}</a>
    {component 'bs-tabs.list' classes='card-header-tabs mt-2 js-nav-tab' bmods="tabs" items=$itemsTabs id=$tabsId}
{/capture}


{component 'bs-card' classes  = 'js-block-default mt-3'
    content=[
    [   
        type => 'header',
        content => $smarty.capture.block_header
    ],
    [
        type => 'body',
        content => {component 'bs-tabs.panes' classes='card-header-tabs mt-2 js-nav-tab' bmods="tabs" items=$itemsTabs id=$tabsId}
    ]
]}