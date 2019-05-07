jQuery(document).ready(function($){
    ls.hook.add('ls_template_init_end', function(){ 
        
        let options = ls.registry.get('component.tinimce.options');
        
        if(options === undefined){
            options = {
                selector: '[data-tinymce]',
                plugins: "autoresize code codesample  emoticons hr image imagetools insertdatetime link lists media paste preview print spellchecker table textcolor wordcount" ,
//                plugins: "autoresize autosave bbcode charmap code codesample colorpicker contextmenu directionality emoticons fullpage fullscreen 
//                help hr image imagetools importcss insertdatetime legacyoutput link lists media nonbreaking noneditable pagebreak paste preview print save 
//                searchreplace spellchecker tabfocus table template textcolor textpattern toc visualblocks visualchars wordcount",
                language: LANGUAGE
            };
        }
        
        tinymce.init(options);
    
    });
});