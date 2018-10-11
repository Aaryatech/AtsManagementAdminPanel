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

						<i class="fa fa-file-o"></i>Add New Form

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title" >
							<h4>PROJECT NAME : ${projName}, MODULE NAME : ${modName}</h4>
								<h4>MODULE DESCRIPTION : ${getModuleProject.moduleDesc}</h4>
							<div class="box-tool">
								 <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
							</div><br>

						</div>
						
						 

						<div class=" box-content">
							<form id="addSupplier"
								action="${pageContext.request.contextPath}/postForm"
								method="post">
								
								<input type="hidden" name="projId" value="${projId}">
										<input type="hidden" name="modId" value="${modId}"> 
										<input type="hidden" name="projName" value="${projName}"> 
										<input	type="hidden" name="modName" value="${modName}">

								<div class="box-content">
											<div class="col-md-2"> Form
												Type</div>
											<div class="col-md-3">
												<select name="form_type" id="form_type" class="form-control chosen" 
												 required>
													<option value="">Form Type</option>
													<c:forEach items="${formTypeList}" var="formType"
														varStatus="count">
														<option value="${formType.formTypeId}"><c:out value="${formType.formTypeName}"/></option>
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-1"></div> 
												<div class="col-md-2">Form
													Name</div>
												<div class="col-md-3">
													<input type="text" name="form_name" id="form_name"
														class="form-control" placeholder="Form Name"
														required/>
												</div>
											 
										</div><br>
										
										<div class="box-content">
											<div class="col-md-2">Description</div>
											<div class="col-md-9">
												<input name="form_desc" id="form_desc"
													class="form-control" placeholder="Description" /> 
											</div>
										</div><br>
										
										<c:forEach items="${complexityList}" var="complexityList" varStatus="count">		
										<div class="box-content">
											<div class="col-md-2">
												${complexityList.cmplxName}</div>
												<input type="radio" name="workType${complexityList.cmplxId}" id="workType${complexityList.cmplxId}" onchange="requiredHoursValidation(${complexityList.cmplxId},0)" value="0" checked>NONE
												<c:forEach items="${complexityList.cmplxOptionList}" var="cmplxOptionList" >
												<input type="radio" name="workType${complexityList.cmplxId}" id="workType${complexityList.cmplxId}" onchange="requiredHoursValidation(${complexityList.cmplxId},${cmplxOptionList.cmplxOptId})" value="${cmplxOptionList.cmplxOptId}"  >${cmplxOptionList.cmplxOptName}
												
												</c:forEach>
										</div> 
										<div class="box-content">
											 <div class="col-md-2"></div>
												<div class="col-md-3">
												<select name="empId${complexityList.cmplxId}" id="empId${complexityList.cmplxId}"
													onchange="assignDateValidation(${complexityList.cmplxId})" class="form-control chosen" >
													<option value="0" selected>Select Developer</option>
													<c:forEach items="${employeeList}" var="employeeList" >
														 
													<option value="${employeeList.empId}"><c:out value="${employeeList.empName}"/></option>
														 
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-2">
												<input type="text" name="allocationDate${complexityList.cmplxId}"
											 placeholder="Assign Date" onblur="getAllocatedWorkByDate(${complexityList.cmplxId})" id="allocationDate${complexityList.cmplxId}" class="form-control date-picker"   />
											</div>
											
											<div class="col-md-1">
												<input type="text" name="requiredHours${complexityList.cmplxId}"
											 placeholder="Required Hours" pattern="[+-]?([0-9]*[.])?[0-9]+" id="requiredHours${complexityList.cmplxId}" class="form-control" title="Required Hours" />
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
									 
										</c:forEach>
											 <br><br>
   
								<div class=" box-content">
									<div class="col-md-12" style="text-align: center">
										<input type="submit" 
												class="btn btn-info" value="Add Task">



									</div>
								</div>
								
								
							</form>


						</div>
						
						
					</div>
					
					<hr>
				 	<c:forEach items="${formListWTaskList}" var="formListWTaskList" varStatus="count">	 	
								 <div class="row">
									<div class="col-md-12">
					
										<div class="box">
											<div class="box-title">
												 
									<div class="col-md-2"><b>${count.index+1}.Form Name:</b> </div>
									<div class="col-md-2">
								${formListWTaskList.formName}
									</div>
									
									<div class="col-md-1"><b>Type:</b></div>
									<div class="col-md-2">
										${formListWTaskList.formTypeName} 
									</div><br>
									
									<c:set var="totalAllocatedHours" value="0"> </c:set>
									<c:set var="totalRequredHours" value="0"> </c:set>
									<c:forEach items="${formListWTaskList.taskList}" var="taskList" varStatus="countt">
											 <c:set var="totalAllocatedHours" value="${taskList.taskPlannedHrs+totalAllocatedHours}"> </c:set>
											 <c:choose>
											 	<c:when test="${taskList.devStatus==3}">
											 	 <c:set var="totalRequredHours" value="${taskList.actualReqHrs+totalRequredHours}"> </c:set>
											 	</c:when>
											 </c:choose>
											
										</c:forEach> 
										
									<div class="col-md-2"><b>Allocated Hours : </b> ${totalAllocatedHours}</div>
									 <div class="col-md-2"></div>
									<div class="col-md-3"><b>Actual Required Hours : </b> ${totalRequredHours}</div>
									 
									  
									 <div class="box-tool">
												  <a data-action="collapse" href="#"><i
														class="fa fa-chevron-down"></i></a>
												</div>
							 
												<br>
					
											</div>
											
											<div class="box-content" style="display: none;">
											
											<div class="box-content">

					 
					<div class="table-responsive" style="border: 1px;border: 1px Solid lightblue;">
						<table class="table table-advance" id="table1${count}">  
									<thead>
										<tr class="bgpink">
										<th style="width:2%;">Sr</th>
											<th class="col-md-1">Task Name</th>
											<th class="col-md-3">Task Description</th>
											<th class="col-md-1">Task Plan Hours</th>
											<th class="col-md-1">Task Type Name</th> 
											<th class="col-md-1">Developer Name</th> 
											<th class="col-md-1">Status</th> 
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>

									  <c:forEach items="${formListWTaskList.taskList}" var="taskList" varStatus="countt">
											<tr>
												<td ><c:out value="${countt.index+1}" /></td>
												<td ><c:out value="${taskList.taskName}" /></td>
												<td ><c:out value="${taskList.taskDescription}" /></td>
												<td ><c:out value="${taskList.taskPlannedHrs}" /></td>
 												<td ><c:out value="${taskList.taskTypeName}" /></td> 
 												<td >
 												
 												<c:forEach items="${employeeList}" var="employeeList" >  
													<c:choose>		
 													<c:when test="${employeeList.empId==taskList.developerId && taskList.devStatus!=0}"> 
 													<c:out value="${employeeList.empName}" />
 													</c:when>
 													</c:choose> 
		 												</c:forEach>
 												 
 												</td>
 												<td >
 												<c:choose> 
 													<c:when test="${taskList.devStatus==0}"> 
 													 <c:out value="Not Assign" />
 												   </c:when> 
 												   <c:when test="${taskList.devStatus==1}"> 
 													 <c:out value="Assign" />
 												   </c:when>
 												   <c:when test="${taskList.devStatus==2}"> 
 													 <c:out value="Start" />
 												   </c:when> 
 												    <c:when test="${taskList.devStatus==3}"> 
 													 <c:out value="Completed" />
 												   </c:when> 
 												</c:choose>
										         </td>
										         <td >
										         <a
															href="${pageContext.request.contextPath}/editTask/${taskList.taskId}/${modId}"
															class="btn bnt-primary"> <i class="fa fa-edit"></i></a>
														<a
															href="${pageContext.request.contextPath}/deleteTask/${taskList.taskId}/${modId}"
															class="btn bnt-primary"> <i class="fa fa-trash-o"></i></a>
												</td>
											</tr>
										</c:forEach>  
										</tbody>

								</table>
  
					</div>
				</div>   
											</div>
											</div>
											
											
											</div>
											</div>
											
							 </c:forEach>  


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
			document.getElementById("requiredHours"+cmplxId).required = false; 
			document.getElementById("requiredHours"+cmplxId).value="";
			}
		else
			{
			document.getElementById("requiredHours"+cmplxId).required = true; 
			 getPlanHoursByvalue(cmplxId,value);
			}
		 					 	 
		 
	}
	function getPlanHoursByvalue(cmplxId,value) {
 
		$.getJSON('${getPlanHoursByvalue}', {

			cmplxId : cmplxId, 
			value : value,
			ajax : 'true',

		}, function(data) {
			 
			 document.getElementById("requiredHours"+cmplxId).value = data.allocatedHrs; 

		});
		  
	}
	function assignDateValidation(cmplxId)
	{
		var empId = document.getElementById("empId"+cmplxId).value;
		if(empId==0)
			{
			document.getElementById("allocationDate"+cmplxId).required = false; 
			document.getElementById("allocatedHours"+cmplxId).value =0;
			document.getElementById("allocatedHoursByDate"+cmplxId).value =0;
			}
		else
			{
			document.getElementById("allocationDate"+cmplxId).required = true; 
			getAllocatedWork(cmplxId);
			}
		 					 	 
		 
	}
	</script>
	
	<script type="text/javascript">
		function getAllocatedWork(cmplxId) {

			 
			var empId = document.getElementById("empId"+cmplxId).value; 
			 
			$.getJSON('${getEmpAllocatedWorkHours}', {

				empId : empId, 
				ajax : 'true',

			}, function(data) {
				 
				 document.getElementById("allocatedHours"+cmplxId).value = data.taskPlannedHrs; 
				 getAllocatedWorkByDate(cmplxId);
			});
				 
		}
		function getAllocatedWorkByDate(cmplxId) {

			 
			var empId = document.getElementById("empId"+cmplxId).value;
			var date = document.getElementById("allocationDate"+cmplxId).value;
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