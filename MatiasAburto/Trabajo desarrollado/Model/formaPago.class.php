<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of formaPago
 *
 * @author vpo
 */
class formaPago {
   function obtenerFormasPago($db){
        $sql = "SELECT idFormaPago,"
                . "nombre,porcentaje,logo "
                . " FROM formaPago";
		$res = $db->query($sql)->fetchAll();
        //echo $sql;
        return $res;
    }
    
    function getFormaPago($db,$idFormaPago){
         $sql = "SELECT *"
                . " FROM formaPago "
                . "WHERE idFormaPago=".$idFormaPago;
        $res = $db->query($sql)->fetch();
        return $res;
    }
    
    function existeNombre($db,$nombre){
        $sql = "SELECT idFormaPago"
                . " FROM formaPago "
                . "WHERE nombre='".$nombre."' ";
        $res = $db->query($sql)->fetch();
        if($res){
            return true;
        }else{
            return false;
        }
    }
    
    function existeNombreConOtroId($db,$idFormaPago,$nombre){
        $sql = "SELECT idFormaPago"
                . " FROM formaPago "
                . "WHERE nombre='".$nombre."' AND idFormaPago!=".$idFormaPago;
        $res = $db->query($sql)->fetch();
        if($res){
            return true;
        }else{
            return false;
        }
    }
    
    function addFormaPago($db,$nombre,$porcentaje,$logo){
        // prepare sql and bind parameters
        $stmt = $db->prepare("INSERT INTO formaPago 
            (nombre,porcentaje,logo) 
            VALUES (:nombre, :porcentaje, :logo)");
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':porcentaje', $porcentaje);
        $stmt->bindParam(':logo', $logo);
        $res = $stmt->execute();
        return $res;
    }
    
    function updFormaPago($db,$idFormaPago,$nombre,$porcentaje,$logo){
        // prepare sql and bind parameters
        $sql="UPDATE formaPago SET
            nombre=:nombre, porcentaje=:porcentaje, logo=:logo
             WHERE idFormaPago=:idFormaPago";
        $stmt = $db->prepare($sql);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':porcentaje', $porcentaje);
        $stmt->bindParam(':logo', $logo);
        $stmt->bindParam(':idFormaPago', $idFormaPago);
        $res = $stmt->execute();
        return $res;
    }
    
    function delFormaPago($db,$idFormaPago){
        // prepare sql and bind parameters
        $stmt = $db->prepare("DELETE FROM formaPago WHERE idFormaPago=:idFormaPago");
        $stmt->bindParam(':idFormaPago', $idFormaPago);
        $res = $stmt->execute();
        return $res;
    }
}
