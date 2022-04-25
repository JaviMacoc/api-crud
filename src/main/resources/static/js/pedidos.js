$(document).ready(function () {
    $('table .btnEliminar').on('click', function () {
        var id = $(this).parent().find('#id').val();
        $('#modalEliminar #articuloId').val(id);
    });
    var i = 2;
    var articulos=[];
    $('#btnAgregar').on('click', function () {
        i = 1;
        $('#tbody').empty();
        agregarFila();
    });
    $('#btnAgregarLinea').on('click',function(){
        agregarFila()});
    function agregarFila() {
        var str = '<tr class=\"filaDeItem\" data-nroLinea=\"' + i + '\"><td>' + i + '</td><td> </td><td> </td><td> </td><td> </td><td> </td>\n\
<td class="tdBtn"><button class="btn btn-outline-dark btn-sm editarFila"><i class="fas-fa-edit"></i></button></td></tr>';
        $('#tbody').append(str);
        i++;
        console.log($('tbody').children());
    }

    //hacer un ajax aca
    $('.editarFila').on('click', function () {
        console.log('btnEdit');
        console.log('btnEdit2veces');
        });
   
    $('#btn1').on('click', function () {
        console.log('btn1');
        $.ajax({             
            type: 'GET',
            url: '../api/articulos/buscar/todos',
            success: function(response) {
                        console.log(response);
                        for (const articulo in response) {
                            articulos+={articulo};
                            console.log(`${articulo.id} ${articulo.nombre}`);
                        }
                        for(const articulo in articulos){                            
                        console.log(JSON.stringify(articulo));
                        console.log(articulo);
                        }
                    }            
        });
    });
   $('#btn2').on('click', function () {
        console.log('btn2');
        $.ajax({
            type: 'GET',
            url: '/api/articulos/buscar/todos',
            success: function(response) {
                        console.log(response);
                        for (const articulo in response) {                            
                            console.log(`${articulo}`);
                        }
                    }            
        });
    });
   $('#btn3').on('click', function () {
        console.log('btn3');
        $.ajax({
            type: 'GET',
            url: '/api/articulos/buscar/todos',
            success: function(response) {
                        console.log(response);
                        for (const articulo in response) {
                            for(const propiedad in articulo)
                            console.log(`${propiedad}: ${articulo[propiedad]}`);
                        }
                    }            
        });
    });
   $('#btn4').on('click', function () {
       var id= 1003;
        console.log('btn4');
        $.ajax({
            type: 'GET',            
            url: '../api/articulos/buscar/'+1003,
            success: function(articulo) {
                        console.log(articulo);                        
                    }            
        });
    });
});
