<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Add Form</title>
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


	<c:url var="getEmpAllocatedWorkHoursByDate" value="/getEmpAllocatedWorkHoursByDate"></c:url>
	<c:url var="getEmpAllocatedWorkHours" value="/getEmpAllocatedWorkHours"></c:url>
	<c:url var="getPlanHoursByvalue" value="/getPlanHoursByvalue"></c:url>
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

						<i class="fa fa-file-o"></i>Edit Task

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title" >
							<h4>Task Name : ${task.taskName} </h4>
								 
							<div class="box-tool">
								 <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div><br>

						</div>
						
						 

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/submitEditTask"
								method="post">
								
								<input type="hidden" name="projId" value="${projId}">
										<input type="hidden" name="modId" value="${task.moduleId}"> 
										<input type="hidden" name="projName" value="${projName}"> 
										<input	type="hidden" name="formName" value="${formName}">
  
										<div class="box-content">
											<div class="col-md-2">Task Description</div>
											<div class="col-md-9">
												<input name="taskDesc" id="taskDesc"
													class="form-control" value="${task.taskDescription}" placeholder="Task Description" /> 
											</div>
										</div><br>
										
										
										<c:forEach items="${complexityList}" var="complexityList" varStatus="count">
											<c:forEach items="${complexityList.cmplxOptionList}" var="cmplxOptionList" >
												<c:choose>
													<c:when test="${cmplxOptionList.cmplxOptId==task.taskTypeId}">
														<div class="box-content">
															 <div class="col-md-2"></div>
																<div class="col-md-3">
																<select name="empId" id="empId"
																	onchange="assignDateValidation(${complexityList.cmplxId})" class="form-control chosen" >
																	<c:choose>
																	<c:when test="${task.devStatus==0}">
																	<option value="0" selected>Select Developer</option>
																	</c:when>
																	</c:choose>
																	<c:forEach items="${employeeList}" var="employeeList" >
																		 <c:choose>
																			<c:when test="${employeeList.empId==task.developerId}">
																			<option value="${employeeList.empId}" selected><c:out value="${employeeList.empName}"/></option>
																			</c:when>
																			<c:otherwise>
																			<option value="${employeeList.empId}"><c:out value="${employeeList.empName}"/></option>
																			</c:otherwise>
																		</c:choose>
																	
																		 
																	</c:forEach>
																</select>
															</div>
															<div class="col-md-2">
															<c:choose>
																<c:when test="${task.devStatus==0}">
																<input type="text" name="allocationDate"
															 placeholder="Assign Date" value="${task.startDate}" onblur="getAllocatedWorkByDate(${complexityList.cmplxId})" id="allocationDate" class="form-control date-picker"   />
																</c:when>
																<c:otherwise>
																<input type="text" name="allocationDate"
															 placeholder="Assign Date" value="${task.startDate}" onblur="getAllocatedWorkByDate(${complexityList.cmplxId})" id="allocationDate" class="form-control date-picker" required/>
																</c:otherwise>
															</c:choose>
															
																
															</div>
															
															<div class="col-md-1">
																<input type="text" name="requiredHours"
															 placeholder="Required Hours" pattern="[+-]?([0-9]*[.])?[0-9]+" id="requiredHours" value="${task.taskPlannedHrs}" class="form-control" title="Required Hours" required/>
															</div>
															
															<div class="col-md-1">Allocated Hours</div>
															<div class="col-md-1">
																<input type="text" name="allocatedHours${complexityList.cmplxId}"
															 placeholder="Allocated Hours"   id="allocatedHours${complexityList.cmplxId}" value="0" class="form-control" title="Allocated Hours" readonly/>
															</div>
															
															<div class="col-md-1">Allocated Hours By Date</div>
															<div class="col-md-1">
																<input type="text" name="allocatedHoursByDate${complexityList.cmplxId}"
															 placeholder="Allocated Hours"   id="allocatedHoursByDate${complexityList.cmplxId}" value="0" class="form-control" title="Allocated Hours" readonly/>
															</div>
															
														</div><br><br>
													</c:when>
											 	</c:choose>
											 	</c:forEach>
										</c:forEach>
										
										
										
										
										<c:forEach items="${complexityList}" var="complexityList" varStatus="count">
										<c:choose>
										<c:when test="${complexityList.cmplxOptionList.size()>0}">
										 	
										<div class="box-content">
											<div class="col-md-2">
												${complexityList.cmplxName}</div>
												
												<c:forEach items="${complexityList.cmplxOptionList}" var="cmplxOptionList" >
												<c:choose>
													<c:when test="${cmplxOptionList.cmplxOptId==task.taskTypeId}">
													<input type="radio" name="workType" id="workType" onchange="requiredHoursValidation(${complexityList.cmplxId},${cmplxOptionList.cmplxOptId})" value="${cmplxOptionList.cmplxOptId}" checked>${cmplxOptionList.cmplxOptName}
													</c:when>
													<c:otherwise>
													<input type="radio" name="workType" id="workType" onchange="requiredHoursValidation(${complexityList.cmplxId},${cmplxOptionList.cmplxOptId})" value="${cmplxOptionList.cmplxOptId}"  >${cmplxOptionList.cmplxOptName}
												
													</c:otherwise>
												</c:choose>
												
												</c:forEach>
										</div> 
										
									 </c:when>
										</c:choose>	
										</c:forEach>
											 <br><br>
   
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" 
												class="btn btn-info" value="Submit Edit Task">



									</div>
								</div>
								
								
							</form>


						</div>
						
						
					</div>
					 
				</div>
			</div>
			<!-- END Main Content -->
			<footer>
			<p>2018 © AARYATECH SOLUTIONS</p>
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
	function requiredHoursValidation(cmplxId,value)
	{
		
		if(value==0)
			{
			document.getElementById("requiredHours").required = false; 
			document.getElementById("requiredHours").value="";
			}
		else
			{
			 
			document.getElementById("requiredHours").required = true;  
			 getPlanHoursByvalue(cmplxId,value);
			
			}
							 	 
		 
	}
	function getPlanHoursByvalue(cmplxId,value) {
		
		$.getJSON('${getPlanHoursByvalue}', {

			cmplxId : cmplxId, 
			value : value,
			ajax : 'true',

		}, function(data) {
			 
			 document.getElementById("requiredHours").value = data.allocatedHrs; 

		});
		  
	}
	function assignDateValidation(cmplxId)
	{
		var empId = document.getElementById("empId").value;
		if(empId==0)
			{
			document.getElementById("allocationDate").required = false; 
			document.getElementById("allocatedHours"+cmplxId).value =0;
			document.getElementById("allocatedHoursByDate"+cmplxId).value =0;
			}
		else
			{
			document.getElementById("allocationDate").required = true; 
			getAllocatedWork(cmplxId);
			}
		 					 	 
		 
	}
	</script>
	
	<script type="text/javascript">
		function getAllocatedWork(cmplxId) {

			 
			var empId = document.getElementById("empId").value; 
			 
			$.getJSON('${getEmpAllocatedWorkHours}', {

				empId : empId, 
				ajax : 'true',

			}, function(data) {
				 
				 document.getElementById("allocatedHours"+cmplxId).value = data.taskPlannedHrs; 
				 getAllocatedWorkByDate(cmplxId);
			});
				 
		}
		function getAllocatedWorkByDate(cmplxId) {

			 
			var empId = document.getElementById("empId").value;
			var date = document.getElementById("allocationDate").value;
			if(date=="" || date==null){
				alert("Select Date ");
			} 
			else{
			$.getJSON('${getEmpAllocatedWorkHoursByDate}', {

				empId : empId, 
				date : date,
				ajax : 'true',

			}, function(data) {
				 
				 document.getElementById("allocatedHoursByDate"+cmplxId).value = data.taskPlannedHrs; 

			});
			}
				 
		}
	</script>

</body>
</html>