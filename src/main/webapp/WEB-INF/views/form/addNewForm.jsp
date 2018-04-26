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
							<i class="fa fa-file-o"></i>Add New Form
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
									<i class="fa fa-bars"></i>Form Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>
							</div>
							<div>
								<div class="box-content">
									<form action="postForm" method="post"
										class="form-horizontal" id="validation-form" method="post">

										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> Form
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="form_type" id="form_type" class="form-control"
													placeholder="Project" data-rule-required="true">
													<option value="0">Form Type</option>
													<c:forEach items="${formTypeList}" var="formType"
												varStatus="count">
												<option value="${formType.formTypeId}"><c:out value="${formType.formTypeName}"/></option>
											</c:forEach>
												</select>
											</div>

											<div class="form-group">
												<label class="col-sm-3 col-lg-2 control-label">Form
													Name</label>
												<div class="col-sm-6 col-lg-4 controls">
													<input type="text" name="form_name" id="form_name"
														class="form-control" placeholder="Form Name"
														data-rule-required="true" required />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label">Description</label>
											<div class="col-sm-6 col-lg-4 controls">
												<textarea name="form_desc" id="form_desc"
													style="width: 1000px;"></textarea>
											</div>
										</div>
										
										
										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> UI Complexity
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="ui_comp" id="ui_comp" class="form-control"
													placeholder="UI Complexity" data-rule-required="true">
													<option value="0">UI Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
												varStatus="count">
												<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
											</c:forEach>
												</select>
											</div>

											<div class="form-group">
												<label class="col-sm-3 col-lg-2 control-label"> Web Service Complexity
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="web_serv_comp" id="web_serv_comp" class="form-control"
													placeholder="Web Service" data-rule-required="true">
													<option value="0">Web Service Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
												varStatus="count">
												<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
											</c:forEach>
												</select>
											</div>

											</div>
										</div>
										
										
										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> Consumption Complexity
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="consume_comp" id="consume_comp" class="form-control"
													placeholder="UI Complexity" data-rule-required="true">
													<option value="0">Consumption Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
												varStatus="count">
												<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
											</c:forEach>
												</select>
											</div>

											<div class="form-group">
												<label class="col-sm-3 col-lg-2 control-label"> Unit Testing Complexity
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="unit_test_comp" id="unit_test_comp" class="form-control"
													placeholder="Web Service" data-rule-required="true">
													<option value="0">Unit Testing Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
												varStatus="count">
												<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
											</c:forEach>
												</select>
											</div>

											</div>
										</div>
										
										
										<div class="form-group">
											<label class="col-sm-3 col-lg-2 control-label"> Special Function
												Type</label>
											<div class="col-sm-6 col-lg-4 controls">
												<select name="sp_func" id="sp_func" class="form-control"
													placeholder="Special Function" data-rule-required="true">
													<option value="0">Special Function Type</option>
													<c:forEach items="${taskTypeList}" var="taskType"
												varStatus="count">
												<option value="${taskType.taskTypeId}"><c:out value="${taskType.taskTypeName}"/></option>
											</c:forEach>
												</select>
										</div>
										</div>
										
										<div style="text-align: center;">

										<input type="submit" onclick="validateQty()"
											class="btn btn-info" value="Add Task">
									</div>
										
									</form>
								</div>

								<!-- <div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									type="text" id="myInput" onkeyup="myFunction()"
									placeholder="Search.." title="Type in a name">
								</label> <br>
 -->
								                            <div class="box-content">
                               
                                <br/><br/>
                                <div class="clearfix"></div>
<div class="table-responsive" style="border:0">
    <table class="table table-advance" id="table1">
        <thead>
            <tr>
                <th style="width:18px"><input type="checkbox" /></th>
                <th>Rendering engine</th>
                <th>Browser</th>
                <th>Platform(s)</th>
                <th class="text-center">Engine version</th>
                <th>CSS grade</th>
            </tr>
        </thead>
        <tbody>
            <tr class="table-flag-blue">
                <td><input type="checkbox" /></td>
                <td>Trident</td>
                <td>Internet Explorer 7</td>
                <td>Win XP SP2+</td>
                <td class="text-center">7</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Trident</td>
                <td><a href="#">AOL browser (AOL desktop)</a></td>
                <td>Win XP</td>
                <td class="text-center">6</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr class="table-flag-orange">
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td><span class="label label-success">Not Bad</span> Firefox 1.5</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="text-center">1.8</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td>Netscape Navigator 9</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="text-center">1.8</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td>Seamonkey 1.1</td>
                <td>Win 98+ / OSX.2+</td>
                <td class="text-center">1.8</td>
                <td><span class="label label-warning">B</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td>Mozilla 1.8</td>
                <td>Win 98+ / OSX.1+</td>
                <td class="text-center">1.8</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr class="table-flag-blue">
                <td><input type="checkbox" /></td>
                <td>Trident</td>
                <td><span class="label label-warning">So crazy!</span> <a href="#">Internet Explorer 6</a></td>
                <td>Win 98+</td>
                <td class="text-center">6</td>
                <td><span class="label label-important">C</span></td>
            </tr>
            <tr class="table-flag-red">
                <td><input type="checkbox" /></td>
                <td>Presto</td>
                <td>Opera 7.5</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="text-center">-</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr class="table-flag-red">
                <td><input type="checkbox" /></td>
                <td>Presto</td>
                <td><span class="label label-info">It's Opera!</span> Opera 8.0</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="text-center">-</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td><a href="#">Mozilla 1.0</a></td>
                <td>Win 95+ / OSX.1+</td>
                <td class="text-center">1</td>
                <td><span class="label label-warning">B</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td>Mozilla 1.1</td>
                <td>Win 95+ / OSX.1+</td>
                <td class="text-center">1.1</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr class="table-flag-blue">
                <td><input type="checkbox" /></td>
                <td>Misc</td>
                <td>IE Mobile</td>
                <td>Windows Mobile 6</td>
                <td class="text-center">-</td>
                <td><span class="label label-important">C</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td><a href="#">Mozilla 1.2</a></td>
                <td>Win 95+ / OSX.1+</td>
                <td class="text-center">1</td>
                <td><span class="label label-warning">B</span></td>
            </tr>
            <tr class="table-flag-red">
                <td><input type="checkbox" /></td>
                <td>Presto</td>
                <td>Opera 7.7</td>
                <td>Win 95+ / OSX.2+</td>
                <td class="text-center">-</td>
                <td><span class="label label-success">A</span></td>
            </tr>
            <tr>
                <td><input type="checkbox" /></td>
                <td>Gecko</td>
                <td>Mozilla 1.7</td>
                <td>Win 98+ / OSX.1+</td>
                <td class="text-center">1.8</td>
                <td><span class="label label-success">A</span></td>
            </tr>
        </tbody>
    </table>
</div>
                            </div>							</div>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>

       
	
</body>
</html>

