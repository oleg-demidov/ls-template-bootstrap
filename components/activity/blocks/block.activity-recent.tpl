{**
 * Последняя активность
 *}

{component_define_params params=[ 'content' ]}

{$itemsTabs = [
    [ 'text' => {lang 'activity.block_recent.comments'}, 'url' => "{router page='ajax'}stream/comment", active=>true, 'content' => $content ],
    [ 'text' => {lang 'activity.block_recent.topics'},   'url' => "{router page='ajax'}stream/topic" ]
]}
{$tabsId = $id|default:{"tabs{math equation='rand()'}"}}

{* Заголовок *}
{capture 'block_header'}
    <a href="{router 'stream'}">{lang 'activity.block_recent.title'}</a>
    {component 'bs-tabs.list' classes='card-header-tabs mt-2 js-nav-tab' bmods="tabs" items=$itemsTabs id=$tabsId}
{/capture}

{* Подвал *}
{capture 'block_footer'}
    <a href="{router page='rss'}allcomments/">{lang 'activity.block_recent.feed'}</a>
{/capture}

{component 'bs-card' classes  = 'js-block-default js-activity-block-recent activity-recent'
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
        content => $smarty.capture.block_footer
    ]
]}