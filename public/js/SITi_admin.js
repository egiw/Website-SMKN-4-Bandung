$(document).ready(function(){
  SITi_tinyMCE.init();
  SITi_tag_handler.init();
})

SITi_tinyMCE =  {
  init: function() {
    tinyMCE.init({
      theme : "advanced",
      language: 'en',
      mode : "textareas",
      width : '100%',
      plugins : [
      "style",
      "table",
      "advimage",
      "advlink",
      "emotions",
      "iespell",
      "inlinepopups",
      "preview",
      "searchreplace",
      "print",
      "contextmenu",
      "fullscreen",
      "template",
      "wordcount",
      "advlist",
      ].toString(),
      theme_advanced_buttons1 : [
      "bold",
      "italic",
      "underline",
      "strikethrough",
      "|",
      "justifyleft",
      "justifycenter",
      "justifyright",
      "justifyfull",
      "|",
      'bullist',
      'numlist', 
      'table',
      'image',
      "link",
      "unlink",
      "|",
      'print',
      'preview',
      "fullscreen"
      ],
      theme_advanced_buttons2 : [
      "indent",
      "outdent",
      'blockquote',
      "|",
      "forecolor",
      "backcolor",
      "|",
      "formatselect",
      "fontselect",
      "fontsizeselect",
      ],
      theme_advanced_resizing : false,
      file_browser_callback : function openKCFinder(field_name, url, type, win) {
        tinyMCE.activeEditor.windowManager.open({
          file:'/file-manager/browse.php?opener=tinymce&type=' + type + '&dir=image/themeforest_assets',
          title: 'Cari Gambar',
          width: 700,
          height: 500,
          resizable: "yes",
          inline: true,
          close_previous: "no",
          popup_css: false
        }, {
          window: win,
          input: field_name
        });
        return false;
      }
    });
  }
}

SITi_tag_handler = {
  init: function() {
    $.getJSON('/admin/tag/get', null, function(data){
      $(".tags").tagHandler({
        autocomplete: true,
        assignedTags: '' !== $('#tags').val() ? $("#tags").val().split(','): '',
        availableTags: data.availableTags,
        afterAdd: function() {
          $("#tags").val($(".tags").tagHandler('getSerializedTags'));
        },
        afterDelete: function() {
          $("#tags").val($(".tags").tagHandler('getSerializedTags'));
        }
      });
    });
  }
}