<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Dashboard - Admin</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">

<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">
</head>
<body onload="showChart()">


	<!-- BEGIN Container -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<c:url var="getEmployeeProGraph" value="/getEmployeeProGraph" />


	<div class="container" id="main-container">

		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">

			<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>

			<div id="sidebar-collapse" class="visible-lg">
				<i class="fa fa-angle-double-left"></i>
			</div>
			<!-- END Sidebar Collapse Button -->
		</div>
		<!-- END Sidebar -->


		<!-- BEGIN Content -->
		<div id="main-content">
			<!-- BEGIN Page Title -->
			<div class="page-title">
				<div>
					<h1>
						<i class="fa fa-file-o"></i> Dashboard
					</h1>
					<!--<h4>Overview, stats, chat and more</h4>-->
				</div>
			</div>
			<!-- END Page Title -->

			<!-- BEGIN Breadcrumb -->
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li class="active"><i class="fa fa-home"></i> Home</li>
				</ul>
			</div>


			<!-- END Breadcrumb -->


			<!-- BEGIN Tiles -->
			<div class="row">



				<div class="col-md-12">
					<div class="box">


						<div class="box-content"></div>
						<br>

					</div>


				</div>
			</div>
			<div id="chart">
				<br> <br> <br>
				<div id="chart_div" style="width: 100%; height: 500px;"></div>
			</div>

			<footer>
			<p>2018 © ATS.</p>
			</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>

		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->
	<!--basic scripts-->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>

	<script type="text/javascript">
		function showChart() {

			$("#chart_div").empty();

			document.getElementById('chart').style.display = "block";

			$.getJSON('${getEmployeeProGraph}', {
				ajax : 'true',

			}, function(emp) {

				if (emp == "") {
					alert("No records found !!");

				}
				google.charts.load('current', {
					'packages' : [ 'corechart' ]
				});
				google.charts.setOnLoadCallback(drawVisualization);

				function drawVisualization() {
					/* var data = google.visualization.arrayToDataTable([
							[ 'Genre', 'Fantasy & Sci Fi', 'Romance',
									'Mystery/Crime', 'General', 'Western',
									'Literature', {
										role : 'annotation'
									} ], [ '2010', 10, 24, 20, 32, 18, 5, '' ],
							[ '2020', 16, 22, 23, 30, 16, 9, '' ],
							[ '2030', 28, 19, 29, 30, 12, 13, '' ] ]); */
						/* var project = "";
							
							for(var i=0;i<emp.projectList.length;i++)
							{
							project = project+","+emp.projectList[i].projectName;
							} */
							var data=[];	
							var temp=[];
							var finalData=[];
							 
							data.push([]);
							
							data[0].push( new Array(emp.projectList.length+2));
							data[0][0]="[Genre"; 
							 
							 for (var i = 1; i <= emp.projectList.length; i++) {
								  
								 data[0][i]=emp.projectList[i-1].projectName;  
							       
							  }
							 
							 data[0][emp.projectList.length+1]="{role : 'annotation' }]";
							 
							 
							  
							 
							 for (var i = 1; i <= emp.employeeListWithActualHrsList.length; i++) {
								 
								 data.push([]);
								 data[i].push( new Array(emp.employeeListWithActualHrsList[i-1].actualHrsList.length+2));
								 
								 data[i][0]="["+emp.employeeListWithActualHrsList[i-1].empName;
								 
								  
								  
							      for (var j = 1; j <= emp.employeeListWithActualHrsList[i-1].actualHrsList.length; j++) {
							    	  
							    	  data[i][j]=emp.employeeListWithActualHrsList[i-1].actualHrsList[j-1].actualReqHrs;
							    	  
							      }
							     
							      
							      data[i][emp.employeeListWithActualHrsList[i-1].actualHrsList.length+1]="'']";
							       
							  }
							 alert(data);  
					var dat = google.visualization.arrayToDataTable(data);
 
					var options = {
						width : 600,
						height : 400,
						legend : {
							position : 'top',
							maxLines : 3
						},
						bar : {
							groupWidth : '75%'
						},
						isStacked : true,
					};

					var chart = new google.visualization.ColumnChart(document
							.getElementById('chart_div'));
					chart.draw(dat, options);
				}

			});

		}
	</script>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>

</body>
</html>
