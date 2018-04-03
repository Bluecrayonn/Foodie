<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.panel.panel-horizontal {
    display:table;
    width:100%;
}
.panel.panel-horizontal > .panel-heading, .panel.panel-horizontal > .panel-body, .panel.panel-horizontal > .panel-footer {
    display:table-cell;
}
.panel.panel-horizontal > .panel-heading, .panel.panel-horizontal > .panel-footer {
    width: 25%;
    border:0;
    vertical-align: middle;
}
.panel.panel-horizontal > .panel-heading {
    border-top-right-radius: 0;
    border-bottom-left-radius: 4px;
}
.panel.panel-horizontal > .panel-footer {
    border-top-left-radius: 0;
    border-bottom-right-radius: 4px;
}
</style>
<div> 
    <div class="card hovercard">
    
        <div class="card-background" style="background-image:URL(/template/images/test1.jpg); height: 300px">
            <img class="card-bkimg">
        </div>
        <div class="useravatar">
            <img style="background-image:URL(/template/images/test2.jpg); margin-top: 100px; border: none;">
        </div>
    </div>
    </div>
<div style="text-align: center;">
                    <h1 style="color: #F2BF2B;">${sessionScope.auth.NAME}���� ��ú��� �Դϴ�.</h1> <h3>OO��Ʈ</h3>
            </div>
 <div class="container">
 <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
 <select class="form-control" id="user" style="font-size: 12pt; width: 300px; margin-left: 150px;">
        <option>����</option>
      </select>
      <br/>
<table class="table">
                <thead>
                    <tr class="filters">
                        <th>��</th>
                        <th>ȭ</th>
                        <th>��</th>
                        <th>��</th>
                        <th>��</th>
                        <th>��</th>
                        <th>��</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>200��</td>
                        <td>200��</td>
                        <td>200��</td>
                        <td>200��</td>
                        <td>200��</td>
                        <td>200��</td>
                        <td>200��</td>
                    </tr>
                    </tbody>
                    </table>

<div class="panel panel-default panel-horizontal" style="margin-right: 200px;">
    <div class="panel-heading">
  <h3 class="panel-title" style="width: 200px;">���� �˻���</h3>
        <small>(�ֱ� 1����)</small>
   <div class="panel-body">������ ��Ʈ</div>
   <div id="chart_sex" style="width: 800px;"></div>
   <div class="panel-body">���̺� ��Ʈ</div>
   <div>
   <select class="form-control" id="age" style="font-size: 12pt;">
        <option>20��</option>
        <option>30��</option>
        <option>40��</option>
        <option>50��</option>
        <option>60��</option>
      </select>
   <div id="piechart_20age" style="width: 800px; height: 300px;"></div> 
   <div id="piechart_30age" style="width: 800px; height: 300px;"></div> 
   <div id="piechart_40age" style="width: 800px; height: 300px;"></div> 
   <div id="piechart_50age" style="width: 800px; height: 300px;"></div> 
   <div id="piechart_60age" style="width: 800px; height: 300px;"></div> 
   </div>
</div>
</div>
<div>
    <div>
<h3 class="panel-title" style="width: 200px;">��ǰ����� �ʿ��ϽŰ���?</h3><br/> 
<h4 class="text">������ ����� �ܰ� ������ �ʿ��ϼ���? <small>(�ֱ� 1����)</small></h4> 
      <select class="form-control" id="day" style="font-size: 12pt; width: 800px;">
      </select>
      <br/>
      <div class="container" style="width: 800px;">
    <div class="row" style="width: 800px;">
        <div class="panel panel-primary filterable" style="border: none;">
            <div class="panel-heading" style="background-color: #F2BF2B; border: none;">
                <h3 class="panel-title">���Ϻ� �ܰ�</h3>
                <div class="pull-right">
                	<button class="btn btn-default btn-xs">���</button>
                    <button class="btn btn-default btn-xs btn-filter">Filter</button>
                    
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="��� �̸�" disabled></th>
                        <th><input type="text" class="form-control" placeholder="����" disabled></th>
                        <th><input type="text" class="form-control" placeholder="����" disabled></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>����</td>
                        <td>200</td>
                        <td>��</td>
                    </tr>
                    <tr>
                        <td>���</td>
                        <td>300</td> 
                        <td>��</td>
                    </tr>
		  	<tbody id="ingredients">
                   	<tr id="dummy_row" style="display:none;">
		  			<td><label class="lb_recipe" for="ig_name"></label><input type="text" name="ig_name" disabled></td>
		  			<td><label class="lb_recipe" for="ig_amount"></label><input type="text" name="ig_amount" disabled></td>
		  			<td><label class="lb_recipe" for="ig_unit"></label><input type="text" name="ig_unit" disabled></td>
				</tr>
        		<tr class="ig_row" style="border-collapse: inherit;">
		  			<td><label class="lb_recipe" for="ig_name"></label><input type="text" name="ig_name"></td>
		  			<td><label class="lb_recipe" for="ig_amount"></label><input type="text" name="ig_amount"></td>
		  			<td><label class="lb_recipe" for="ig_unit"></label><input type="text" name="ig_unit"></td>
		  			
		  			
		  			<td id="only_one"><a href="javascript:void(0);" onclick="ig_add();">
			          	<span class="glyphicon glyphicon-plus-sign" style="color:#F2BF2B;"></span>
			        </a>
			        <a href="javascript:void(0);" onclick="ig_remove();">
	          			<span class="glyphicon glyphicon-minus-sign" style="color:#F2BF2B;"></span>
	        		</a>
	        		</td>	        		
        		</tr>
        	</tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
