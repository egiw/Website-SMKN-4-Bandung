$(function() {
    $("#mading").jcarousel({
        visible: 1,
        scroll: 1,
        wrap: 'last',
        auto: 5,
    });

    $(".mading").colorbox({rel: 'mading'});
});