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
							<i class="fa fa-file-o"></i>Add Technology
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
									<i class="fa fa-bars"></i>Technology Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form
										action="${pageContext.request.contextPath}/insertTechnology"
										method="post" class="form-horizontal" id="validation-form"
										method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">
												Technology Name</label>
											<div class="col-sm-6 col-lg-4 controls">
												<input type="text" name="techName" id="techName"
													class="form-control" placeholder="Technology Name"
													data-rule-required="true" value="${editproject.techName}"
													required /> <input type="hidden" name="techId" id="techId"
													value="${editTech.techId}" />
											</div>

											<label class="col-sm-3 col-lg-2 control-label">Description</label>
											<div class="col-sm-6 col-lg-4 controls">
												<textarea name="descTech" id="descTech"
													style="width: 300px;"></textarea>
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
																test="${phaseTypeList.mPhaseId==editproject.mPhaseId}">
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
													<th>Technology Name</th>
													<th>Technology Desc</th>
													<!-- <th>Phase Name</th>
 -->
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${techList}" var="techList"
													varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${techList.techName}</td>
														<td>${techList.techDesc}</td>

														<td><a
															href="${pageContext.request.contextPath}/projectManagementTask/${techList.techId}"
															class="action_btn"> <abbr title="Detail"><i
																	class="fa fa-list"></i></abbr></a> <a
															href="${pageContext.request.contextPath}/editProject/${techList.techId}"><span
																class="glyphicon glyphicon-edit"></span></a></td>
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

