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
.textbox {
  box-shadow: none;
  background: transparent;
  border: 2px solid rgba(0, 0, 0, 0.1);
  height: 50px;
  font-size: 18px;
  font-weight: 300;
  border-radius: 5px;
}
	.textbox:active, .textbox:focus {
  outline: none;
  box-shadow: none;
  border-color: #f7c873;
}
</style>
<div> 
    <div class="card hovercard">
    
        <div class="card-background" style="height: 300px">
        </div>
        <div class="useravatar">
            <img src="/profile_image/${sessionScope.auth.PROFILE_IMG}" width="200px" style="background-image:URL(); margin-top: 100px; border: none;">
        </div> 
    </div>
    </div>
<div style="text-align: center;">
                    <h1 style="color: #F2BF2B;">${sessionScope.auth.NAME}님의 대시보드 입니다.</h1>
            </div>
 <div class="container">
 <div>
 <select name="keywords" class="form-control keywords-list-week" id="user" style="font-size: 12pt; width: 300px; margin-left: 400px;">
       </select> 
      <br/>
<table class="table">
                <thead>
                    <tr class="filters">
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                        <th>일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>200원</td>
                        <td>200원</td>
                        <td>200원</td>
                        <td>200원</td>
                        <td>200원</td>
                        <td>200원</td>
                        <td>200원</td>
                    </tr>
                    </tbody>
                    </table>

<div class="panel panel-default panel-horizontal" style="margin-right: 200px;">
    <div class="panel-heading">
  <h3 id="gender-keyword-title" class="panel-title" style="width: 200px;">○○ 검색량</h3>
        <small>(최근 1주일)</small>
   <div class="panel-body">성별별 차트</div>
   <div id="chart_sex" style="width: 800px;"></div>
   <div class="panel-body">나이별 차트</div>
   <div>
   <select class="ages" name = "age" class="textbox" id="age" style="font-size: 12pt;">
        <option value="20">20대</option>
        <option value="30">30대</option>
        <option value="40">40대</option>
        <option value="50">50대</option>
        <option value="60">60대</option>
      </select>
   
   <div id="piechart_40age" style="width: 800px; height: 300px;"></div> 
   
   </div>
</div>
</div>
<div>
    <div>

<h4 class="text" style="margin-left: 400;">저번에 등록한 단가 정보가 필요하세요? <small>(최근 1주일)</small></h4> 
      <select class="form-control" id="day" style="font-size: 12pt; width: 800px; margin-left: 200px;">
      </select>
      <br/>
      <div class="container" style="width: 800px; margin-left: 200px;">
    <div class="row" style="width: 800px;">
        <div class="panel panel-primary filterable" style="border: none;">
            <div class="panel-heading" style="background-color: #F2BF2B; border: none;">
                <h3 class="panel-title">요일별 단가</h3>
                <div class="pull-right">
                	<button class="btn btn-default btn-xs">등록</button>
                    <button class="btn btn-default btn-xs btn-filter">Filter</button>
                    
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="재료 이름" disabled></th>
                        <th><input type="text" class="form-control" placeholder="가격" disabled></th>
                        <th><input type="text" class="form-control" placeholder="단위" disabled></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>양파</td>
                        <td>200</td>
                        <td>개</td>
                    </tr>
                    <tr>
                        <td>당근</td>
                        <td>300</td> 
                        <td>개</td>
                    </tr>
		  	<tbody id="ingredients">
                   	<tr id="dummy_row" style="display:none;">
		  			<td><label class="lb_recipe" for="ig_name"></label><input type="text" name="ig_name" class="textbox" disabled></td>
		  			<td><label class="lb_recipe" for="ig_amount"></label><input type="text" name="ig_amount" class="textbox" disabled></td>
		  			<td><label class="lb_recipe" for="ig_unit"></label><input type="text" name="ig_unit" class="textbox" disabled></td>
				</tr>
        		<tr class="ig_row" style="border-collapse: inherit;">
		  			<td><label class="lb_recipe" for="ig_name"></label><input type="text" name="ig_name" class="textbox"></td>
		  			<td><label class="lb_recipe" for="ig_amount"></label><input type="text" name="ig_amount" class="textbox"></td>
		  			<td><label class="lb_recipe" for="ig_unit"></label><input type="text" name="ig_unit" class="textbox"></td>
		  			
		  			
		  			<td id="only_one"><a href="javascript:void(0);" onclick="ig_add();">
			          	<span class="icon-squared-plus" style="color:#F2BF2B;"></span>
			        </a>
			        <a href="javascript:void(0);" onclick="ig_remove();">
	          			<span class="icon-squared-minus" style="color:#F2BF2B;"></span>
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
	
	/*성별 차트*/
	//Google Chart Library Load
