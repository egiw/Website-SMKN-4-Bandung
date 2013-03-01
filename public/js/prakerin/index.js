$(function() {
    $("#filter-category").multiselect({
        checkAllText: 'Pilih semua',
        uncheckAllText: 'Hapus centang',
        noneSelectedText: 'Pilih Kategori Jurusan',
        selectedText: '# dipilih',
        minWidth: 240
    });
    $("#map_canvas").prakerinMap();
    $("#button-map").click(function() {
        $('#map').slideToggle(200);
        if ($(this).hasClass('active')) {
            $(this).text('Tampilkan Peta');
        } else {
            $(this).text('Sembunyikan Peta');
        }
    });
});
