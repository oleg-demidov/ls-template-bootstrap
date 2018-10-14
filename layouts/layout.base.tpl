{**
 * Основной лэйаут, который наследуют все остальные лэйауты
 *
 * @param boolean $layoutShowSidebar        Показывать сайдбар или нет, сайдбар не будет выводится если он не содержит блоков
 * @param string  $layoutNavContent         Название навигации
 * @param string  $layoutNavContentPath     Кастомный путь до навигации контента
 * @param string  $layoutShowSystemMessages Показывать системные уведомления или нет
 *}

{extends 'component@layout.layout'}

{block 'layout_options' append}
    {$layoutShowSidebar = $layoutShowSidebar|default:true}
    {$layoutShowSystemMessages = $layoutShowSystemMessages|default:true}
    {$themeColor = {Config::Get('view.bs_theme.color')}}
    {$themeBg = {Config::Get('view.bs_theme.bg')}}
{/block}


{block 'layout_head' append}
    {* Получаем блоки для вывода в сайдбаре *}
    {if $layoutShowSidebar}
        {show_blocks group='left' assign=layoutSidebarBlocks}

        {$layoutSidebarBlocks = trim( $layoutSidebarBlocks )}
        {$layoutShowSidebar = !!$layoutSidebarBlocks}
    {/if}

    
{/block}

