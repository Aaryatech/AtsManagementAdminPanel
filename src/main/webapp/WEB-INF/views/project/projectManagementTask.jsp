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
				 
						<i class="fa fa-file-o"></i>Project Management Task
						 
					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Project Management Task
							</h3>
							<div class="box-tool">
								<a href="${pageContext.request.contextPath}/showAddProject">Project List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div>
							
						</div>
						
						<div class=" box-content">
							<form id="addSupplier" action="${pageContext.request.contextPath}/insertPhaseTask" method="post">
							
								<div class="box-content">
							
								<div class="col-md-2">Project Name</div>
									<div class="col-md-3">
									 <input id="projectName" type="text" name="projectName" value="${projectName}" placeholder="Project Name"  class="form-control" disabled>
									 
									</div>
								 <input id="projectId" name="projectId" value="${projectId}" type="hidden"  >
								 <input id="tTaskPhaseId" name="tTaskPhaseId" value="${phaseTask.tTaskPhaseId}" type="hidden"  >
									 
				 
							</div><br>
							
							<div class="box-content">
							
								<div class="col-md-2">Phase*</div>
									<div class="col-md-3">
									 <select id="phaseId" name="phaseId"    class="form-control chosen" required>
									 <option value=""></option>
										  <c:forEach items="${phaseTypeList}" var="phaseTypeList" varStatus="count">
										  	<c:choose>
										 		<c:when test="${phaseTypeList.mPhaseId==phaseTask.taskPhaseId}">
										 			 <option value="${phaseTypeList.mPhaseId}" selected>${phaseTypeList.phaseName}</option>
										 		</c:when>
										 		<c:otherwise>
														 <option value="${phaseTypeList.mPhaseId}">${phaseTypeList.phaseName}</option>
												</c:otherwise>
											</c:choose>
												</c:forEach>  
									 </select>
									</div>
								<div class="col-md-1"></div>
								 <div class="col-md-2">Description</div>
									<div class="col-md-3">
									<textarea   id="desc" name="desc"    class="form-control"  placeholder="Description"   > ${phaseTask.taskDesc}</textarea>
								
									</div><br><br>
				 
							</div><br>
							
							<div class="box-content">
							<div class="col-md-2">Expected Start Date*</div>
								<div class="col-md-3">
									<input type="text" name="expectedStartDate" value="${phaseTask.expStartDate}" placeholder="Expected Start Date" id="joiningDate" class="form-control date-picker" required/>
									</div>
								<div class="col-md-1"></div>
									<div class="col-md-2">Actual Start Date</div>
								<div class="col-md-3">
									<input type="text" name="actualStartDate" value="${phaseTask.actualStartDate}" placeholder="Actual Start Date" id="joiningDate" class="form-control date-picker"  />
									</div>
							  
							</div><br>
							
								<div class="box-content">
							<div class="col-md-2">Expected End Date*</div>
								<div class="col-md-3">
									<input type="text" name="expectedEndDate" value="${phaseTask.expEndDate}" placeholder="Expected Start Date" id="joiningDate" class="form-control date-picker" required/>
									</div>
								<div class="col-md-1"></div>
									<div class="col-md-2">Actual End Date</div>
								<div class="col-md-3">
									<input type="text" name="actualEndDate" value="${phaseTask.atcualEndDate}" placeholder="Actual Start Date" id="joiningDate" class="form-control date-picker"  />
									</div>
							 
								
				 
							</div><br>
							
							 <div class="box-content">
							
								 <div class="col-md-2">Expected Hours*</div>
									<div class="col-md-3">
									<input type="text"   value="${phaseTask.expHrs}"  id="expectedHours" name="expectedHours" value="${supplierMaster.country}" class="form-control"  placeholder="Expected Hours " required >
								
									</div>
									
								<div class="col-md-1"></div>
								 <div class="col-md-2">Actual Hours</div>
									<div class="col-md-3">
									<input type="text" id="actualdHours" name="actualdHours"  value="${phaseTask.actualHrs}"  class="form-control"  placeholder="Actual Hours "   >
								
									</div>
								
				 
							</div><br>
							
							<div class="box-content">
							
								<div class="col-md-2">Allocated To*</div>
									<div class="col-md-3">
									 <select id="empId" name="empId"   class="form-control chosen" required>
									 
									  <option value=""></option>
									 <c:forEach items="${empList}" var="empList" varStatus="count">
									 	<c:choose>
									 		<c:when test="${empList.empId==phaseTask.assignedTo}">
									 			 <option value="${empList.empId}" selected>${empList.empName}</option>
									 		</c:when>
									 		<c:otherwise>
									 			<option value="${empList.empId}"  >${empList.empName}</option>
									 		</c:otherwise>
									 	
									 	</c:choose>
													
													 
									</c:forEach>
									 </select>
									</div>
									
								 
								
				 
							</div><br>
							<div class="box-content"></div>
							 
							 <div class=" box-content">
					<div class="col-md-12" style="text-align: center">
						<input type="submit" class="btn btn-info" value="Submit" id="submit"  >
					 


					</div>
				</div>
							<div class="box-content">

									<br /> <br />
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr>
													<th style="width: 18px">Sr No</th>
													<th>Phase Type</th>
													<th>Description</th>
													<th>Expected Start Date</th> 
													<th>Expected End Date</th>
													<th>Actual Start Date</th>  
													<th>Actual End Date</th> 
													<th>Expected Hours</th> 
													<th>Actual Hours</th> 
													<th>Assign To</th> 
													<th>Action</th> 
												</tr>
											</thead>
											<tbody>
												 <c:forEach items="${getPhaseTaskList}" var="getPhaseTaskList" varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${getPhaseTaskList.phaseName}</td>
														<td>${getPhaseTaskList.taskDesc}</td>
														<td>${getPhaseTaskList.expStartDate}</td>
														<td>${getPhaseTaskList.expEndDate}</td>  
														<td>${getPhaseTaskList.actualStartDate}</td>
														<td>${getPhaseTaskList.atcualEndDate}</td>  
														<td>${getPhaseTaskList.expHrs}</td>
														<td>${getPhaseTaskList.actualHrs}</td>
														<td>${getPhaseTaskList.empName}</td>
														 <td><a href="${pageContext.request.contextPath}/editPhaseTask/${getPhaseTaskList.tTaskPhaseId}/${projectId}"><span class="glyphicon glyphicon-edit" ></span></a>
							 							 </td> 
													</tr>
												</c:forEach>


											</tbody>
										</table>
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
		 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
		 
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