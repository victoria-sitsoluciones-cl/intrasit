<?php
//cargar la clase de sesion
include('../model/sesion.class.php');
$sesion = new Sesion();
$sesion->iniciaSesion();

$dir_subida = '../view/images/formaPago/';
$fichero_subido = $dir_subida . basename($_FILES['logo']['name']);
if($_FILES['logo']['tmp_name'])
{
if (move_uploaded_file($_FILES['logo']['tmp_name'], $fichero_subido)) 
        {
    echo "El fichero es válido y se subió con éxito.\n";
} else {
    echo "¡Posible ataque de subida de ficheros!\n";
}
}

if($sesion->validarSesion()){
    include('../model/conn.php');
    include('../model/config.php');
    include('../model/formaPago.class.php');
    $oFormaPago = new formaPago();
    if(isset($_POST['accionCRUD']) && $_POST['accionCRUD']=="add"){ //nuevo registro
        //verificar que el nombre no esté repetido       
        $nombre =  addslashes($_POST['nombre']);
        $porcentaje =  intval($_POST['porcentaje']);
        $logo = addslashes($_POST['logo']);
        if($oFormaPago->existeNombre($db, $nombre)){
            header('Location: dashboard.php?accion=CRUDFormasDePago&msg=ERRORADD');
        }else{
            $oFormaPago->addFormaPago($db,$nombre,$porcentaje,$fichero_subido);
            header('Location: dashboard.php?accion=CRUDFormasDePago&msg=EXITOADD');
        }
    }elseif(isset($_GET['accionCRUD']) && $_GET['accionCRUD']=="del" && isset($_GET['idFormaPago']) ){
        //verificar que el parámetro sea un número
        $idFormaPago=intval($_GET['idFormaPago']);
        //verificar que no tenga datos dependientes
            if($oFormaPago->delFormaPago($db,$idFormaPago)){
                header('Location: dashboard.php?accion=CRUDFormasDePago&msg=EXITODEL');
            }else{
                header('Location: dashboard.php?accion=CRUDFormasDePago&msg=ERRORDEL'.$idFormaPago);
            }
    }elseif(isset($_POST['accionCRUD']) && $_POST['accionCRUD']=="upd" ){
        //verificar que el parámetro sea un número
        print_r($_POST);
        $idFormaPago = intval($_POST['idFormaPago']);
        $nombre =  addslashes($_POST['nombre']);
        $porcentaje =  intval($_POST['porcentaje']);
        $logo = addslashes($_POST['logo']);
        
        if($oFormaPago->existeNombreConOtroId($db,$idFormaPago, $nombre)){
            header('Location: dashboard.php?accion=CRUDFormasDePago&msg=ERRORUPD');
        }else{
            if($oFormaPago->updFormaPago($db,$idFormaPago,$nombre,$porcentaje,$fichero_subido)){
                header('Location: dashboard.php?accion=CRUDFormasDePago&msg=EXITOUPD');
            }else{
                header('Location: dashboard.php?accion=CRUDFormasDePago&msg=ERRORUPD');
            }
            
        }
    }
    
}else{
	header('Location: ../index.html');
}
?>


