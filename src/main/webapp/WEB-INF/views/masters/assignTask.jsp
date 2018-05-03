<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	 
<c:url var="getFormListByProjectId" value="/getFormListByProjectId"></c:url> 


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
					<i class="fa fa-file-o"></i>Assign Task
				</h1>
				
				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		
		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Assign Task
				</h3>
				<div class="box-tool">
				<a href="${pageContext.request.contextPath}/formListForAssignTask">Form List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
				</div>

			</div> 
			<form  id="validation-form" class="form-horizontal"
						action="${pageContext.request.contextPath}/submitAssignTask" method="post">
			
				<div class=" box-content">
				
				 <div class="box-content">
							
								<div class="col-md-2">Project Name: </div>
									<div class="col-md-3">
									 ${taskList[0].projectName }
									 
									</div>
								<div class="col-md-1"></div>	
									<div class="col-md-2">Module Name: </div>
									<div class="col-md-3">
									 ${taskList[0].moduleName }
									 
									</div>
									
								 
								
				 
							</div><br>
							
							 <div class="box-content">
							
								<div class="col-md-2">Form Name: </div>
									<div class="col-md-3">
									 ${taskList[0].formName }
									 
									</div>
								  
							</div><br>
				 
					 <div class="box-content">

									<br /> <br />
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr>
												 	<th style="width:18px"><input type="checkbox" onClick="selectAll(this)" /></th>
													<th style="width: 18px">Sr No</th>
													<th>Task Name</th>
													<th>Task Type</th>
													<th>Desc</th> 
													<th>Sp Remark</th>  
													<th>Plan Hours</th> 
													<th>Developer</th> 
													<th>Tester</th> 
												  	<th>Status</th>   
												</tr>
											</thead>
											<tbody>
												 <c:forEach items="${taskList}" var="taskList" varStatus="count">
												 
												 <c:choose>
														<c:when test="${taskList.devStatus==1}">
															<c:set var="sts" value="Assign"></c:set>
														</c:when>
														<c:when test="${taskList.devStatus==2}">
															<c:set var="sts" value="Start"></c:set>
														</c:when>
														<c:when test="${taskList.devStatus==3}">
															<c:set var="sts" value="Complete"></c:set>
														</c:when>
														<c:otherwise>
															<c:set var="sts" value="Not Assign"></c:set>
														</c:otherwise>
												</c:choose>
													<tr class="table-flag-blue">
													 <td><input type="checkbox" onclick="requiredValidation(${taskList.taskId});"  name="select_to_approve" id="select_to_approve${taskList.taskId}" value="${taskList.taskId}"   /></td>
														<td>${count.index+1}<input type="hidden" id="key${taskList.taskId}" name="key${taskList.taskId}" value="${count.index+1}"   /></td>
														<td>${taskList.taskName}</td>
														<td>${taskList.taskTypeName}</td>
														<td><input type="text" id="desc${taskList.taskId}" name="desc${taskList.taskId}" class="form-control" 
																			value="${taskList.taskDescription}" placeholder="Description"  /></td>
														<td><input type="text" id="remark${taskList.taskId}" name="remark${taskList.taskId}" class="form-control" 
														value="${taskList.taskSpRemarks}" placeholder="Remark"  /></td> 
														   <c:choose>
															<c:when test="${taskList.devStatus>0}">
																<td style="width: 100px"><input type="text" pattern="[+-]?([0-9]*[.])?[0-9]+" id="planHours${taskList.taskId}" name="planHours${taskList.taskId}" class="form-control" 
																value="${taskList.taskPlannedHrs}" placeholder="Plan Hours"  /></td>
																
															</c:when>
															<c:otherwise>
																 <c:forEach items="${taskTypeList}" var="taskTypeList" >
																 	<c:choose>
																 		<c:when test="${taskList.taskTypeId==taskTypeList.taskTypeId}">
																	 		<td style="width: 100px"><input type="text" pattern="[+-]?([0-9]*[.])?[0-9]+" id="planHours${taskList.taskId}" name="planHours${taskList.taskId}" class="form-control" 
																			value="${taskTypeList.taskPlannedHrs}" placeholder="Plan Hours"  /></td>
																			
																 		</c:when>
																 	</c:choose>
																 </c:forEach>
															
															</c:otherwise>
														</c:choose>
									
														<td style="width: 200px"> <select id="devlpr${taskList.taskId}" name="devlpr${taskList.taskId}"    class="form-control chosen"  >
																<c:forEach items="${empList}" var="empList" varStatus="count">
																	<c:choose>
																		<c:when test="${empList.empId==taskList.developerId}">
																			<option value="${empList.empId}" selected>${empList.empName}</option>
																		</c:when> 
																	</c:choose> 
																</c:forEach>
																
										 						<option value=""></option>
																	<c:forEach items="${empList}" var="empList" varStatus="count">
														 				<option value="${empList.empId}">${empList.empName}</option>
																	</c:forEach> 
															 </select> 
														</td>
														
														<td style="width: 200px"> <select id="tester${taskList.taskId}" name="tester${taskList.taskId}"    class="form-control chosen"  >
																<c:forEach items="${empList}" var="empList" varStatus="count">
																	<c:choose>
																		<c:when test="${empList.empId==taskList.testerId}">
																			<option value="${empList.empId}" selected>${empList.empName}</option>
																		</c:when> 
																	</c:choose> 
																</c:forEach>
																
										 						<option value=""></option>
																	<c:forEach items="${empList}" var="empList" varStatus="count">
														 				<option value="${empList.empId}">${empList.empName}</option>
																	</c:forEach> 
															 </select> 
														</td>
														 
														<td>${sts}</td>
														 
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
								
								<div class=" box-content">
					<div class="col-md-12" style="text-align: center">
						<input type="submit" class="btn btn-info" value="Assign Task" id="submit" onclick="dropDownValidation();" >
					 


					</div>
				</div>

		</div>
		</form>
				 
	 
	</div>
	 
	</div>
	<!-- END Main Content -->

	<footer>
	<p>2018 © SONA ELECTRICALS.</p>
	</footer>

	<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
		class="fa fa-chevron-up"></i></a>

 

	

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
		src="${pageContext.request.contextPath}/resources/assets/chosen-bootstrap/chosen.jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-duallistbox/duallistbox/bootstrap-duallistbox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/dropzone/downloads/dropzone.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/clockface/js/clockface.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-switch/static/js/bootstrap-switch.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/ckeditor/ckeditor.js"></script>

	<!--flaty scripts-->
	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
		
		<script type="text/javascript">
		
		function requiredValidation(taskId)
		{
			 
			 
			if(document.getElementById("select_to_approve"+taskId).checked == true)
				{
				document.getElementById("planHours"+taskId).required = true;
				document.getElementById("devlpr"+taskId).required = true;
				 
				}
			else
				{
				document.getElementById("planHours"+taskId).required = false;
				document.getElementById("devlpr"+taskId).required = false;
				}
			 					 	 
			 
		}
		
		function dropDownValidation()
		{
			 
			 
			 var select_to_approve = document.forms[0];
			 
			 for (i = 0; i < select_to_approve.length; i++) {
			        if (select_to_approve[i].checked  && select_to_approve[i].value!="on" ) 
			        { 
			        	 if(document.getElementById("devlpr"+select_to_approve[i].value).value=="")
			        		 alert("Select Devloper of " + document.getElementById("key"+select_to_approve[i].value).value +"  Task" );
			        }
			    } 
			 
			 			 	 
			 
		}
		
		
		</script>
		
</body>
</html>