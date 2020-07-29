<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>後台</title>
<style type="text/css">
th {
	background: #ff2f24;
}

table {
	background: #ffffff;
}

.button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 0px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 90%;
	border-radius: 10px;
}

input[type=text] {
	outline: none;
	border-radius: 10px;
	margin-top: 10px;
}

.search {
	background-color: #4CAF50;
	/* border-radius: 10px 10px 10px 10px; */
	/* margin-left: -20px;  */
	font-size: 13px;
	padding: 3px
}
</style>
</head>
<body style="background: #e1e1e8">


<div class="col-md-3 "
		style="width: 15%; background-color: #363636; height: 750px; position: fixed;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="backIndex"
				style="text-align: center;">商城管理系統</a></li>
			<li><a href="addCarousel" style="color: #5d76cf">輪播牆管理</a></li>
			<li><a href="test" style="color: #5d76cf">會員管理</a></li>
			<li><a href="Brand" style="color: #5d76cf">品牌管理</a></li>
			<li><a href="Product" style="color: #5d76cf">商品管理</a></li>
			<li><a href="OOrders" style="color: #5d76cf">訂單管理</a></li>
			<li><a href="webwebBack" style="color: #5d76cf">客服</a></li>
			<li><a href="statistic" style="color: #5d76cf">統計</a></li>


			<div>
				<a href="<c:url value='/' />"
					style="color: #5d76cf; box-sizing: border-box; position: absolute; bottom: 0; margin-bottom: 50px; padding-left: 50px; padding-bottom: 30px">回購物首頁
				</a>
			</div>
		</ul>
	</div>

	<div style="position: absolute; left: 300px; right: 50px">


		<h3 align=center>統計數據</h3>


		<hr>

		<div id="chartContainer" style="height: 370px; width: 100%;"></div>
		<div id="chartContainer_brand" style="height: 370px; width: 730px; display:inline-block;"></div>
		<div class="topsales" style="background-color: #f2f2f2; display:inline-block;" >
			<table class="table_topsales"
				style="height: 370px; width: 435px; ">
				<thead style="font-size: 20px;">

					<tr>
						<th style="text-align: center">Rank</th>
						<th style="text-align: center">Brand</th>
						<th style="text-align: center">Product<br>Name</th>
						<th style="text-align: center">Quantity <br>of Sale</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="rank" value="1" />
					<c:forEach var='toplistsales' items='${toplist}'>
						<c:choose>
	                    <c:when	test="${rank<=10}"  >
	                  
						<tr>
	                        <td style="text-align: center; font-size: 18px;">${rank}</td>
							<td style="text-align: center; font-size: 18px;">${toplistsales[2]}</td>
							<td style="text-align: center; font-size: 18px;">${toplistsales[1]}</td>
							<td style="text-align: center; font-size: 18px;">${toplistsales[0]}</td>
						
						</tr>
						
						<c:set var="rank" value='${rank+1}' />
 						 </c:when>
	                   <c:otherwise>
	                   </c:otherwise>
	                   </c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
window.onload = function () {

	var options = {
			animationEnabled: true,
			theme: "light2",
			title:{
				text: "營收"
			},
			axisX:{
				interval: 1,
				intervalType: "month",
				valueFormatString: "MMM, YYYY"
			},
			axisY: {
				title: "銷售金額",
				suffix: "K",
				minimum: 30
			},
			toolTip:{
				shared:true
			},  
			legend:{
				cursor:"pointer",
				verticalAlign: "bottom",
				horizontalAlign: "left",
				dockInsidePlotArea: true,
				itemclick: toogleDataSeries
			},
			data: [
// 				{
// 				type: "line",
// 				showInLegend: true,
// 				name: "Projected Sales",
// 				markerType: "square",
// 				xValueFormatString: "DD MMM, YYYY",
// 				color: "#F08080",
// 				yValueFormatString: "#,##0K",
// 				dataPoints: [
// 					{ x: new Date(2017, 10, 1), y: 63 },
// 					{ x: new Date(2017, 10, 2), y: 69 },
// 					{ x: new Date(2017, 10, 3), y: 65 },
// 					{ x: new Date(2017, 10, 4), y: 70 },
// 					{ x: new Date(2017, 10, 5), y: 71 },
// 					{ x: new Date(2017, 10, 6), y: 65 },
// 					{ x: new Date(2017, 10, 7), y: 73 },
// 					{ x: new Date(2017, 10, 8), y: 96 },
// 					{ x: new Date(2017, 10, 9), y: 84 },
// 					{ x: new Date(2017, 10, 10), y: 85 },
// 					{ x: new Date(2017, 10, 11), y: 86 },
// 					{ x: new Date(2017, 10, 12), y: 94 },
// 					{ x: new Date(2017, 10, 13), y: 97 },
// 					{ x: new Date(2017, 10, 14), y: 86 },
// 					{ x: new Date(2017, 10, 15), y: 89 }
// 				]
// 			},
			{
				type: "column",  
// 				showInLegend: true,
// 				name: "總營收",
				lineDashType: "dash",
				markerType: "square",
				xValueFormatString: "MMM",
				color: "#809ef0",
				yValueFormatString: "#,##0K",
				dataPoints: [
					
					{ x: new Date(2020, 0), y: 3300 },
					{ x: new Date(2020, 1), y: 3100 },
					{ x: new Date(2020, 2), y: 3200 },
					{ x: new Date(2020, 3), y: 1800 },
					{ x: new Date(2020, 4), y:  2400},
					{ x: new Date(2020, 5), y: 2900 },
					
					
					{ x: new Date(2020, 6, 1), y:${revenue[0]/1000} }
				
				]
			}]
		};

	$("#chartContainer").CanvasJSChart(options);

	function toogleDataSeries(e){
		if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else{
			e.dataSeries.visible = true;
		}
		e.chart.render();
	}
	
	
	
	
	
	
	
	
	
var chart_brand = new CanvasJS.Chart("chartContainer_brand", {
	animationEnabled: true,
	title:{
		text: "品牌佔有率",
		horizontalAlign: "left",
		
	},
	data: [{
		type: "doughnut",
		startAngle: 60,
		//innerRadius: 60,
		indexLabelFontSize: 20,
		indexLabel: "{label} - #percent%",
		toolTipContent: "<b>{label}:</b> {y} (#percent%)",
		
		
			dataPoints: [
				
				<c:forEach var='qq' items='${bb}'>	
				{ y:${qq[0]}, label: "${qq[1]}" },
				
			</c:forEach>
				
				
			]
	
		
		
	}]
});
chart_brand.render();






}


	

	
</script>


</body>
</html>