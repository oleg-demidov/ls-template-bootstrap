{**
 * Модальное окно
 *
 * @param string  $header           Заголовок
 * @param string  $bmods="success"  Список модификторов основного блока (через пробел)
 * @param string  $bg="light"       Модификтор фона
 * @param string  $classes          Список классов основного блока (через пробел)
 * @param array   $attributes       Список атрибутов основного блока
 * @param string  $content          Контент
 * @param string  $footer           Подвал
 * 
 *}
{$component="modal"}

{component_define_params params=[ 'header', 'content', 'footer', 'closeText', 'primaryText', 'html', 'id', 'labelledby', 'effect']}

{$attributes.id=$id}
{$attributes.tabindex="-1"}
{$attributes.role="dialog"}
{$attributes["aria-labelledby"]=$labelledby}
{$attributes["aria-hidden"]="true"}

{block 'modal_options'}{/block}

{block 'modal_content'}
    <div class="{$component} {$effect|default:"fade"} {bmods} {$classes}" {cattr list=$attributes}>
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                {if $header}
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{$header}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                {/if}

                {if $content}
                    <div class="modal-body">
                        {$content}
                    </div>
                {/if}

                {if $footer}
                    {$footer}
                {else}
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$closeText|default:"Close"}</button>
                        <button type="button" class="btn btn-primary">{$primaryText|default:"Ok"}</button>
                    </div>
                {/if}                
            </div>
        </div>
    </div>
{/block}

