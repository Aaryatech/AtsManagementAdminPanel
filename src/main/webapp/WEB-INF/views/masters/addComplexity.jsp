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
							<i class="fa fa-file-o"></i>Add Complexity
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
									<i class="fa fa-bars"></i>Complexity Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form
										action="${pageContext.request.contextPath}/insertComplexity"
										method="post" class="form-horizontal" id="validation-form"
										method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">
												Complexity Name</label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="cmplxName" id="cmplxName"
													class="form-control" placeholder="Complexity Name"
													data-rule-required="true" value="${editCmplx.cmplxName}"
													required /> <input type="hidden" name="cmplxId"
													id="cmplxId" value="${editCmplx.cmplxId}" />
											</div>


											<label class="col-sm-3 col-lg-2 control-label">Select
												Technology </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="techId" id="techId"
													class="form-control chosen" placeholder="Technology"
													required>
													<option value="">Select Technology</option>
													<c:forEach items="${techList}" var="techList"
														varStatus="count">
														<c:choose>
															<c:when test="${techList.techId==editCmplx.techId}">
																<option value="${techList.techId}" selected><c:out
																		value="${techList.techName}" /></option>
															</c:when>
															<c:otherwise>
																<option value="${techList.techId}"><c:out
																		value="${techList.techName}" /></option>
															</c:otherwise>
														</c:choose>


													</c:forEach>
												</select>
											</div>

										</div>


										<div class="form-group">


											<label class="col-sm-3 col-lg-2 control-label">Select
												Phase </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="mPhaseId" id="mPhaseId"
													class="form-control chosen" placeholder="Phase" required>
													<option value="">Select Phase</option>
													<c:forEach items="${phaseTypeList}" var="phaseTypeList"
														varStatus="count">
														<c:choose>
															<c:when
																test="${phaseTypeList.mPhaseId==editCmplx.mPhaseId}">
																<option value="${phaseTypeList.mPhaseId}" selected><c:out
																		value="${phaseTypeList.phaseName}" /></option>
															</c:when>
															<c:otherwise>
																<option value="${phaseTypeList.mPhaseId}"><c:out
																		value="${phaseTypeList.phaseName}" /></option>
															</c:otherwise>
														</c:choose>


													</c:forEach>
												</select>
											</div>

											<label class="col-sm-3 col-lg-2 control-label">Select
												Form Type </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="formTypeId" id="formTypeId"
													class="form-control chosen" placeholder="Form" required>
													<option value="">Select Form Type</option>
													<c:forEach items="${formList}" var="formList"
														varStatus="count">
														<c:choose>
															<c:when
																test="${formList.formTypeId==editCmplx.formTypeId}">
																<option value="${formList.formTypeId}" selected><c:out
																		value="${formList.formTypeName}" /></option>
															</c:when>
															<c:otherwise>
																<option value="${formList.formTypeId}"><c:out
																		value="${formList.formTypeName}" /></option>
															</c:otherwise>
														</c:choose>


													</c:forEach>
												</select>
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
													<th>Sr No</th>
													<th>Complexity Name</th>
													<th>Technology Name</th>
													<th>Form Type Name</th>
													<th>Phase Name</th>

													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${compList}" var="compList"
													varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${compList.cmplxName}</td>
														<td>${compList.techName}</td>
														<td>${compList.formTypeName}</td>
														<td>${compList.phaseName}</td>


														<td><a
															href="${pageContext.request.contextPath}/editComp/${compList.cmplxId}"><span
																class="glyphicon glyphicon-edit"></span></a> <a
															href="${pageContext.request.contextPath}/deleteComp/${compList.cmplxId}"
															onClick="return confirm('Are you sure want to delete this record');"><span
																class="glyphicon glyphicon-remove"></span></a></td>
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




</body>
</html>

