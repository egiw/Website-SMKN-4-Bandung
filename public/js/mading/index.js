$(function() {
    $("#mading").sortable({
        handle: '.handle',
        placeholder: 'sortable-placeholder',
        forcePlaceholderSize: true,
        animation: {
            duration: 800,
            easing: 'linear'
        },
        update: function(event, ui) {
            var order = $("#mading").sortable('serialize');
            $.ajax({
                url: '/admin/mading/order',
                type: 'post',
                data: order,
                cache: false,
            });
        }
    });

    $('#mading').jcarousel({
        scroll: 1,
        visible: 4
    });

    $('#mading .remove-mading').click(function(event) {
        var id = $(this).data('remove-id');

        event.preventDefault();
        if (!confirm('Apakah anda yakin?'))
            return false;

        $.ajax({
            url: '/admin/mading/delete',
            type: 'post',
            data: 'id=' + id,
            cache: false,
            success: function(response, status, xhr) {
                if ('success' == status) {
                    $("#mading_" + id).fadeOut(300, function() {
                        $(this).remove();
                    });
                }
            }
        });
    });

    $(document).ajaxStart(function() {
        $("#ajax-process").show();
    }).ajaxStop(function() {
        $("#ajax-process").hide();
    })

})