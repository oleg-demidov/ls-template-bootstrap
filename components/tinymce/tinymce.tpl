{component_define_params params=[ 'name', 'id', 'rows', 'mods', 'classes', 'attributes' ]}

{component 'bs-form.textarea'
    id = $id
    attributes =  [ 'data-tinymce' => true, 'data-editor-set' => $set ] 
    rows = $rows|default:10
    params = $params}