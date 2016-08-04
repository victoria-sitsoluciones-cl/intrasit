<?php
include('../model/conn.php');
include('../model/formaPago.class.php');
$oFormaPago = new formaPago();
$idFormaPago = intval($_GET['idFormaPago']);
$aResult = $oFormaPago->getFormaPago($db, $idFormaPago);
echo json_encode($aResult);