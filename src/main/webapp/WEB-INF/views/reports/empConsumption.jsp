<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Report For Employee Consumption</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/clockface/css/clockface.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.css" />



<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/common.js"></script>




<c:url var="findEmpConsumption" value="/findEmpConsumption" />
</head>

<style type="text/css">
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<body>


	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>



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

						<i class="fa fa-file-o"></i> Report

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Employee Consumption Report
							</h3>
							<div class="box-tool">
								<a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>

						</div>

						<div class=" box-content" align="center">
							<div class="box-content" align="center">


								<div class="row" align="center">

									<div class="col-md-2">Select Employee *</div>
									<div class="col-md-3">
										<select name="empId" id="empId" class="form-control chosen"
											required>

											<option value="" selected></option>
											<c:forEach items="${empList}" var="empList" varStatus="count">
												<option value="${empList.empId}">${empList.empName}</option>

											</c:forEach>
										</select>
									</div>
								</div>

								<br>
								<div class="row" align="center">

									<div class="col-md-2">Select Project</div>
									<div class="col-md-3">
										<select name="proId" id="proId" class="form-control chosen"
											required>

											<option value="0" >Select Project</option>
											<c:forEach items="${projectList}" var="projectList"
												varStatus="count">
												<option value="${projectList.projectId}">${projectList.projectName}</option>

											</c:forEach>
										</select>
									</div>
								</div>
								<br>OR
								<div class="box-content">

									<div class="col-md-2">From Date</div>
									<div class="col-md-3">
										<input type="text" name="fromDate"
											value="${editEmployee.empJoiningDate}"
											placeholder="From Date" id="fromDate"
											class="form-control date-picker" required />
									</div>

									<div class="box-content">

										<div class="col-md-2">To Date</div>
										<div class="col-md-3">
											<input type="text" name="toDate"
												value="${editEmployee.empJoiningDate}" placeholder="To Date"
												id="toDate" class="form-control date-picker" required />
										</div>

									</div>
									<br>



								</div>
								<br>

								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" class="btn btn-info" value="SEARCH"
											id="submit" onclick="search()">

									</div>
								</div>
							</div>


							<div class="row">
								<div class="clearfix"></div>

								<div class="table-responsive" style="border: 0">
									<table class="table table-advance" id="table1" name="table1">
										<thead>
											<tr>
												<th>Sr No</th>
												<th>Project Name</th>
												<th>Task Planned Hrs</th>
												<th>Actual Required Hrs</th>

											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
								<br>
								<div class="form-group" style="display: none;" id="range">
									<div class="col-sm-3  controls">
										<input type="button" id="expExcel" class="btn btn-primary"
											value="EXPORT TO Excel" onclick="exportToExcel();"
											disabled="disabled">
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
			<!-- END Main Content -->


			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
	</div>
	<!-- END Container -->

	<!--basic scripts-->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
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


	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/additional-methods.min.js"></script>





	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>


	<script type="text/javascript">
		function passwordValidation() {

			var pass = document.getElementById("password").value;
			var pass1 = document.getElementById("rePassword").value;

			if (pass != "" && pass1 != "") {
				if (pass != pass1) {
					alert("Password Not Matched ");
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("submit").disabled = false;

				}

			}
		}
	</script>
	<script type="text/javascript">
		function search() {

			//document.getElementById('btn_pdf').style.display = "block";
			var empId = document.getElementById("empId").value;
			var proId = document.getElementById("proId").value;
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;

			if (validate() == true) {
				alert("true");
				$.getJSON('${findEmpConsumption}', {

					empId : empId,
					proId : proId,
					fromDate : fromDate,
					toDate : toDate,
					ajax : 'true',

				}, function(data) {
					$('#table1 td').remove();
					var tr = $('<tr></tr>');
					tr.append($('<td></td>').html(1));
					tr.append($('<td></td>').html(data.projectName));
					tr.append($('<td></td>').html(data.actualReqHrs));
					tr.append($('<td></td>').html(data.taskPlannedHrs));
					$('#table1 tbody').append(tr).trigger('update');

					//alert("ala"+data);

				}

				);
			}

		}
	</script>
	<script type="text/javascript">
	
	function validate() {

		var fromDate = $("#fromDate").val();
		var toDate = $("#toDate").val();
		var empId = $("#empId").val();
		var proId = $("#proId").val();
		
		/* alert(" proId " + proId);
		alert(" fromDate " + fromDate);
		alert(" toDate " + toDate); */

		var isValid = true;

		if (empId == "" || empId == null) {
			alert("Please select employee");
			isValid = false;

		} 
		else 
		{
			if (proId != 0) 
				{
				//alert("Please select project OR Dates");
				isValid = true;
				}
			
			
			else if ( fromDate != "" && toDate != "") 
			{
				isValid = true;
			}
			else
				{
				alert("Select Any One");
				isValid = false;
				}
		}
		 
return isValid;
	}
		/* function validate() {

			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();
			var empId = $("#empId").val();
			var proId = $("#proId").val();

			var isValid = true;

			if (empId == "" || empId == null) {
				alert("Please select employee");
				isValid = false;

			} else if (proId == "" || proId == null || fromDate == ""
					|| fromDate == null || toDate == "" || toDate == null) {

				alert("Please select project OR Dates");
				isValid = false;
			} else {
				return true
			}

		} */
	</script>

</body>
</html>