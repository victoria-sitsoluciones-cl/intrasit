<?php


/**
 * Description of visita
 *
 * @author vpo
 */
class visita {
    function getCantidadVisitas($db){
        $sql = "SELECT count(DISTINCT IP) AS cantVisitas FROM visita ";
        $res = $db->query($sql, PDO::FETCH_ASSOC)->fetch();
        return $res['cantVisitas'];
    }
    function getCantidadVisitasDia($db,$fecha){
        //fecha debe venir en formato AAAA-MM-DD
        $sql = "SELECT count(DISTINCT IP) AS cantVisitas "
          . "FROM visita "
          . "WHERE DATE(fecha)='".$fecha."'";
        $res = $db->query($sql, PDO::FETCH_ASSOC)->fetch();
        return $res['cantVisitas'];
    }
}