{block 'layout_body'}
    {hook run='layout_body_begin'}

    {**
     * Юзербар
     *}
    {component 'userbar'}


    {**
     * Шапка
     *}
    {if Config::Get( 'view.layout_show_banner' )}
        {component 'jumbotron'
            title    = Config::Get('view.name')
            subtitle = Config::Get('view.description')
            titleUrl = {router page='/'}
            classes  = 'layout-header'}
    {/if}


    {**
     * Основная навигация
     *}
    {block 'nav_main'}
        {*component 'navbar' 
            brand=[  text => Config::Get('view.name')]
            nav = {component 'nav'
                component = 'navbar'
                activeItem = '11'
                items=[
                    [text => '111', url => '#']
                ]
            }
            content='navbar' 
            bmods="{$themeColor} expand-{Config::Get('view.grid.breakpoint')}" 
            bg=$themeBg*}
        
    {/block}
    
    {**
     * Основной контэйнер
     *}
    <div class="container{if Config::Get('view.container.fluid')}-fluid{/if} {hook run='layout_container_class' action=$sAction}">
        <div class="row">
            {**
             * Контент
             *}
            <div class="content col-12 col-{Config::Get('view.grid.breakpoint')}-8">
                {hook run='layout_content_header_begin' action=$sAction}

                {* Основной заголовок страницы *}
                {block 'layout_page_title' hide}
                    <h2 class="page-header">
                        {$smarty.block.child}
                    </h2>
                {/block}
                
                {block 'layout_content_header'}
                    {* Навигация *}
                    {if $layoutNav}
                        {$_layoutNavContent = ""}

                        {if is_array($layoutNav)}
                            {foreach $layoutNav as $layoutNavItem}
                                {if is_array($layoutNavItem)}
                                    {component 'nav' mods='pills' params=$layoutNavItem assign=_layoutNavItemContent}
                                    {$_layoutNavContent = "$_layoutNavContent $_layoutNavItemContent"}
                                {else}
                                    {$_layoutNavContent = "$_layoutNavContent $layoutNavItem"}
                                {/if}
                            {/foreach}
                        {else}
                            {$_layoutNavContent = $layoutNav}
                        {/if}

                        {* Проверяем наличие вывода на случай если меню с одним пунктом автоматом скрывается *}
                        {if $_layoutNavContent|strip:''}
                            <div class="ls-nav-group">
                                {$_layoutNavContent}
                            </div>
                        {/if}
                    {/if}
                    {component 'bs-alert' text='text' title="Title" bmods='success' dismissible=true animate=1}
                    {component 'bs-badge' text="badge" bmods="dark"}
                    {component 'bs-breadcrumb' items=[[text=>"1", url => '#1'], [text=>"2", url => '#2']] bmods="warning"}
                    {component 'bs-button' bmods="outline-warning lg" text="warning"}
                    {component 'bs-button.toggle' items=[
                        [text=>"1", url => '#1', bmods=>"success"], 
                        [text=>"2", url => '#2', bmods=>"secondary"]] 
                    }
                    {component 'bs-button.group' bmods="lg" classes="m-1" items=[
                        [text=>"1", url => '#1', bmods=>"success"], 
                        [text=>"2", url => '#2', bmods=>"secondary"],
                        [text=>"3", url => '#3', bmods=>"primary"]] 
                    }<br>
                    {component 'bs-button.toolbar' groups=[
                        [
                            classes=>"mr-1",
                            items => [
                                [text=>"1", url => '#1', bmods=>"success"], 
                                [text=>"2", url => '#2', bmods=>"secondary"],
                                [text=>"3", url => '#3', bmods=>"primary"]
                            ]
                        ],
                        [
                            classes=>"mr-2",
                            items => [
                                [text=>"4", url => '#1', bmods=>"success"], 
                                [text=>"5", url => '#2', bmods=>"secondary"],
                                [text=>"6", url => '#3', bmods=>"primary"]
                            ]
                        ],
                        {component 'bs-button.group' classes="mr-1" items= [
                            [text=>"6", url => '#1',   bmods=>"success"], 
                            [text=>"7", url => '#2', bmods=>"secondary"],
                            [text=>"8", url => '#3', bmods=>"primary"]
                        ]}
                    ]
                    }<br>
                    {component 'bs-button.group'
                        items=[
                            [text=>"1", url => '#1', bmods=>"success"], 
                            [text=>"2", url => '#2', bmods=>"secondary"],
                            {component 'bs-button.group'  items=[
                                    [text=>"bgroup", url => '#1', bmods=>"success"]
                                ]
                            }
                        ] 
                    }<br>
                    {component 'bs-dropdown'
                        text="Drop"
                        items=[
                            [text=>"1", url => '#1'], 
                            [text=>"2", url => '#2']
                        ] 
                    }<br>
                    {component 'bs-dropdown'
                        buttons = [
                            [text=>"bt1", url => '#1', bmods=>"success"], 
                            [text=>"bt2", url => '#2', bmods=>"secondary"]
                        ]
                        bmods="lg"
                        toggler=[ split=>true]
                        items=[
                            [text=>"1", url => '#1'], 
                            [text=>"2", url => '#2']
                        ] 
                    }<br>
                    {* Системные сообщения *}
                    {if $layoutShowSystemMessages}
                        {if $aMsgError}
                            {component 'alert' text=$aMsgError mods='error' close=true}
                        {/if}

                        {if $aMsgNotice}
                            {component 'alert' text=$aMsgNotice close=true}
                        {/if}
                    {/if}
                {/block}
                
                {hook run='layout_content_begin' action=$sAction}

                {block 'layout_content'}{/block}

                {hook run='layout_content_end' action=$sAction}
            </div>
              
            {**
             * Сайдбар
             *}
            <aside class="sidebar col-12 col-{Config::Get('view.grid.breakpoint')}-4">
              One of three columns
            </aside>
        </div>
              
        {* Подвал *}
        <footer class="col-12 footer">
            {block 'layout_footer'}
                {hook run='layout_footer_begin'}
                {hook run='copyright'}
                {hook run='layout_footer_end'}
            {/block}
        </footer>
    </div>{* /container *}

    {* Подключение модальных окон *}
    {if $oUserCurrent}
        {component 'tags-personal' template='modal'}
    {else}
        {component 'auth' template='modal'}
    {/if}


    {**
     * Тулбар
     * Добавление кнопок в тулбар
     *}
    {add_block group='toolbar' name='component@admin.toolbar.admin' priority=100}
    {add_block group='toolbar' name='component@toolbar-scrollup.toolbar.scrollup' priority=-100}

    {* Подключение тулбара *}
    {component 'toolbar' classes='js-toolbar-default' items={show_blocks group='toolbar'}}

    {hook run='layout_body_end'}
{/block}