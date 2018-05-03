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
							<i class="fa fa-file-o"></i>Add Project
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
									<i class="fa fa-bars"></i>Project Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form action="${pageContext.request.contextPath}/postProject" method="post"
										class="form-horizontal" id="validation-form" method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">
												Project Name</label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="proj_name" id="proj_name"
													class="form-control" placeholder="Project Name"
													data-rule-required="true" value="${editproject.projectName}" required />
													<input type="hidden" name="projectId" id="projectId" value="${editproject.projectId}" />
											</div>

											<label class="col-sm-3 col-lg-2 control-label">Description</label>
											<div class="col-sm-6 col-lg-4 controls">
												<textarea name="desc" id="desc" style="width: 300px;"></textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Referenced
												By</label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="ref_by" id="ref_by"
													value="${editproject.referenceBy}" class="form-control" placeholder="Reference"
													data-rule-required="true" />
											</div>
											<label class="col-sm-3 col-lg-2 control-label">Cost </label>
											<div class="col-sm-6 col-lg-4 controls">
												<input id="cost" type="number" name="cost"
												value="${editproject.projectCost}"	class="form-control" data-rule-required="true" required />
											</div>
										</div>

										<div class="form-group">


											<label class="col-sm-3 col-lg-2 control-label">Allocated
												To</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="proj_alloc" id="proj_alloc"
													class="form-control chosen" placeholder="Allocation"
													required>
													<option value="">Select Empl</option>
													<c:forEach items="${empList}" var="empList"
														varStatus="count">
														<c:choose>
															<c:when test="${empList.empId==editproject.projectAllocatedTo}">
															<option value="${empList.empId}" selected><c:out value="${empList.empName}"/></option>
															</c:when>
															<c:otherwise>
														<option value="${empList.empId}"><c:out value="${empList.empName}"/></option>
															</c:otherwise>
														</c:choose>
														
														
													</c:forEach>
												</select>
											</div>

											<label class="col-sm-3 col-lg-2 control-label">Start
												Date </label>

											<div class="col-sm-3 col-lg-2 controls">
												<input class="form-control date-picker" value="${editproject.projectStartDate}" id="start_date"
													size="10" type="text" name="start_date" required />
											</div>
 

										</div>
										
										<div class="form-group">
										
										<label class="col-sm-3 col-lg-2 control-label"> Expected End Date </label>

											<div class="col-sm-6 col-lg-4 controls">
												<input class="form-control date-picker" placeholder="Expected End Date" value="${editproject.projectExpEndDate}" id="projectExpEndDate"
													size="10" type="text" name="projectExpEndDate" required />
											</div>
 
											<label class="col-sm-3 col-lg-2 control-label"> End Date </label>

											<div class="col-sm-6 col-lg-4 controls">
												<input class="form-control date-picker" placeholder="End Date" value="${editproject.projectEndDate}" id="endDate"
													size="10" type="text" name="endDate"   />
											</div>
											
										  

										</div>
										
										<div class="form-group">
										
										<label class="col-sm-3 col-lg-2 control-label">Development %  </label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="devPer" id="devPer"
													value="${editproject.devPer}" class="form-control" placeholder="Development %"
													data-rule-required="true" />
											</div>
 
											<label class="col-sm-3 col-lg-2 control-label">Complete %  </label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="compPer" id="compPer"
													value="${editproject.compPer}" class="form-control" placeholder="Complete %"
													data-rule-required="true" />
											</div>
											 
										</div>
										
										<div style="text-align: center;">

												<input type="submit" onclick="validateQty()"
													class="btn btn-info" value="Submit">
											</div>
									</form>
								</div>
								
								

								<div class="box-content">

									<br /> <br />
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr>
													<th style="width: 18px">Sr No</th>
													<th>Name</th>
													<th>Reference By</th>
													<th>Cost</th>
													<th class="text-center">Allocated to</th>
													<th>Start Date</th>
													<th>Dev. Per</th>
													<th>Com. Per</th>
													<th class="text-center">Status</th>
													<th>End Date</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${projList}" var="proj" varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${proj.projectName}</td>
														<td>${proj.referenceBy}</td>
														<td>${proj.projectCost}</td>
														<td>${proj.empName}</td>
														<td>${proj.projectStartDate}</td>
														<td>${proj.devPer}</td>
														<td>${proj.compPer}</td>
														<td>${proj.status}</td>
														<td>${proj.projectEndDate}</td>
														<td><a href="${pageContext.request.contextPath}/projectManagementTask/${proj.projectId}" class="action_btn" >
						<abbr title="Detail"><i class="fa fa-list"></i></abbr></a>
														<a
											href="${pageContext.request.contextPath}/editProject/${proj.projectId}"><span
												class="glyphicon glyphicon-edit"></span></a> </td>
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
			</div>
			<!-- END Main Content -->
			<footer>
				<p>2018 © ATS</p>
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




</body>
</html>

