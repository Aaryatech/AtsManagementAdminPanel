<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Add Supplier</title>
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
</head>
<body>


	<c:url var="getMixingListWithDate" value="/getMixingListWithDate"></c:url>
	<c:url var="getMixingAllListWithDate" value="/getMixingAllListWithDate"></c:url>
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
				 
						<i class="fa fa-file-o"></i>Add Employee
						 
					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Add Employee
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/allEmployeeList">Employee List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						
						<div class=" box-content">
							<form id="addSupplier" action="${pageContext.request.contextPath}/insertEmployee" method="post">
							
								<div class="box-content">
							
								<div class="col-md-2">Employee Name*</div>
								<div class="col-md-3">
									<input type="text" id="empName" name="empName" class="form-control" value="${editEmployee.empName}" placeholder=" Employee Name " required/>
									<input type="hidden" name="empId" value="${editEmployee.empId}" />
								</div> 
								<div class="col-md-1"></div>
								<div class="col-md-2">Mobile No.*</div>
								<div class="col-md-3">
									<input type="text"  name="empMo" value="${editEmployee.empMobile}" class="form-control" placeholder=" Mobile No " required 
													 pattern="^\d{10}$" required />  
									
									</div>
								
				 
							</div><br>
							
							<div class="box-content">
							
								<div class="col-md-2">Employee Education*</div>
								<div class="col-md-3">
									<input type="text" name="empEdu" value="${editEmployee.empEdu}" class="form-control" placeholder="Employee Education" required/>
									</div>
									<div class="col-md-1"></div>
								<div class="col-md-2">Birth Date*</div>
									<div class="col-md-3">
									<input type="text" name="birthDate" placeholder="Birth Date" value="${editEmployee.empBirthdate}" id="birthDate" class="form-control date-picker" required/>
									</div>
								
				 
							</div><br>
							
							<div class="box-content">
							
								<div class="col-md-2">Employee Designation*</div>
								<div class="col-md-3">
									<input type="text" name="empDesg" value="${editEmployee.empDesignation}" class="form-control"  placeholder="Employee Designation" required />
								</div>
								<div class="col-md-1"></div>
								
									<div class="col-md-2">Any Experience*</div>
								<div class="col-md-3">
									<input type="text" name="empExperience" value="${editEmployee.empPrevExp}" class="form-control" placeholder="Any Experience" required />
										
								</div>
							 
								
				 
							</div><br>
								<div class="box-content">
							
								<div class="col-md-2">Joining Date*</div>
								<div class="col-md-3">
									<input type="text" name="joiningDate" value="${editEmployee.empJoiningDate}" placeholder="Joining Date" id="joiningDate" class="form-control date-picker" required/>
									</div>
									
								<div class="col-md-1"></div>
								<div class="col-md-2">Employee Per Hour Rate*</div>
									<div class="col-md-3">
									<input type="text" name="perHour" value="${editEmployee.empPerHrRate}" class="form-control"  placeholder="Employee Per Hour Rate" 
									required />
									</div>
								
				 
							</div><br>
							
							<c:choose>
								<c:when test="${editEmployee.empType==1}">
								<c:set var="type" value="Developer"></c:set>
								</c:when>
								<c:when test="${editEmployee.empType==2}">
								<c:set var="type" value="Project Manager"></c:set>
								</c:when>
							</c:choose>
							
							<div class="box-content">
							
								<div class="col-md-2">Employee Type*</div>
									<div class="col-md-3">
									 <select id="isSameState" name="empType" id="empType" class="form-control chosen" required>
									 
									  <option value=""></option>
									  <option value="${editEmployee.empType}" selected>${type}</option>
									 <option value="1">Developer</option>
									 <option value="2">Project Manager</option>
									 </select>
									</div>
									
								 
								
				 
							</div><br>
							<div class="box-content">
							
								 <div class="col-md-2">Password*</div>
									<div class="col-md-3">
									<input type="password" value="${editEmployee.empPwd}" onchange="passwordValidation();" id="password" name="password" value="${supplierMaster.country}" class="form-control"  placeholder="Password " required >
								
									</div>
									
								<div class="col-md-1"></div>
								 <div class="col-md-2">ReEnter Password*</div>
									<div class="col-md-3">
									<input type="password" id="rePassword" name="rePassword" onchange="passwordValidation();"  class="form-control"  placeholder="Password " required >
								
									</div>
								
				 
							</div><br>
							  
							
							 <div class=" box-content">
					<div class="col-md-12" style="text-align: center">
						<input type="submit" class="btn btn-info" value="Submit" id="submit" disabled>
					 


					</div>
				</div>
							
							
							
							</form>
					 

		</div>
			</div>			
						
					 
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
			<p>2018 © SONA ELECTRICALS</p>
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
	function passwordValidation()
	{
		 
		var pass = document.getElementById("password").value;
		var pass1 = document.getElementById("rePassword").value;
		 
		if(pass!="" && pass1!="")
		{
			if(pass!=pass1)
				{
				alert("Password Not Matched ");
				document.getElementById("submit").disabled=true;
				}
			else
				{
				document.getElementById("submit").disabled=false;
				
				}
				
		}
	}
	</script>
	
</body>
</html>