function ig_add() {
	var cloneRow = $("#dummy_row").clone();
	cloneRow.find("input").each(function() {
		$(this).prop("disabled", false);
	});
	cloneRow.find("select").each(function() {
		$(this).prop("disabled", false);
	});
	cloneRow.attr("id","");
	cloneRow.attr("class","ig_row");
	cloneRow.appendTo($("#ingredients"));
	cloneRow.css("display","");
	$("#only_one").appendTo(cloneRow);
	}
	
	function ig_remove() {
		if($(".ig_row").length > 1) {
			console.log($(".ig_row").length);
   		$("#only_one").appendTo($(".ig_row:last").prev());
   		$(".ig_row:last").remove();
		}
	}
	
	/* window.onload=function() {
		var sDay=new Date(Date.now());
		var eDay=new Date(Date.now()-7);
		var strDay="";
		
		for(var i=eDay; i<=sDay; i++){
			strDay += "<option value="+i+">"+i+"</option>";
		}
		document.getElementById("day").innerHTML=strDay
	} */
	
	$(document).ready(function(){
	    $('.filterable .btn-filter').click(function(){
	        var $panel = $(this).parents('.filterable'),
	        $filters = $panel.find('.filters input'),
	        $tbody = $panel.find('.table tbody');
	        if ($filters.prop('disabled') == true) {
	            $filters.prop('disabled', false);
	            $filters.first().focus();
	        } else {
	            $filters.val('').prop('disabled', true);
	            $tbody.find('.no-result').remove();
	            $tbody.find('tr').show();
	            $("#dummy_row").hide();
	        }
	    });

	    $('.filterable .filters input').keyup(function(e){
	        /* Ignore tab key */
	        var code = e.keyCode || e.which;
	        if (code == '9') return;
	        /* Useful DOM data and selectors */
	        var $input = $(this),
	        inputContent = $input.val().toLowerCase(),
	        $panel = $input.parents('.filterable'),
	        column = $panel.find('.filters th').index($input.parents('th')),
	        $table = $panel.find('.table'),
	        $rows = $table.find('tbody tr');
	        /* Dirtiest filter function ever ;) */
	        var $filteredRows = $rows.filter(function(){
	            var value = $(this).find('td').eq(column).text().toLowerCase();
	            return value.indexOf(inputContent) === -1;
	        });
	        /* Clean previous no-result if exist */
	        $table.find('tbody .no-result').remove();
	        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
	        $rows.show();
	        $filteredRows.hide();
	        /* Prepend no-result row if all rows are filtered */
	        if ($filteredRows.length === $rows.length) {
	            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
	        }
	    });
	});
	
	/*���� ��Ʈ*/
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMaterial);

function drawMaterial() {
      var data = google.visualization.arrayToDataTable([
        ['����', '��', '��'],
        ['��', 8175000, 8008000],
        ['��', 3792000, 3694000]
      ]);

      var materialOptions = {
        chart: {
          title: '������ ���� �˻���'
        },
        hAxis: {
          title: '�˻���',
          minValue: 0,
        },
        vAxis: {
          title: '����'
        },
        bars: 'horizontal'
      };
      var materialChart = new google.charts.Bar(document.getElementById('chart_sex'));
      materialChart.draw(data, materialOptions);
    }
    
/*20�� ���� ��Ʈ*/
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart20);

function drawChart20() {

  var data = google.visualization.arrayToDataTable([
    ['����', '20��'],
    ['�ʹ�',     11],
    ['�߹�',      2],
    ['�Ĺ�',  11]
  ]);

  var options = {
    title: '���̿� ���� �˻���'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_20age'));

  chart.draw(data, options);
}

/*30�� ���� ��Ʈ*/
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart30);

function drawChart30() {

  var data = google.visualization.arrayToDataTable([
    ['����', '30��'],
    ['�ʹ�',     11],
    ['�߹�',      2],
    ['�Ĺ�',  11]
  ]);

  var options = {
    title: '���̿� ���� �˻���(30��)'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_30age'));

  chart.draw(data, options);
}

/*40�� ���� ��Ʈ*/
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart40);

function drawChart40() {

  var data = google.visualization.arrayToDataTable([
    ['����', '40��'],
    ['�ʹ�',     11],
    ['�߹�',      2],
    ['�Ĺ�',  11]
  ]);

  var options = {
    title: '���̿� ���� �˻���(40��)'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_40age'));

  chart.draw(data, options);
}

/*50�� ���� ��Ʈ*/
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart50);

function drawChart50() {

  var data = google.visualization.arrayToDataTable([
    ['����', '50��'],
    ['�ʹ�',     11],
    ['�߹�',      2],
    ['�Ĺ�',  11]
  ]);

  var options = {
    title: '���̿� ���� �˻���(50��)'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_50age'));

  chart.draw(data, options);
}

/*60�� ���� ��Ʈ*/
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart60);

function drawChart60() {

  var data = google.visualization.arrayToDataTable([
    ['����', '60��'],
    ['�ʹ�',     11],
    ['�߹�',      2],
    ['�Ĺ�',  11]
  ]);

  var options = {
    title: '���̿� ���� �˻���(60��)'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_60age'));

  chart.draw(data, options);
}

</script>