{**
 * Кнопка
 *
 * @param mixed   $text             Массив либо строка с текстом уведомления. Массив должен быть в формате: `[ [ title, msg ], ... ]`
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 * @param bool    $indicators       Индикаторы
 * @param bool    $controls         Кнопки Previous Next
 *}{strip}
 
 {* Название компонента *}
{$component = "carousel"}

{component_define_params params=[ 'bmods', 'bg', 'classes', 'attributes', 'items', 'indicators', 'controls' ]}

{$id = "carousel{math equation='rand()'}"}

{block 'carousel_options'}{/block}

{block 'carousel_content'}{strip}
    <div id="{$id}" class="{$component} {bmods} {$classes}" {cattr list=$attributes} data-ride="carousel">
        {if $indicators}
            <ol class="carousel-indicators">
                {foreach $items as $key => $item name="carousel_indicators"}
                    <li data-target="#{$id}" data-slide-to="{$smarty.foreach.carousel_indicators.index}"
                        {if {$smarty.foreach.carousel_indicators.first}}
                            class="active"
                        {/if}></li>
                {/foreach}
            </ol>
        {/if}
        
        <div class="carousel-inner">
            {foreach $items as $item name="carousel_items"}
                <div class="carousel-item {if {$smarty.foreach.carousel_items.first}}active{/if}">
                    <img class="d-block w-100" src="{$item.src}" alt="{$item.alt}">
                </div>
            {/foreach}
        </div>
        {if $controls}
            <a class="carousel-control-prev" href="#{$id}" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#{$id}" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        {/if}

        
    </div>
{/strip}{/block}{/strip}