<?php

$config = array();

$config['view']['container']['fluid'] = true;

$config['view']['grid']['breakpoint'] = 'lg';

// Подключение скриптов шаблона
$config['head']['template']['js'] = array(
    "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js",    
    "___path.skin.assets.web___/js/bootstrap.min.js",
    '___path.skin.assets.web___/js/init.js',
);

// Подключение стилей шаблона
$config['head']['template']['css'] = array(
	"___path.skin.assets.web___/css/layout.css",
	"___path.skin.assets.web___/css/print.css",
        "___path.skin.assets.web___/css/bootstrap.min.css"
);

$config['view']['bs_themes'] = [
    'default' => [
        'color' => 'light',
        'bg' => 'light'
    ],
    'light' => [
        'color' => 'light',
        'bg' => 'light'
    ],

];

// Подключение темы
$theme = Config::Get('view.theme')?Config::Get('view.theme'):'default';

if ($theme) {
	$config['head']['template']['css'][] = "___path.skin.web___/themes/___view.theme___/style.css";
}

$config['view']['bs_theme'] = $config['view']['bs_themes'][$theme];

$config['components'] = ['ls-vendor', 'ls-component','menu', 'bs-dropdown'];

/**
 * SEO
 */

// Тег используемый для заголовков топиков
$config['view']['seo']['topic_heading'] = 'h1';
$config['view']['seo']['topic_heading_list'] = 'h2';

return $config;