google.charts.load('current', {packages: ['corechart', 'bar']});
//재료당 나이별 검색량 차트(없어도 상관없을껄?)
$('.ages').change(function()	{
	var age = $(this).val();
	
	$.ajax("/administ/ages.do",{
		"method":"post",
		"async":true,
		"data":{
			"ages":age
		}
	}).done(function(){
 		var data2 = google.visualization.arrayToDataTable([
		    ['나이', age+'대'],
		    ['초반(0~3)',     11],
		    ['중반(4~6)',      2],
		    ['후반(7~9)',  11]
		  ]);

		  var options2 = {
		    title: '나이에 따른 검색량('+$(this).val()+'대)'
		  };

		  var chart2= new google.visualization.PieChart(document.getElementById('piechart_40age'));

		  chart2.draw(data, options);
		
	})
	
	
	
	
	
});

$(function(){
	$.ajax("/administ/weekkeywords.do",{
		"method":"post",
		"async":true
		
	}).done(function(obj){
		console.log(obj);
		var options = "";
		for(var i = 0 ; i<obj.length;i++){
			options +="<option value="+obj[i]+" >"+obj[i]+"</option>";
		}
		$(".keywords-list-week").html(options);
	})
})

$(".keywords-list-week").change(function(){
	var keyword = $(this).val();
 	$("#gender-keyword-title").html($(this).val()+"검색량");
	$.ajax("/administ/genders.do",{
		"method":"post",
		"async":true,
		"data":
			{
			"keywords":$(this).val()
			}
		
	}).done(function(obj){
  		var m = 0;
		var f = 0;
		var u = 0;
		var s20 = 0;
		var s30 = 0;
		var s40 = 0;
		var s50 = 0;
		var s60 = 0;
		
		
		
		for(cnt in obj){
			 
 					m += obj[cnt].value.M;
 					f += obj[cnt].value.F;
 					u += obj[cnt].value.U;
 					s20 += obj[cnt].value.s20;
 					s30 += obj[cnt].value.s30;
 					s40 += obj[cnt].value.s40;
 					s50 += obj[cnt].value.s50;
 					s60 += obj[cnt].value.s60;
 					  

				}
			 
		
	
		var data =  google.visualization.arrayToDataTable([
			 ['성별', 'count',{ role:'style' }],
		        ['Male', m,'fill-color: #619FDC'],
		        ['Female', f,'fill-color: #F2BB5C'],
		        ['Unknown',u,'fill-color: #D7D6D6']
			
	      ]);

	      var materialOptions = {
	        chart: {
	          title: '성별에 따른 검색량'
	        },
	        hAxis: {
	          title: '검색량',
	          minValue: 0,
	        },
	        vAxis: {
	          title: '성별'
	        },
	        bars: 'horizontal'
	      };
	      var materialChart = new google.charts.Bar(document.getElementById('chart_sex'));
 	      materialChart.draw(data, materialOptions);
 	      
 	     var data2 = google.visualization.arrayToDataTable([
 		    ['나이', 'count'],
 		    ['20s',     s20],
 		    ['30s',      s30],
 		    ['40s',  s40],
 		   ['50s',  s50],
 		  ['60s',  s60]
 		  ]);

 		  var options2 = {
 		    title: '나이별 '+keyword+'검색량'
 		  };

 		  var chart2= new google.visualization.PieChart(document.getElementById('piechart_40age'));

 		  chart2.draw(data2, options2);
		
	})
	
})

</script>







