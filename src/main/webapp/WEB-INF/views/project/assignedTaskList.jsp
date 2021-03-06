<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assigned Task List</title>



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
<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">



<!--basic scripts-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write(
							'<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
</script>
<script
	src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

<!--page specific plugin scripts-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

<!--flaty scripts-->
<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
</head>
<body>


	<div class="container" id="main-container">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

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

						<i class="fa fa-file-o"></i>Assigned Task

					</h1>
				</div>
			</div>
			<!-- END Page Title -->

			<div class="row">
				<div class="col-md-12">

					<div class="box" id="todayslist">
						<div class="box-title">
							<h3>
								<i class="fa fa-table"></i>Assigned Task List
							</h3>

						</div>


						<form action="${pageContext.request.contextPath}/completeTask"
							id="start_dist_form" method="post">
							<div class="box-content">

								<br /> <br />
								<div class="clearfix"></div>
								<div class="table-responsive" style="border: 0">
									<table class="table table-advance" id="table1">
										<thead>
											<tr>
											
												<th style="width: 2%"></th>
												<th style="width: 2%">Sr No.</th>
												<th class="col-md-1" style="text-align: center;">Start Date</th>
												<th class="col-md-2" style="text-align: center;">Project Name</th>
												<th class="col-md-2" style="text-align: center;">Module Name</th>
												<th class="col-md-1" style="text-align: center;">Form Name</th>
												<th class="col-md-2" style="text-align: center;">Task Name</th>
												<th class="col-md-1" style="text-align: center;">Req Hours</th>

											</tr>
										</thead>
										<tbody>

											<c:forEach items="${assignedTask}" var="assignTask"
												varStatus="count">
												<tr class="table-flag-blue">
													<td style="width: 2%"><input type="checkbox"
														value="${assignTask.taskId}" id='task${assignTask.taskId}'
														name='task' onchange="callReq(this.value)" /></td>
													<td style="width: 2%">${count.index+1}</td>

													<td class="col-md-1" style="text-align: center;">${assignTask.startDate}</td>
													<td class="col-md-2" style="text-align: left;">${assignTask.projectName}</td>
													<td class="col-md-2" style="text-align: left;">${assignTask.moduleName}</td>
													<td class="col-md-1" style="text-align: left;">${assignTask.formName}</td>
													<td class="col-md-2" style="text-align: left;">${assignTask.taskName}</td>

													<td class="col-md-1" style="text-align: center;"><input type="text" style="text-align: center;" class="form-control"
														id='req_hrs${assignTask.taskId}'
														name='req_hrs${assignTask.taskId}' value="0"></td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
							<input type="button" class="btn btn-info" value="Submit"
								id="submitButton" onclick="valthisform()" disabled>

						</form>
					</div>
				</div>
			</div>

			<!-- END Main Content -->
			<footer>
			<p>2018 � AARYATECH SOLUTIONS</p>
			</footer>

			<a id="btn-scrollup" class="btn btn-circle btn-lg" href="#"><i
				class="fa fa-chevron-up"></i></a>
		</div>
		<!-- END Content -->
	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		function callReq(taskId) {
			//alert("Hi" + taskId);

			var checkboxs = document.getElementById("task" + taskId);
//alert(checkboxs);
			var okay = false;

			if (checkboxs.checked) {
				okay = true;
		
			}

			if (okay) {
				document.getElementById("req_hrs" + taskId).required = true;
				//var form=document.getElementById("start_dist_form");
//alert("req =true");
				//form.submit();
				 
				//document.getElementById('submitButton').disabled = false;
			} else{
				document.getElementById("req_hrs" + taskId).required = false;
			//document.getElementById('submitButton').disabled = true;
			}
			
			
			var checkboxs=document.getElementsByName("task");
		    var okay=false;
		    for(var i=0,l=checkboxs.length;i<l;i++)
		    {
		        if(checkboxs[i].checked)
		        {
		            okay=true;
		            break;
		        }
		    }
		    if(okay){
		    	document.getElementById('submitButton').disabled = false;
		    }else{
		    	document.getElementById('submitButton').disabled = true;
		    }
		}
	</script>

	<script>
		
		function valthisform()
		{
		    var checkboxs=document.getElementsByName("task");
		    var okay=false;
		    for(var i=0,l=checkboxs.length;i<l;i++)
		    {
		        if(checkboxs[i].checked)
		        {
		            okay=true;
		            break;
		        }
		    }
		    if(okay){
		    	
		    	var form=document.getElementById("start_dist_form");
		    	
		    	form.submit();
		    }
		    else alert("Please check a checkbox");
		}
	</script>




</body>
</html>