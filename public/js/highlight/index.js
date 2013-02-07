$(function(){
  $("#highlight-images").sortable({
    handle: '.handle',
    placeholder: 'sortable-placeholder',
    tolerance: 'intersect',
    start: function(event, ui) {
    },
    update: function(event, ui) {
      var order = $("#highlight-images").sortable('serialize');
      $.ajax({
        url: '/admin/highlight/order',
        type: 'post',
        data: order,
        cache: false,
        success: function(data, status, xhr) {
          
        }
      });
    }
  });
  $("#highlight-images").disableSelection();
})