<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>
	<c:url var="getProjTaskDetailAjax" value="/getProjTaskDetailAjax" />
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
							<i class="fa fa-file-o"></i> Project:${projName} <input
								type="hidden" id="projectId" value="${projId}">
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
									<i class="fa fa-bars"></i>Projects
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<!--  -->

								<div class="box-content">
									<div class="col-md-1">Technology</div>
									<div class="col-md-2">
										<select name="techId" id="techId" class="form-control chosen"
											data-rule-required="true">
											<option value="-1">Select All Technology</option>

											<c:forEach items="${techList}" var="techList">

												<option value="${techList.techId}"><c:out value="${techList.techName}"/></option>

											</c:forEach>

										</select>
									</div>


									<div class="col-md-1">Phase</div>
									<div class="col-md-2">
										<select name="phaseId" id="phaseId"
											class="form-control chosen" data-rule-required="true">
											<option value="">Select Phase</option>

											<c:forEach items="${phaseTypeList}" var="phaseTypeList">

												<option value="${phaseTypeList.mPhaseId}"><c:out value="${phaseTypeList.phaseName}"/></option>

											</c:forEach>

										</select>
									</div>

									<div class="col-md-1">Employee</div>
									<div class="col-md-2">
										<select name="empId" id="empId" class="form-control chosen"
											data-rule-required="true">
											<option value="-1">Select All Employee</option>

											<c:forEach items="${empList}" var="empList">

												<option value="${empList.empId}"><c:out value="${empList.empName}"/></option>

											</c:forEach>

										</select>
									</div>

									<div class="col-md-1">
										<input type="button" value="Search" style="width: 100%;"
											class="btn btn-primary" onclick="searchTaskDetail()" />
									</div>
									
									<div class="col-md-1">
										<input type="button" value="Pdf" style="width: 100%;"
											class="btn btn-primary" onclick="genPdf()" />
									</div>

								</div>

								<!--  -->



								<div class="box-content">

									<br /> <br />
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr>
													<th style="width: 18px">Sr No</th>
													<th class="col-md-1" style="text-align: center;">Date</th>
													<th class="col-md-1" style="text-align: center;">Technology</th>

													<th class="col-md-2" style="text-align: center;">Module Name</th>
													<th class="col-md-1" style="text-align: center;">Form</th>
													<th class="col-md-2" style="text-align: center;">Task Name</th>

													<th class="col-md-1" style="text-align: center;">Employee</th>
													<th class="col-md-1" style="text-align: center;">Plan Hrs</th>

													<th class="col-md-1" style="text-align: center;">Assigned Hrs</th>
													<th class="col-md-1" style="text-align: center;">Actual Req Hrs</th>

													<th class="col-md-1" style="text-align: center;">Task Cost</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${projTaskDetailList}" var="proj"
													varStatus="count">
													<tr class="table-flag-blue">
														<td  style="text-align: center;">${count.index+1}</td>
														<td class="col-md-1" style="text-align: center;">${proj.startDate}</td>
														<td  class="col-md-1" style="text-align: left;">${proj.techName}</td>
														<td class="col-md-2" style="text-align: left;">${proj.moduleName}</td>
														<td class="col-md-1" style="text-align: left;">${proj.formName}</td>
														<td class="col-md-2" style="text-align: left;">${proj.taskName}</td>
														<td class="col-md-1" style="text-align: center;">${proj.empName}</td>
														<td class="col-md-1" style="text-align: center;">${proj.planHr}</td>
														<td class="col-md-1" style="text-align: center;">${proj.assignHr}</td>
														<td class="col-md-1" style="text-align: center;">${proj.actualHr}</td>
														<td class="col-md-1" style="text-align: center;">${proj.empTaskCost}</td>
														<%-- <td><a
															href="${pageContext.request.contextPath}/projectManagementTask/${proj.projectId}"
															class="action_btn"> <abbr title="Detail"><i
																	class="fa fa-list"></i></abbr></a></td> --%>
													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group" id="range">



								<div class="col-sm-3  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();">
								</div>
							</div>
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
		function searchTaskDetail() {

			$('#table1 tbody').empty();
			var projectId = document.getElementById("projectId").value;
			
			var selectedTechId = $("#techId").val();
			var selectedPhaseId=$("#phaseId").val();
			
			var selectedEmp = $("#empId").val();
			//alert("selectedTechId " +selectedTechId +"selectedPhaseId " +selectedPhaseId);
			//alert("projectId " +projectId +"selectedEmp " +selectedEmp);
			

			//if (validate() == true) {

				$.getJSON('${getProjTaskDetailAjax}', {

					project_id : projectId,
					tech_id : selectedTechId,
					phase_id : selectedPhaseId,
					emp_id :  selectedEmp,
				

					ajax : 'true',

				}, function(data) {
					$('#table1 td').remove();
					if(data=="")
						{
						alert("No Record Found ");
						}
					$.each(data,
							function(key, taskList) {

								var tr = $('<tr></tr>');
								tr.append($('<td style="text-align: center;"></td>').html(key + 1));
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.startDate));
								tr.append($('<td  class="col-md-1" style="text-align: left;"></td>').html(taskList.techName));
								tr.append($('<td  class="col-md-2" style="text-align: left;"></td>').html(taskList.moduleName));
								tr.append($('<td  class="col-md-1" style="text-align: left;"></td>').html(taskList.formName));
								
								tr.append($('<td  class="col-md-2" style="text-align: left;"></td>').html(taskList.taskName));
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.empName));
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.planHr));
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.assignHr));
								
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.actualHr));
								tr.append($('<td  class="col-md-1" style="text-align: center;"></td>').html(taskList.empTaskCost));
							
								$('#table1 tbody').append(tr);

							})

				}

				);
			//}

		}
		function genPdf(){
			
			window.open('${pageContext.request.contextPath}/projectTaskPdf');

		}
	</script>
<script type="text/javascript">
function exportToExcel()
{
	window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled=true;
}
</script>

</body>
</html>

