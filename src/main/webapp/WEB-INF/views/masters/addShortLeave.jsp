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
							<i class="fa fa-file-o"></i>Add Short Leave
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
									<form
										action="${pageContext.request.contextPath}/insertShortLeave"
										method="post" class="form-horizontal" id="validation-form"
										method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> User
												Name</label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="proj_name" id="proj_name"
													class="form-control" placeholder="User Name"
													data-rule-required="true" value="${login.empName}" readonly />

												<input type="hidden" value="${login.empId}" name="empId"
													id="empId">

											</div>

											<label class="col-sm-3 col-lg-2 control-label">Request
												To</label>
											<div class="col-sm-4 col-lg-3 controls">
												<select name="sendTo" id="sendTo"
													class="form-control chosen" placeholder="Send To" required>
													<option value="">Select</option>
													<c:forEach items="${empList}" var="empList"
														varStatus="count">
														<c:choose>
															<c:when
																test="${empList.empId==editproject.projectAllocatedTo}">
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

										</div>




										<div class="form-group">

											<label class="col-sm-3 col-lg-2 control-label"> Date
											</label>
											<div class="col-sm-4 col-lg-3 controls">
												<input type="text" name="date" placeholder="Date" id="date"
													class="form-control date-picker" required />
											</div>
											<label class="col-sm-3 col-lg-2 control-label">Select
												Hours</label>

											<div class="col-sm-4 col-lg-3 controls">
												<select name="hours" id="hours" class="form-control chosen"
													placeholder="Select Hours" required>
													<option value="1">1</option>
													<option value="2">2</option>

												</select>
											</div>


										</div>


										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Employee
												Remark</label>
											<div class="col-sm-12 col-lg-10 controls">

												<textarea name="empRemark" id="empRemark"
													style="width: 740px; height: 70px;"></textarea>
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
													<th>Date</th>
													<th>Request To</th>
													<th>Hours</th>

													<th>Description</th>


												</tr>
											</thead>
											<tbody>
												<c:forEach items="${shortLeaveList}" var="shortLeaveList"
													varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${shortLeaveList.date}</td>
														<td>${shortLeaveList.empName}</td>

														<td>${shortLeaveList.hours}</td>
														<td>${shortLeaveList.empRemark}</td>
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


	<!-- <script type="text/javascript">
		function calculateDays() {

			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();

			var aaplyHalfDay = $("#aaplyHalfDay").val();

			var initial = fromDate.split(/\-/).reverse().join('-');

			var end = toDate.split(/\-/).reverse().join('-');

			var diff = daysBetween(initial, end);

			if (aaplyHalfDay == 1) {
				document.getElementById("totalNoOfDays").value = diff - 0.5;
			} else if (aaplyHalfDay == 0) {
				document.getElementById("totalNoOfDays").value = diff;

			}
		}

		function treatAsUTC(date) {
			var result = new Date(date);
			result.setMinutes(result.getMinutes() - result.getTimezoneOffset());
			return result;
		}

		function daysBetween(startDate, endDate) {
			var millisecondsPerDay = 24 * 60 * 60 * 1000;
			return (treatAsUTC(endDate) - treatAsUTC(startDate))
					/ millisecondsPerDay;
		}
	</script>
 -->
</body>
</html>

