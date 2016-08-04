<?php 
    include("funciones.php");
    $oFormaPago = new formaPago();
?>
 <script>
$(document).ready( function () {
    $('#tabla-de-datos').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
        }
    }),
    $('[data-toggle=confirmation]').confirmation({
        btnOkLabel : 'Eliminar',
        popout: true,
        singleton: true,
        copyAttributes : 'href target',
        btnCancelLabel: 'Cancelar'
    }),
    $(".upd").click(function(){
        var url = "../ajax/dataFormaPago.php?idFormaPago="+this.id; // El script a dónde se realizará la petición   
        $.ajax({
           type: "GET",
           url: url,
           success: function(data){
                    //alert(data);
                    var result = $.parseJSON(data);
                    $("#accionCRUD").val("upd");
                    $("#idFormaPago").val(result.idFormaPago); 
                    $("#nombre").val(result.nombre); 
                    $("#porcentaje").val(result.porcentaje); 
                    $("#logo").val(result.logo); 
	        }
        });
    });
} );
 </script>
<script>
    function validateForm() 
    {
    var x = document.forms["formFormaPago"]["porcentaje"].value;
    if (x == null || x > 100 || x < 0) 
    {
        alert("Porcentaje debe ser de 0% a 100%");
        return false;
    }
}
</script>
<div id="page-wrapper">
<?php  html_mensajes(); ?>
    <div class="row">
      <div class="col-lg-12">
        <img src="../view/images/logo_chico_100x78.png" />
        <h1 style="margin-top: -40px; margin-left: 100px; " >Escritorio <small>Mantenedores</small></h1>
        <ol class="breadcrumb">
            <li class="active"><i class="fa fa-pencil-square-o"></i> CRUD Formas de Pago</li>
        </ol>

      </div>
    </div><!-- /.row -->
        
    <div class="row">
      <div class="col-lg-12">
    <table class="table table-striped table-bordered" id="tabla-de-datos">
    <thead>
      <tr>
        <th>#</th>
        <th>Nombre</th>
        <th>Porcentaje</th>
        <th>Logo</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <?php    
    $data = $oFormaPago->obtenerFormasPago($db);
    foreach($data AS $value){ ?>
      <tr>
        <td><?php echo $value['idFormaPago'] ?></td>
        <td><?php echo $value['nombre'] ?></td>
        <td><?php echo $value['porcentaje'] ?>%</td>
        <td><?php echo $value['logo'] ?>
            <?php if(!empty($value['logo']))
                { ?>
                <img src="../view/<?php echo $value['logo']; ?>" width="100" />
                <?php }      ?>
        </td>
        <td>
                <a data-toggle="confirmation" 
                   data-title="¿Eliminar forma de pago?"
                   target="_self"
                   href="#"
                   data-href="CRUDFormasDePago.php?accionCRUD=del&idFormaPago=<?php echo $value['idFormaPago']?> 
                   id="<?php echo $value['idFormaPago'] ?>" >
                   <i class="fa fa-trash" style="color: #d9534f"></i>
                </a>
        </td>
        <td>
            <a href="#" 
               class="upd" 
               id="<?php echo $value['idFormaPago'] ?>">
               <i class="fa fa-pencil"></i>
            </a>
        </td>
        <?php    
            } ?>
      </tr>  
    </tbody>
  </table>
    </div>
 </div><!-- /.row -->
 
 <div class="row">
    <div class="col-lg-12">
        <!-- FORMULARIO DE INGRESO NUEVO REGISTRO -->
        <form class="form-horizontal" 
               role="form" 
               name="formFormaPago" 
               id="formFormaPago"
               method="POST"
               enctype="multipart/form-data"
               action="../controller/CRUDFormasDePago.php"
               onsubmit="return validateForm()">
            <input type="hidden" 
                     id="accionCRUD" 
                     name="accionCRUD" 
                     value="add" >
            <input type="hidden" 
                     id="idFormaPago" 
                     name="idFormaPago" 
                     value="" >
            <div class="form-group">
                <label class="control-label col-sm-2" for="nombre">Nombre:</label>
                <div class="col-sm-10">
                  <input type="text" 
                         class="form-control" 
                         id="nombre"
                         name="nombre"
                         value=""
                         placeholder="Ingrese nombre de la forma de pago"
                         required >
                </div>
            </div>
          <div class="form-group">
            <label class="control-label col-sm-2" for="porcentaje">Porcentaje:</label>
            <div class="col-sm-10">
              <input type="number" 
                     class="form-control" 
                     id="porcentaje" 
                     name="porcentaje"
                     placeholder="Ingrese el porcentaje de descuento"
                     required>
            </div>
          </div>
              <div class="form-group">
            <label class="control-label col-sm-2" for="logo">Logo:</label>
            <div class="col-sm-10">
              <input type="file" 
                     class="form-control" 
                     id="logo" 
                     name="logo">
            </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-default" name="boton">Submit</button>
                </div>
              </div>
            </form>

    </div>
 </div><!-- /.row -->