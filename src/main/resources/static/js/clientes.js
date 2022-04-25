$(document).ready(function () {
    $('table .btnEliminar').on('click', function () {
        var id = $(this).parent().find('#id').val();             
        var nombre = $(this).parent().find('#nombre').val();      
        var apellido = $(this).parent().find('#apellido').val();        
        $('#modalEliminar #clienteId').val(id);
        $('#modalEliminar #eliminarCliente').empty();
        $('#modalEliminar #eliminarCliente').append("<p>Desea eliminar a " + nombre + " " + apellido + " permanentemente?</p>");        
    });    
});
  