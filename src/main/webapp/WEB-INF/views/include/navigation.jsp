<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.ats.adminpanel.common.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Dashboard - Admin</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

<!--base css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css">

<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaty-responsive.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/img/favicon.png">
</head>
<body>


	<!-- BEGIN Navbar -->

	<div id="navbar" class="navbar"
		style="width: 100%; text-align: center; padding: 15px 0px;">
		<button type="button" class="navbar-toggle navbar-btn collapsed"
			data-toggle="collapse" data-target="#sidebar">
			<span class="fa fa-bars"></span>
		</button>

		<!-- BEGIN Navbar Buttons -->
		<ul class="nav flaty-nav pull-right">

			<!-- BEGIN Button User -->
			<li class="user-profile"><a data-toggle="dropdown" href="#"
				class="user-menu dropdown-toggle"> <i class="fa fa-caret-down"></i>
			</a> <!-- BEGIN User Dropdown -->
				<ul class="dropdown-menu dropdown-navbar" id="user_menu">

					</a></li>

		</ul>
		<!-- BEGIN User Dropdown -->
		</li>
		<!-- END Button User -->
		</ul>
		<!-- END Navbar Buttons -->
	</div>
	<!-- END Navbar -->

	<!-- BEGIN Container -->
	<div class="container" id="main-container">
		<!-- BEGIN Sidebar -->
		<div id="sidebar" class="navbar-collapse collapse">

			<!-- BEGIN Navlist -->
			<a class="navbar-brand" href="#"
				style="width: 100%; text-align: center; padding: 15px 0px;"> <img
				src="${pageContext.request.contextPath}/resources/img/sona.jpg"
				style="position: relative;" alt="">
			</a>
			<div style="clear: both;"></div>
			<ul class="nav nav-list">
				<li class="active"><a
					href="${pageContext.request.contextPath}/homePage"> <i
						class="fa fa-dashboard"></i> <span>Dashboard</span>
				</a></li>

				<c:forEach items="${sessionScope.newModuleList}" var="allModuleList"
					varStatus="count">

					<c:choose>
						<c:when test="${allModuleList.moduleId==Constants.mainAct}">
							<li class="active">
						</c:when>

						<c:otherwise>
							<li>
						</c:otherwise>
					</c:choose>



					<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
						<span><c:out value="${allModuleList.moduleName}" /></span> <b
						class="arrow fa fa-angle-right"></b>
					</a>
					<!-- BEGIN Submenu -->
					<ul class="submenu">

						<c:forEach items="${allModuleList.subModuleJsonList}"
							var="allSubModuleList">


							<c:choose>
								<c:when test="${allSubModuleList.subModuleId==Constants.subAct}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/<c:out value="${allSubModuleList.subModuleMapping}" />"><c:out
									value="${allSubModuleList.subModulName}" /></a>
							</li>


						</c:forEach>


					</ul>
					<!-- END Submenu -->
					</li>
				</c:forEach>





				<c:choose>
					<c:when test="${Constants.mainAct==11}">
						<li class="active">
					</c:when>

					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${sessionScope.employee.empType==2}">
						<c:choose>
							<c:when test="${Constants.mainAct==1}">
								<li class="active">
							</c:when>

							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
						<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
							<span>Masters</span> <b class="arrow fa fa-angle-right"></b>
						</a>
						<!-- BEGIN Submenu -->
						<ul class="submenu">

							<c:choose>
								<c:when test="${Constants.subAct==11}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/addEmployee">Add
								Employee</a>
							</li>


							<c:choose>
								<c:when test="${Constants.subAct==12}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/allEmployeeList">Employee
								List</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddProject">Add
								Project</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==44}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/getProjList">Proj
								List</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==14}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddNewModule">Add
								Module</a>
							</li>


							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddTechnology">Add
								Technology</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddComplexity">Add
								Complexity</a>
							</li>


							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddComplexOption">Add
								Complexity Option</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/showEditComplexOption">Edit
								Complexity Option</a>
							</li>


							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddFormType">Add
								Form Type</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showAddLeave">Add
								Leave</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showApproveLeave">Approve
								Leave</a>
							</li>



							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/showShortLeave">Add
								Short Leave</a>
							</li>
							<c:choose>
								<c:when test="${Constants.subAct==13}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/showApproveShortLeave">Approve
								Short Leave</a>
							</li>




							<%-- <li> 
					<a href="${pageContext.request.contextPath}/showAddNewForm">Add Form</a>
					</li> --%>

							<%-- <li> 
					<a href="${pageContext.request.contextPath}/addGroup">Add Group</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/addCategory">Add Category</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/addItem">Add Item</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/addCustomer">Add Customer</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/addUser">Add User</a>
					</li> --%>

						</ul>
						</li>
						<c:choose>
							<c:when test="${Constants.mainAct==2}">
								<li class="active">
							</c:when>

							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>
						<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
							<span>Task Transaction</span> <b class="arrow fa fa-angle-right"></b>
						</a>
						<!-- BEGIN Submenu -->
						<ul class="submenu">

							<c:choose>
								<c:when test="${Constants.subAct==21}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/formListForAssignTask">Assign
								Task</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==22}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/assignSpecialTask">Assign
								Special Task</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==23}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/viewAllSpecialTask">View
								Special Task</a>
							</li>
							<c:choose>
								<c:when test="${Constants.subAct==11}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/insertSupportTask">Add
								Support Task</a>
							</li>


						</ul>
						</li>

						<c:choose>
							<c:when test="${Constants.mainAct==3}">
								<li class="active">
							</c:when>

							<c:otherwise>
								<li>
							</c:otherwise>
						</c:choose>

						<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
							<span>Reports</span> <b class="arrow fa fa-angle-right"></b>
						</a>
						<!-- BEGIN Submenu -->
						<ul class="submenu">
							<c:choose>
								<c:when test="${Constants.subAct==31}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/viewEmpConsumptionReport">Employee
								Consumption Report</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==32}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/viewEmpAllocatedWorkReport">Employee
								Allocated Work</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==33}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/viewEmpPerformanceReport">Employee
								Performance</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==34}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/viewDevelopmentHrsReport">Development
								Hours</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==35}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a
								href="${pageContext.request.contextPath}/viewProjectPhaseTrackingReport">Project
								Phase Tracking</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==36}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/ongoingProjecList">Ongoing
								Project List</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==37}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/projectCostReport">Project
								Cost Report</a>
							</li>

							<c:choose>
								<c:when test="${Constants.subAct==36}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
							<a href="${pageContext.request.contextPath}/viewLeaveReport">Leave
								Report</a>
							</li>

						</ul>
						</li>
					</c:when>
				</c:choose>

				<%-- <a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>Stock</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">
					<li> 
					<a href="${pageContext.request.contextPath}/itemStock">Insert Opening Stock</a>
					</li>
					
					<li> 
					<a href="${pageContext.request.contextPath}/getCurrentStock">Get Current Stock</a>
					</li>
				
				</ul>
				<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>GRN/GVN</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">
					<li> 
					<a href="${pageContext.request.contextPath}/insertGrn">GRN GVN</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/replaceQtyFromCustmer">Replace Item</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/grnItemHistory">GRN GVN List</a>
					</li>
				</ul>
				
				<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>Purchase Report</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">
				
					
					<li> 
					<a href="${pageContext.request.contextPath}/billWise">Bill Wise Report</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/supplierWise">Supplier Wise Report</a>
					</li>
				    <li> 
					<a href="${pageContext.request.contextPath}/dateWise">Date Wise Report</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/monthWise">Month Wise Report</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/itemWise">Item Wise Report</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/grnReportItemWise">GRN Report</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/replaceItemList">Replace Item List</a>
					</li>
					</ul>
					
					<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>Sale Report</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">
				
					
					<li> 
					<a href="${pageContext.request.contextPath}/saleReportByDate">Sale Report Datewise</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/saleReportGroupByDate">Sale Report(Group By Date)</a>
					</li>
				    <li> 
					<a href="${pageContext.request.contextPath}/saleByItemAndHsncodeWise">Sale Report(Itemwise And Hsncodewise)</a>
					</li>
					<li> 
					<a href="${pageContext.request.contextPath}/saleByMonthWise">Sale Report(Monthwise)</a>
					</li>
					
					
					</ul>  --%>

				<c:choose>
					<c:when test="${Constants.mainAct==5}">
						<li class="active">
					</c:when>

					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>User TasK Detail</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">

					<c:choose>
						<c:when test="${Constants.subAct==51}">
							<li class="active">
						</c:when>
						<c:otherwise>
							<li>
						</c:otherwise>
					</c:choose>
					<a href="${pageContext.request.contextPath}/showAssignedTask">Assign
						Task</a>
					</li>
					<c:choose>
						<c:when test="${Constants.subAct==52}">
							<li class="active">
						</c:when>
						<c:otherwise>
							<li>
						</c:otherwise>
					</c:choose>
					<a href="${pageContext.request.contextPath}/showInprogessPage">Inprogress
						Task</a>
					</li>

					<c:choose>
						<c:when test="${Constants.subAct==53}">
							<li class="active">
						</c:when>
						<c:otherwise>
							<li>
						</c:otherwise>
					</c:choose>
					<a href="${pageContext.request.contextPath}/showForwardPage">Forwork
						Task To Another</a>
					</li>



				</ul>

				<!-- END Submenu -->
				</li>


				<c:choose>
					<c:when test="${Constants.mainAct==4}">
						<li class="active">
					</c:when>

					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<a href="#" class="dropdown-toggle"> <i class="fa fa-list"></i>
					<span>Logout</span> <b class="arrow fa fa-angle-right"></b>
				</a>
				<!-- BEGIN Submenu -->
				<ul class="submenu">

					<c:choose>
						<c:when test="${Constants.subAct==41}">
							<li class="active">
						</c:when>
						<c:otherwise>
							<li>
						</c:otherwise>
					</c:choose>
					<a href="${pageContext.request.contextPath}/myProfile">My
						Profile</a>
					</li>
					<li><a href="${pageContext.request.contextPath}/logout">Logout</a>
					</li>



				</ul>

				<!-- END Submenu -->
				</li>



			</ul>
			<!-- END Navlist -->

			<!-- BEGIN Sidebar Collapse Button -->
			<div id="sidebar-collapse" class="visible-lg">
				<i class="fa fa-angle-double-left"></i>
			</div>
			<!-- END Sidebar Collapse Button -->
		</div>
		<!-- END Sidebar -->


	</div>
	<!-- END Container -->

	<!--basic scripts-->

	<%-- <script
		src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
	</script>
	<script src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/jquery-cookie/jquery.cookie.js"></script>

	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.crosshair.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/flot/jquery.flot.tooltip.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/sparkline/jquery.sparkline.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/flaty.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/flaty-demo-codes.js"></script>
 --%>
</body>
</html>
