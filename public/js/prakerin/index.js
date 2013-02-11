$(function(){
  $("#filter-category").multiselect({
    checkAllText: 'Pilih semua',
    uncheckAllText: 'Hapus centang',
    noneSelectedText: 'Pilih Kategori Jurusan',
    selectedText: '# dipilih',
    minWidth: 240
  });
  $("#map_canvas").prakerinMap();
});
