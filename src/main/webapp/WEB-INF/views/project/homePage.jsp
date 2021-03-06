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
	<c:url var="getProjectHoursGraph" value="/getProjectHoursGraph" />

	<c:url var="getInfoForEmployeeGraph" value="/getInfoForEmployeeGraph" />


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

						<div class="col-md-6">
							<div class="row">
								<a href="${pageContext.request.contextPath}/showAssignedTask" />
								<div class="col-md-6">
									<div class="tile tile-orange">
										<div class="img">
											<i class="fa fa-comments"></i>
										</div>
										<div class="content">
											<p class="big">${assignedCount}</p>
											<p class="title">Assigned</p>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="col-md-6">
							<div class="row">
								<a href="${pageContext.request.contextPath}/showInprogessPage" />
								<div class="col-md-6">
									<div class="tile tile-orange">
										<div class="img">
											<i class="fa fa-comments"></i>
										</div>
										<div class="content">
											<p class="big">${inprogressCount}</p>
											<p class="title">In Progress</p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="row">
								<a href="${pageContext.request.contextPath}/showForwardPage" />
								<div class="col-md-6">
									<div class="tile tile-orange">
										<div class="img">
											<i class="fa fa-comments"></i>
										</div>
										<div class="content">
											<p class="big"></p>
											<p class="title">Forward</p>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="col-md-6">
							<div class="row">
								<a href="${pageContext.request.contextPath}/showCompletedPage" />
								<div class="col-md-6">
									<div class="tile tile-orange">
										<div class="img">
											<i class="fa fa-comments"></i>
										</div>
										<div class="content">
											<p class="big">${completedCount}</p>
											<p class="title">Completed</p>
										</div>
									</div>
								</div>
								</a>
							</div>
						</div>

					</div>


				</div>
			</div>
			<br> <br>
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li class="active"><b>Project Graph</b></li>
				</ul>
			</div>
			<div id="chart">

				<div id="chart_div" style="width: 100%; height: 500px;"></div>
			</div>
			<br> <br>

			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li class="active"><b>Employee Graph</b></li>
				</ul>
			</div>
			<div id="chart1">

				<div id="chart_div1" style="width: 100%; height: 500px;"></div>
			</div>

			<footer>
			<p>2018 © SONA ELECTRICALS.</p>
			</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>

		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->
	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

	<script type="text/javascript">
		function showChart() {

			$("#chart_div").empty();

			document.getElementById('chart').style.display = "block";

			$
					.getJSON(
							'${getProjectHoursGraph}',
							{
								ajax : 'true',

							},
							function(data) {

								if (data == "") {
									alert("No records found !!");

								}
								var i = 0;

								google.charts.load('current', {
									'packages' : [ 'corechart', 'bar' ]
								});
								google.charts.setOnLoadCallback(drawStuff);

								function drawStuff() {

									var chartDiv = document
											.getElementById('chart_div');
									document.getElementById("chart_div").style.border = "thin dotted red";
									var dataTable = new google.visualization.DataTable();

									dataTable.addColumn('string',
											'Project Name'); // Implicit domain column.
									dataTable.addColumn('number',
											'Task Planned Hours'); // Implicit data column.

									dataTable.addColumn('number',
											'Actual Required Hours');

									$.each(data, function(key, item) {

										dataTable.addRows([ [ item.projectName,
												item.taskPlannedHrs,
												item.actualReqHrs ]

										]);
									})

									var materialOptions = {
										
										chart : {
											title : 'Project Report',
											subtitle : 'Project '
										},
										axes : {
											y : {
												distance : {
													label : ''
												}, // Left y-axis.
												brightness : {
													side : 'right',
													label : 'Employee Data'
												}
											// Right y-axis.
											}
										}
									};

									function drawMaterialChart() {
										var materialChart = new google.charts.Bar(
												chartDiv);
										materialChart
												.draw(
														dataTable,
														google.charts.Bar
																.convertOptions(materialOptions));
										// button.innerText = 'Change to Classic';
										// button.onclick = drawClassicChart;
									}

									drawMaterialChart();
								}
								;

							});

			showChart1();

		}
	</script>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		function showChart1() {

			$("#chart_div1").empty();

			document.getElementById('chart1').style.display = "block";

			$
					.getJSON(
							'${getInfoForEmployeeGraph}',
							{
								ajax : 'true',

							},
							function(data) {

								if (data == "") {
									alert("No records found !!");

								}
								var i = 0;

								google.charts.load('current', {
									'packages' : [ 'corechart', 'bar' ]
								});
								google.charts.setOnLoadCallback(drawStuff);

								function drawStuff() {

									var chartDiv = document
											.getElementById('chart_div1');
									document.getElementById("chart_div1").style.border = "thin dotted red";
									var dataTable = new google.visualization.DataTable();

									dataTable.addColumn('string',
											'Employee Name'); // Implicit domain column.
									dataTable.addColumn('number',
											'Task Planned Hours'); // Implicit data column.

									$.each(data, function(key, item) {

										dataTable.addRows([ [ item.empName,
												item.taskPlannedHrs ]

										]);
									})

									var materialOptions = {
									
										chart : {
											title : 'Employe Report',
											subtitle : 'Employee '
										},
										axes : {
											y : {
												distance : {
													label : ''
												}, // Left y-axis.
												brightness : {
													side : 'right',
													label : 'Employee Data'
												}
											// Right y-axis.
											}
										}
									};

									function drawMaterialChart() {
										var materialChart = new google.charts.Bar(
												chartDiv);
										materialChart
												.draw(
														dataTable,
														google.charts.Bar
																.convertOptions(materialOptions));
										// button.innerText = 'Change to Classic';
										// button.onclick = drawClassicChart;
									}

									drawMaterialChart();
								}
								;

							});

		}
	</script>

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
<%-- <body>
<jsp:include page="/WEB-INF/views/include/navigation.jsp"></jsp:include>
	<!-- BEGIN Container -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

	<!-- BEGIN Main Content -->
	<div>
		<!-- BEGIN Login Form -->

		<h3>Home Page</h3>


		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showAssignedTask" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${assignedCount}</p>
							<p class="title">Assigned</p>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showInprogessPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${inprogressCount}</p>
							<p class="title">In Progress</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showForwardPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big"></p>
							<p class="title">Forward</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showCompletedPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${completedCount}</p>
							<p class="title">Completed</p>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!--basic scripts-->
		<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')</script>
	<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<!--page specific plugin scripts-->
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>

		<script type="text/javascript">
			function goToForm(form) {
				$('.login-wrapper > form:visible').fadeOut(500, function() {
					$('#form-' + form).fadeIn(500);
				});
			}
			$(function() {
				$('.goto-login').click(function() {
					goToForm('login');
				});
				$('.goto-forgot').click(function() {
					goToForm('forgot');
				});
				$('.goto-register').click(function() {
					goToForm('register');
				});
			});
		</script>
</body> --%>
</html>
