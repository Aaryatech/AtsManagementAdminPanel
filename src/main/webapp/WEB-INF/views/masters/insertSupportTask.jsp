<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap-daterangepicker/daterangepicker.css" />

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<body>


	<c:url var="viewSupportTaskByEmpId" value="/viewSupportTaskByEmpId"></c:url>
	<c:url var="getModuleByProjectId" value="/getModuleByProjectId"></c:url>


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
					<i class="fa fa-file-o"></i>Support Task
				</h1>

				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->


		<!-- BEGIN Main Content -->
		<div class="box" id="addTask">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Support Task
				</h3>
				<div class="box-tool">
					<a onclick="showTaskList()">Support Task List</a>
				</div>

			</div>

			<form id="validation-form" class="form-horizontal"
				action="${pageContext.request.contextPath}/submitSupportTask"
				method="post">
				<div class=" box-content">

					<div class="box-content">

						<div class="col-md-2">Select Project*</div>
						<div class="col-md-3">
							<select id="projectId" name="projectId"
								onchange="getModIdByProjectId()" class="form-control chosen"
								required>
								<option value=""></option>

								<c:forEach items="${projList}" var="projList" varStatus="count">
									<c:choose>
										<c:when test="${projList.projectId==editSupport.projectId}">
											<option value="${projList.projectId}" selected>${projList.projectName}</option>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:forEach items="${projList}" var="projList" varStatus="count">
									<option value="${projList.projectId}">${projList.projectName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-md-1"></div>

						<div class="col-md-2">Select Module*</div>
						<div class="col-md-3">
							<select id="moduleId" name="moduleId" class="form-control chosen"
								required>
								<option value=""></option>
							</select>
						</div>

						<%-- 	<div class="col-md-2">Module Name*</div>
						<div class="col-md-3">
							<input type="text" id="moduleId"
								value="${editSupport.moduleName}" name="moduleId"
								class="form-control" placeholder="Module Name" required /> <input
								type="hidden" id="suppId" value="${editSupport.suppId}"
								name="suppId" />
						</div>
 --%>

					</div>
					<br>

					<div class="box-content">

						<div class="col-md-2">Date*</div>
						<div class="col-md-3">
							<input type="text" name="workDate" value="${date}"
								placeholder="Date" id="workDate"
								class="form-control date-picker" required />
						</div>

						<div class="col-md-1"></div>

						<div class="col-md-2">Task Hours*</div>
						<div class="col-md-3">
							<input type="text" id="taskHours"
								value="${editSupport.requiredHrs}"
								pattern="[+-]?([0-9]*[.])?[0-9]+" name="taskHours"
								class="form-control" placeholder=" Task Hours " required />
						</div>

					</div>
					<br>

					<div class="box-content">

						<div class="col-md-2">Select Employee*</div>

						<div class="col-sm-4 col-lg-3 controls">
							<select name="empId" id="empId" class="form-control chosen"
								placeholder="Allocation" required>
								<option value="">Select Employee</option>
								<c:forEach items="${empList}" var="empList" varStatus="count">
									<c:choose>
										<c:when test="${empList.empId==editproject.empId}">
											<option value="${empList.empId}" selected><c:out
													value="${empList.empName}" /></option>
										</c:when>
										<c:otherwise>
											<option value="${empList.empId}"><c:out
													value="${empList.empName}" /></option>
										</c:otherwise>
									</c:choose>


								</c:forEach>
							</select>
						</div>


						<div class="col-md-1"></div>

						<div class="col-md-2">Take Away</div>
						<div class="col-md-3">
							<input type="text" id="takeAway" value="${editSupport.takeAway}"
								name="takeAway" class="form-control" placeholder="Take Away" />
						</div>


					</div>
					<br> <br>
					<div class="box-content">
						<div class="col-md-2">Description*</div>
						<div class="col-sm-4 col-lg-3 controls">
							<textarea name="disc" id="disc" style="width: 300px;"></textarea>
						</div>

						<%-- <div class="col-md-3">
							<input type="text" id="disc" value="${editSupport.description}"
								name="disc" class="form-control" placeholder="Task Description "
								required />
						</div> --%>
					</div>

					<div class=" box-content">
						<div class="col-md-12" style="text-align: center">
							<input type="submit" class="btn btn-info" onclick="check()"
								value="Submit" id="submit">



						</div>
					</div>
					<div class="box-content"></div>
					<div class="box-content"></div>



				</div>

			</form>

		</div>

		<div class="box" id="supportTaskList" style="display: none">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Date Wise
				</h3>
				<div class="box-tool">
					<a onclick="showTaskList()">Insert Support Task</a>

				</div>

			</div>
			<div class=" box-content">

				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label">From Date:</label>
					<div class="col-sm-5 col-lg-3 controls">
						<input class="form-control date-picker" id="fromDate" size="16"
							type="text" name="fromDate" required />

					</div>

					<label class="col-sm-3 col-lg-2 control-label">To Date:</label>
					<div class="col-sm-5 col-lg-3 controls">
						<input class="form-control date-picker" id="toDate" size="16"
							type="text" name="toDate" required />

					</div>


				</div>
				<br>

			</div>
			<div class=" box-content">
				<div class="form-group">

					<div align="center" class="form-group">
						<!-- <div class="col-sm-25 col-sm-offset-3 col-lg-30 col-lg-offset-0"> -->
						<input type="button" class="btn btn-primary" value="All Record"
							id="searchmixall" onclick="pending()">

						<!-- </div><br> -->

						<div align="center" id="loader" style="display: none">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>


					</div>
				</div>
			</div>

			<div class=" box-content">
				<div class="row">
					<div class="col-md-12 table-responsive">
						<input type="hidden" name="flag" id="flag" value="${flag}">
						<table class="table table-bordered table-striped fill-head "
							style="width: 100%" id="table_grid1">
							<thead>

								<tr>
									<th>Sr.No.</th>

									<th>Project Name</th>
									<th>Module</th>
									<th>Employee</th>
									<th>Date</th>
									<th>Description</th>
									<th>Task Hours</th>
									<th>Action</th>

								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

	<script type="text/javascript">
		function check() {
			var projectId = $("#projectId").val();

			if (projectId == "" || projectId == null)
				alert("Select Project ");

		}
		var div = 0
		function showTaskList()

		{
			if (div == 0) {
				$('#addTask').hide();
				$("#supportTaskList").show();
				div = 1;
			} else if (div == 1) {
				$('#addTask').show();
				$("#supportTaskList").hide();
				div = 0;
			}

		}
	</script>

	<script type="text/javascript">
		function pending() {
			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();

			$
					.getJSON(
							'${viewSupportTaskByEmpId}',

							{

								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true'

							},
							function(data) {

								alert(data)
								$('#table_grid1 td').remove();
								if (data == "") {
									alert("No records found !!");

								}

								$
										.each(
												data,
												function(key, itemList) {

													var tr = $('<tr></tr>');
													tr.append($('<td></td>')
															.html(key + 1));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.projectName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.moduleName))
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.empName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.description))

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.workDate))

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.requiredHrs))
													tr
															.append($(
																	'<td></td>')
																	.html(
																			' <a href="${pageContext.request.contextPath}/editSupport/'+itemList.suppId+'" class="btn bnt-primary"> <i class="fa fa-list"></i></a> '));
													$('#table_grid1 tbody')
															.append(tr);

												})

							});
		}
	</script>


	<script type="text/javascript">
		function getModIdByProjectId() {

			var projectId = document.getElementById("projectId").value;

			$.getJSON('${getModuleByProjectId}', {

				projectId : projectId,
				ajax : 'true'
			}, function(data) {
				alert(data);

				var html = '<option value="">Select Project</option>';

				var len = data.length;
				for (var i = 0; i < len; i++) {
					html += '<option value="' + data[i].moduleId + '">'
							+ data[i].moduleName + ' &nbsp;&nbsp; </option>';
				}
				html += '</option>';
				$('#moduleId').html(html);
				$("#moduleId").trigger("chosen:updated");
			});
		}
	</script>

</body>
</html>