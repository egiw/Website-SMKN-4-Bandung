$(function(){
  var album_id = $("#album_id").val();
  $("#photo_upload").pluploadQueue({
    // General settings
    runtimes : 'html5,flash,silverlight',
    url : '/admin/gallery/upload/id/' + album_id,
    max_file_size : '10mb',
    chunk_size : '1mb',
    unique_names : true,
    browse_button : 'pickfiles',
    language: 'id',
        
    // Specify what files to browse for 
    filters : [
    {
      title : "Image files", 
      extensions : "jpg,png"
    },
    ],
        
    // Flash settings
    flash_swf_url : 'lib/plupload/js/plupload.flash.swf',
        
    // Silverlight settings
    silverlight_xap_url : 'lib/plupload/js/plupload.silverlight.xap'
  });
    
  var uploader = $('#photo_upload').pluploadQueue();

  uploader.bind('FileUploaded', function() {
    if (uploader.files.length == (uploader.total.uploaded + uploader.total.failed)) {
          location.reload();
    }
  });
})