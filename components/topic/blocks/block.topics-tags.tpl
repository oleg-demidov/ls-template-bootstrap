{**
 * Теги
 *}

{component_define_params params=[ 'tags', 'tagsUser' ]}

{*component 'block'
    title   = {lang 'tags.block_tags.title'}
    classes = 'js-block-default'
    footer  = {component 'tags' template='search-form' mods='light'}
    tabs    = [
        'tabs' => [
            [
                'text' => {lang 'tags.block_tags.nav.all'},
                'content' => {component 'tags' template='cloud' tags=$tags}
            ],
            [
                'text' => {lang 'tags.block_tags.nav.favourite'},
                'content' => {component 'tags' template='cloud' tags=$tagsUser},
                'is_enabled' => !! $oUserCurrent
            ]
        ]
    ]*}
   

{$itemsTabs = [
    [
        'text' => {lang 'tags.block_tags.nav.all'},
        active => true,
        'content' => {component 'tags' template='cloud' tags=$tags}
    ],
    [
        'text' => {lang 'tags.block_tags.nav.favourite'},
        'content' => {component 'tags' template='cloud' tags=$tagsUser},
        'is_enabled' => !! $oUserCurrent
    ]
]}
{$tabsId = $id|default:{"tabs{math equation='rand()'}"}}

{* Заголовок *}
{capture 'block_header'}
    {lang 'tags.block_tags.title'}
    {component 'bs-tabs.list' classes='card-header-tabs mt-2 js-nav-tab' bmods="tabs" items=$itemsTabs id=$tabsId}
{/capture}

{component 'bs-card' classes  = 'js-block-default js-activity-block-recent activity-recent mt-3'
    content=[
    [   
        type => 'header',
        content => $smarty.capture.block_header
    ],
    [
        type => 'body',
        content => {component 'bs-tabs.panes' classes='card-header-tabs mt-2 js-nav-tab' bmods="tabs" items=$itemsTabs id=$tabsId}
    ],
    [
        type => 'footer',
        content => {component 'tags' template='search-form' mods='light'}
    ]
]}