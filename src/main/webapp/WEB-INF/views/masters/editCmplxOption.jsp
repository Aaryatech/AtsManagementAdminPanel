<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<body>
	<c:url var="getComplexityOptionData" value="/getComplexityOptionData" />
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
							<i class="fa fa-file-o"></i>Edit Complexity Option
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
									<i class="fa fa-bars"></i>Complexity Option Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form
										action="${pageContext.request.contextPath}/insertEditComplexOption"
										method="post" class="form-horizontal" id="validation-form"
										method="post">

										<div class="form-group">


											<label class="col-sm-3 col-lg-2 control-label">Select
												Phase </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="mPhaseId" id="mPhaseId"
													class="form-control chosen" placeholder="Phase"
													multiple="multiple">
													<option value="0">All Phase</option>
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
												Technology </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="techId" id="techId"
													class="form-control chosen" placeholder="Technology"
													multiple="multiple">
													<option value="0">All Technology</option>
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
												Complex Option Name </label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="cmplxOptId" id="cmplxOptId"
													class="form-control chosen"
													placeholder="Complex Option Name">
													<option value="">Select Complex Option Name</option>
													<c:forEach items="${optList}" var="optList"
														varStatus="count">
														<c:choose>
															<c:when
																test="${optList.cmplxOptId==editCmplx.cmplxOptId}">
																<option value="${optList.cmplxOptId}" selected><c:out
																		value="${optList.cmplxOptName}" /></option>
															</c:when>
															<c:otherwise>
																<option value="${optList.cmplxOptId}"><c:out
																		value="${optList.cmplxOptName}" /></option>
															</c:otherwise>
														</c:choose>


													</c:forEach>
												</select>
											</div>
										</div>

										<div class=" box-content">
											<div class="col-md-12" style="text-align: center">
												<input type="button" class="btn btn-info" value="SEARCH"
													id="submit" onclick="search()">



											</div>
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
															<th>Complexity Option Name</th>
															<th>TechnologyName</th>
															<th>Phase Name</th>
															<th>Allocated Hours</th>

															<!-- <th>Action</th> -->
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${cmplxHrsList}" var="cmplxHrsList"
															varStatus="count">
															<tr class="table-flag-blue">
																<td>${count.index+1}</td>
																<td>${cmplxHrsList.cmplxName}</td>
																<td>${cmplxHrsList.cmplxOptName}</td>
																<td>${cmplxHrsList.techName}</td>

																<td>${cmplxHrsList.phaseName}</td>
																<%-- <td>${cmplxHrsList.allocatedHrs}</td> --%>
																<td><input class="form-control" id="allocatedHrs"
																	placeholder="Allocated Hours" type="number"
																	name="allocatedHrs${cmplxHrsList.cmplxId}"
																	value="${cmplxHrsList.allocatedHrs}" min="0"></td>

															</tr>
														</c:forEach>


													</tbody>
												</table>
											</div>
										</div>
										<div style="text-align: center;">

											<input type="submit" onclick="validateQty()"
												class="btn btn-info" value="Submit">
										</div>
									</form>
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
		function search() {
			alert("hii");
			/* $('#table1 tbody').empty(); */
			var mPhaseId = document.getElementById("mPhaseId").value;
			var techId = document.getElementById("techId").value;
			var cmplxOptId = document.getElementById("cmplxOptId").value;

			alert("mPhaseId" + mPhaseId);

			alert("techId" + techId);

			$
					.getJSON(
							'${getComplexityOptionData}',
							{
								mPhaseId : mPhaseId,
								techId : techId,
								cmplxOptId : cmplxOptId,

								ajax : 'true',

							},
							function(data) {
								$('#table1 td').remove();
								alert(data);

								if (data == "") {
									alert("No Record Found ");
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
																			itemList.cmplxName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.cmplxOptName));
													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.techName));

													tr
															.append($(
																	'<td></td>')
																	.html(
																			itemList.phaseName));
													tr
															.append($('<td > <input type="text" value="'+itemList.allocatedHrs+'"   id= allocatedHrs'+itemList.cmplxId+ ' class="form-control"   name=allocatedHrs'+ itemList.cmplxId+' ></td>'));
													$('#table1 tbody').append(
															tr);

												})

							}

					);

		}
	</script>


</body>
</html>

