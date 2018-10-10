<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>
	<c:url var="getRmSubCategory" value="/getRmSubCategory" />
	<c:url var="getRmCategory" value="/getRmCategory" />
	<div>
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

				<!-- BEGIN Main Content -->
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-title">

								<h3>
									<i class="fa fa-bars"></i>Add Form Details for Project

								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>
							</div>
							<br>
							<div class="box-title" align="center">
								<h4>PROJECT NAME : ${projName}, MODULE NAME : ${modName}</h4>
								<h4>MODULE DESCRIPTION : ${getModuleProject.moduleDesc}</h4>
							</div>
							<div>
								<div class="box-content">
									<form action="${pageContext.request.contextPath}/postForm" class="form-horizontal"
										id="validation-form" method="post">

										<input type="hidden" name="projId" value="${projId}">
										<input type="hidden" name="modId" value="${modId}"> 
										<input type="hidden" name="projName" value="${projName}"> 
										<input	type="hidden" name="modName" value="${modName}">


										<input type="hidden" name="projId" value="${projId}">
										<input type="hidden" name="modId" value="${modId}"> 
										<input type="hidden" name="projName" value="${projName}"> 
										<input	type="hidden" name="modName" value="${modName}">

										<input	type="hidden" name="uicname" id="uicname" value="5">
										<input	type="hidden" name="webcomname" id="webcomname">
										<input	type="hidden" name="conscompname" id="conscompname">
										<input	type="hidden" name="testcomname" id="testcomname">
										<input	type="hidden" name="spcompname" id="spcompname">
										

										<div class="box-content">
											<div class="col-md-2"> Form
												Type</div>
											<div class="col-md-3">
												<select name="form_type" id="form_type" class="form-control chosen" 
												 data-rule-required="true">
													<option value="0">Form Type</option>
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
														data-rule-required="true" required />
												</div>
											 
										</div><br>
										
										<div class="box-content">
											<div class="col-md-2">Description</div>
											<div class="col-md-9">
												<input name="form_desc" id="form_desc"
													class="form-control" placeholder="Description" /> 
											</div>
										</div><br>


										<%-- <div class="box-content">
											<div class="col-md-2"> UI
												Complexity Type</div>
											<div class="col-md-3">
												<select name="ui_comp" id="ui_comp" class="form-control chosen"
													placeholder="UI Complexity" data-rule-required="true"
													onchange="getValue(1)">
													<option value="0">UI Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
														varStatus="count">
														<c:choose>
															<c:when test="${taskType.taskType==1}">
																<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
															</c:when>
														</c:choose>
													</c:forEach>
												</select>
											</div>

											 <div class="col-md-1"></div>
												<div class="col-md-2"> Web
													Service Complexity Type</div>
												<div class="col-md-3">
													<select name="web_serv_comp" id="web_serv_comp"
														onchange="getValue(2)" class="form-control chosen"
														placeholder="Web Service" data-rule-required="true">
														<option value="0">Web Service Type</option>
														<c:forEach items="${taskTypeList}" var="taskType"
															varStatus="count">
															<c:choose>
																<c:when test="${taskType.taskType==2}">
																	<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
																</c:when>
															</c:choose>
														</c:forEach>
													</select>
												</div>

											 
										</div><br>

										<div class="box-content">
											<div class="col-md-2">
												Consumption Complexity Type</div>
											<div class="col-md-3">
												<select name="consume_comp" id="consume_comp"
													class="form-control chosen" placeholder="UI Complexity"
													onchange="getValue(3)" data-rule-required="true">
													<option value="0">Consumption Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
														varStatus="count">
														<c:choose>
															<c:when test="${taskType.taskType==3}">
																<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
															</c:when>
														</c:choose>
													</c:forEach>
												</select>
											</div>

											<div class="col-md-1"></div>
												<div class="col-md-2"> Unit
													Testing Complexity Type</div>
												<div class="col-md-3">
													<select name="unit_test_comp" id="unit_test_comp"
														onchange="getValue(4)" class="form-control chosen"
														placeholder="Web Service" data-rule-required="true">
														<option value="0">Unit Testing Type</option>
														<c:forEach items="${taskTypeList}" var="taskType"
															varStatus="count">
															<c:choose>
																<c:when test="${taskType.taskType==1}">
																	<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
																</c:when>
															</c:choose>
														</c:forEach>
													</select>
												</div>

											 
										</div><br> 

										<div class="box-content">
											<label class="col-md-2">
												Special Function Type</label>
											<div class="col-md-3">
												<select name="sp_func_comp" id="sp_func_comp"
													class="form-control chosen" onchange="getValue(5)"
													placeholder="Special Function" data-rule-required="true">
													<option value="0">Special Function Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
														varStatus="count">
														<c:choose>
															<c:when test="${taskType.taskType==1}">
																<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
															</c:when>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div><br><br><br> --%>
										
									<c:forEach items="${complexityList}" var="complexityList" varStatus="count">		
										<div class="box-content">
											<div class="col-md-2">
												${complexityList.cmplxName}</div>
												<input type="radio" name="workType${complexityList.cmplxId}" value="0" checked>NONE
												<c:forEach items="${complexityList.cmplxOptionList}" var="cmplxOptionList" >
												<input type="radio" name="workType${complexityList.cmplxId}" value="${cmplxOptionList.cmplxOptId}" required>${cmplxOptionList.cmplxOptName}
												
												</c:forEach>
										</div> 
										<div class="box-content">
											 <div class="col-md-2"></div>
												<div class="col-md-3">
												<select name="empId${complexityList.cmplxId}" id="empId${complexityList.cmplxId}"
													class="form-control chosen" >
													<option value="">Select Developer</option>
													<c:forEach items="${employeeList}" var="employeeList" >
														 
													<option value="${employeeList.empId}"><c:out value="${employeeList.empName}"/></option>
														 
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-3">
												<input type="text" name="allocationDate${complexityList.cmplxId}"
											 placeholder="Assign Date" id="allocationDate${complexityList.cmplxId}" class="form-control date-picker" required />
											</div>
											
											<div class="col-md-1">
												<input type="text" name="requiredHours${complexityList.cmplxId}"
											 placeholder="Required Hours" pattern="[+-]?([0-9]*[.])?[0-9]+" id="requiredHours${complexityList.cmplxId}" class="form-control" title="Required Hours" required />
											</div>
											
										</div><br><br>
											<%-- <div class="col-md-3">
												<select name="workType${complexityList.cmplxId}" id="workType${complexityList.cmplxId}"
													class="form-control chosen" >
													<option value="">Select Complex Type</option>
													<c:forEach items="${complexityList.cmplxOptionList}" var="cmplxOptionList" >
														 
													<option value="${cmplxOptionList.cmplxOptId}"><c:out value="${cmplxOptionList.cmplxOptName}"/></option>
														 
													</c:forEach>
												</select>
											</div> --%>
											 
											<%-- <div class="col-md-3">
												<select name="empId${complexityList.cmplxId}" id="empId${complexityList.cmplxId}"
													class="form-control chosen" >
													<option value="">Select Developer</option>
													<c:forEach items="${employeeList}" var="employeeList" >
														 
													<option value="${employeeList.empId}"><c:out value="${employeeList.empName}"/></option>
														 
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-3">
												<input type="text" name="fromDate"
											value="${editEmployee.fromDate}" placeholder="Assign Date"
											id="fromDate" class="form-control date-picker" required />
											</div> --%>
											
										
										</c:forEach>
											 <br><br>
										<div style="text-align: center;">

											<input type="submit" 
												class="btn btn-info" value="Add Task">
										</div>

									</form>
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
									</div>
									  
									  
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
											<th class="col-md-2">Task Name</th>
											<th class="col-md-7">Task Description</th>
											<th class="col-md-1">Task Plan Hours</th>
											<th class="col-md-3">Task Type Name</th> 
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
					</div>
				</div>
				<footer>
	<p>2018 © AARYATECH SOLUTIONS</p>
	</footer>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-validation/dist/jquery.validate.min.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>

	<!--page specific plugin scripts-->
	<script
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!--page specific plugin scripts-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

	<script type="text/javascript">

