$(document).ready(function () {
    $('table .btnEliminar').on('click', function () {
        var id = $(this).parent().find('#id').val();
        $('#modalEliminar #articuloId').val(id);
    });
    $('table .btnActualizar').on('click', function () {
        var id = $(this).parent().find('#id').val();
        $.ajax({
            type: 'GET',
            url: '../api/articulos/buscar/'+id,            
            success: function(articulo) {
                $('#formActualizar #id').val(articulo.id);
                $('#formActualizar #nombre').val(articulo.nombre);
                $('#formActualizar #envase').val(articulo.envase);
                $('#formActualizar #stock').val(articulo.stock);
                $('#formActualizar #tipoDeArticulo').val(articulo.tipoDeArticulo);
                $('#formActualizar #costo').val(articulo.costo);
                $('#formActualizar #margen').val(articulo.margen);
                $('#formActualizar #precio').val(articulo.precio);
            }
        });
    });
});