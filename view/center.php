<?php
$oCotizacion=new Cotizacion();
$oVisita=new Visita();

$today =getdate(mktime(0, 0, 0, date("m"), date("d")-0,   date("Y")));
$strData="[";
for($i=6;$i>=0;$i--){
    $today =getdate(mktime(0, 0, 0, date("m"), date("d")-$i,   date("Y")));
    $fechaPar=$today['year']."-".$today['mon']."-".$today['mday'];
    $strData .= "'".$oVisita->getCantidadVisitasDia($db, $fechaPar)."',";
}
 $strData = substr($strData, 0, strlen($strData)-1);
 $strData .= "]";
?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>

    <div id="page-wrapper">

        <div class="row">
          <div class="col-lg-12">
			<img src="../view/images/logo_chico_100x78.png" />
            <h1 style="margin-top: -40px; margin-left: 100px; " >Escritorio <small>Lista de Tareas</small></h1>
            <ol class="breadcrumb">
              <li class="active"><i class="fa fa-dashboard"></i> Escritorio</li>
            </ol>
            
          </div>
        </div><!-- /.row -->


 
        <div class="row">
            <div class="col-lg-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-globe fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?php echo $oCotizacion->getCantidadCotizacionesWeb($db); ?></div>
                                <div>Nuevas cotizaciones web</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-keyboard-o fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?php echo $oCotizacion->getCantidadCotizacionesSIT($db); ?></div>
                                <div>Nuevas cotizaciones SIT</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-cart-plus fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?php echo $oVisita->getCantidadVisitas($db); ?></div>
                                <div>Nuevas ventas</div>
                            </div>
                        </div>
                    </div>
                    
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-dollar fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><?php echo $oVisita->getCantidadVisitas($db); ?></div>
                                <div>Total ventas</div>
                            </div>
                        </div>
                    </div>
                    
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">Detalles</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>

        </div><!-- /.row -->

        
        
        
        
        
        <div class="row"><!-- /.row chart-->
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Gráficos
                    </div>
                   
                    <div class="panel-body">
                        <canvas id="myChart" width="400" height="200"></canvas>
<script>
var ctx = document.getElementById("myChart");
var d = new Date();
d.setDate(d.getDate() + 50);


   
var etiqueta = [];
for(i=6;i>=0;i--){
    var today = new Date();
    today.setDate(today.getDate()-i);
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
    var x = dd+'/'+mm+'/'+yyyy; 
    etiqueta.push(x);
}

var datos = eval(<?php echo $strData; ?>);


//[12, 19, 3, 5, 2, 3]
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: etiqueta,
        datasets: [{
            label: 'Cantidad de visitas, IPs únicas',
            data: datos,
            backgroundColor: [
                'rgba(50, 217, 206, 0.2)',
                'rgba(50, 217, 206, 0.2)',
                'rgba(108, 195, 202, 0.2)',
                'rgba(108, 195, 202, 0.2)',
                'rgba(72, 51, 90, 0.2)',
                'rgba(72, 51, 90, 0.2)',
                'rgba(37, 100, 50, 0.2)'
            ],
            borderColor: [
                'rgba(50, 217, 206,1)',
                'rgba(50, 217, 206, 1)',
                'rgba(108, 195, 202, 1)',
                'rgba(108, 195, 202, 1)',
                'rgba(72, 51, 90, 1)',
                'rgba(72, 51, 90, 1)',
                'rgba(37, 100, 50, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>

                    </div>
                    
                </div>
            </div>
        </div><!-- /.row chart-->
        
        <div class="row"><!-- /.row chart-->
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Trello Dashboard
                    </div>
                   
                    <div class="panel-body">        
        <h1>Trello Dashboard</h1>

      <form class="form-horizontal" id="boards_form">
        <div class="form-group">
          <label class="control-label">Choose your board</label>
            <select class="form-control" id="boards"></select>
        </div>
      </form>
      
      <div id="labels"></div>
                    </div>
                    
                </div>
            </div>
        </div><!-- /.row chart-->
        
        
        
      </div><!-- /#page-wrapper -->
</body>
      <script src="https://api.trello.com/1/client.js?key=b4699579cff601b7ee2716f05ba83da8"></script>
  
  <script type="text/javascript">
    var loadedBoards = function(boards) {
      $.each(boards, function(index, value) {
        $('#boards')
          .append($("<option></option>")
          .attr("value",value.id)
          .text(value.name)); 
      });
    };
    var loadBoards = function() {
      //Get the users boards
      Trello.get(
        '/members/me/boards/',
        loadedBoards,
        function() { console.log("Failed to load boards"); }
      );
    };
    
    var loadedLabels = function(labels) {
      $.each(labels, function(index, label) {
        var label = $("<p><span class='badge' style='background:" + label.color + ";'>" + label.uses + "</span> " + label.name + "</p>");
        $('#labels').append(label)
      });
    };
    $('#boards').change(function() {
      var boardId = $("option:selected", this).val();
      $('#labels').empty();
      
      Trello.get(
        '/boards/' + boardId + '/labels',
        loadedLabels,
        function() { console.log("Failed to load labels"); }
      );
    });
    
    Trello.authorize({
      type: "popup",
      name: "Trello dashboard",
      scope: {
        read: true,
        write: false },
      expiration: "never",
      success: loadBoards,
      error: function() { console.log("Failed authentication"); }
    });
  </script>