function getValue(value){
	
	/* 
	<input	type="hidden" name="uicname" id="uicname" value="5">
	<input	type="hidden" name="webcomname" id="webcomname">
	<input	type="hidden" name="conscompname" id="conscompname">
	<input	type="hidden" name="testcomname" id="testcomname">
	<input	type="hidden" name="spcompname" id="spcompname">
	 */
	
	if(value==1){
		//alert("value="+value);
		
		var uicompName=$("#ui_comp option:selected").html();
		var prevValue=	document.getElementById("uicname").value;
		//alert("prev Value " +prevValue);

		document.getElementById("uicname").value=uicompName;
		
		//var newValue=	document.getElementById("uicname").value;
		//alert("new Value " +newValue);
	}
	
	if(value==2){
		//alert("value="+value);
		
		var uicompName=$("#web_serv_comp option:selected").html();
		var prevValue=	document.getElementById("webcomname").value;
		//alert("prev Value " +prevValue);

		document.getElementById("webcomname").value=uicompName;
		
	}
	
	if(value==3){
		//alert("value="+value);
		
		var uicompName=$("#consume_comp option:selected").html();
		var prevValue=	document.getElementById("testcomname").value;
		//alert("prev Value " +prevValue);

		document.getElementById("conscompname").value=uicompName;
		
	}
	
	if(value==4){
		//alert("value="+value);
		var uicompName=$("#unit_test_comp option:selected").html();
		var prevValue=	document.getElementById("testcomname").value;
		//alert("prev Value " +prevValue);

		document.getElementById("testcomname").value=uicompName;
		
	}
	
	if(value==5){
		//alert("value="+value);
		
		var uicompName=$("#sp_func_comp option:selected").html();
		var prevValue=	document.getElementById("spcompname").value;
		//alert("prev Value " +prevValue);
		document.getElementById("spcompname").value=uicompName;
		
	}
	
}

</script>

</body>
</html>

