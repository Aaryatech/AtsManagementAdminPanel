<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<i class="fa fa-file-o"></i>Approve Leave
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
									<i class="fa fa-bars"></i>Leave Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form action="${pageContext.request.contextPath}/approveLeave"
										method="post" class="form-horizontal" id="validation-form"
										method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">
												Employee Name</label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="proj_name" id="empName"
													class="form-control" placeholder="Employee Name"
													data-rule-required="true" value="${leaveDetail.empName}"
													readonly /> <input type="hidden" name="leaveId"
													id="leaveId" value="${leaveDetail.leaveId}" /> <input
													type="hidden" name="empId" id="empId"
													value="${leaveDetail.empId}" />
											</div>


											<label class="col-sm-3 col-lg-2 control-label">Total
												No of Days</label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="totalNoOfDays" id="totalNoOfDays"
													value="${leaveDetail.noOfDays}" class="form-control"
													placeholder="Total Leaves " required />
											</div>

										</div>

										<div class="form-group">

											<label class="col-sm-3 col-lg-2 control-label">From
												Date </label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="fromDate"
													value="${leaveDetail.fromDate}" placeholder="From Date"
													id="fromDate" class="form-control date-picker" required />
											</div>

											<label class="col-sm-3 col-lg-2 control-label">To
												Date </label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="toDate"
													value="${leaveDetail.toDate}" placeholder="To Date"
													id="toDate" class="form-control date-picker" required />
											</div>


										</div>



										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Type
												of Leave </label>
											<div class="col-sm-4 col-lg-3 controls">
												<c:choose>
													<c:when test="${leaveDetail.type==0}">
														<div class="col-md-6">


															<input type="radio" name="type" id="type" value="0"
																checked> Sick Leave


														</div>

														<div class="col-md-6">
															<input type="radio" name="type" id="type" value="1">Casual
															Leave
														</div>
													</c:when>
													<c:otherwise>
														<div class="col-md-6">

															<input type="radio" name="type" id="type" value="0">
															Sick Leave


														</div>

														<div class="col-md-6">
															<input type="radio" name="type" id="type" value="1"
																checked>Casual Leave
														</div>
													</c:otherwise>
												</c:choose>


											</div>

											<label class="col-sm-3 col-lg-2 control-label">Pay
												Leave </label>
											<div class="col-sm-4 col-lg-3 controls">
												<c:choose>
													<c:when test="${leaveDetail.payLeave==0}">
														<div class="col-md-6">

															<input type="radio" name="payLeave" id="payLeave"
																value="0" checked> With Pay

														</div>

														<div class="col-md-6">
															<input type="radio" name="payLeave" id="payLeave"
																value="1"> Without Pay
														</div>
													</c:when>
													<c:otherwise>

														<div class="col-md-6">

															<input type="radio" name="payLeave" id="payLeave"
																value="0"> With Pay

														</div>

														<div class="col-md-6">
															<input type="radio" name="payLeave" id="payLeave"
																value="1" checked> Without Pay
														</div>
													</c:otherwise>
												</c:choose>

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Employee
												Remark</label>
											<div class="col-sm-12 col-lg-10 controls">


												<textarea name="empRemark" id="empRemark"
													style="width: 733px; height: 36px;">${leaveDetail.empRemark}</textarea>
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Approval
												Remark</label>
											<div class="col-sm-12 col-lg-10 controls">

												<textarea name="appRemark" id="appRemark"
													style="width: 740px; height: 70px;">${leaveDetail.approveRemark}</textarea>
											</div>
										</div>
										<div style="text-align: center;">

											<input type="submit" class="btn btn-info" value="Submit">
										</div>
									</form>
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




</body>
</html>

