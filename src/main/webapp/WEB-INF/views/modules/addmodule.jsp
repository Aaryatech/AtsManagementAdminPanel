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
							<i class="fa fa-file-o"></i>Add Module
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
									<i class="fa fa-bars"></i>Module Details
								</h3>
								<div class="box-tool">
									<!-- <a href="">Back to List</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a> -->
								</div>

							</div>

							<div>
								<div class="box-content">
									<form action="${pageContext.request.contextPath}/postModule" method="post" class="form-horizontal"
										id="validation-form" method="post">

										<div class="box-content">
											<div class="col-md-2" >
												Project Name</div>
											<div class="col-md-3">
												<select name="proj_name" id="proj_name" class="form-control chosen"
													placeholder="Project" data-rule-required="true">
													<option value="">Select Project</option>
													<c:forEach items="${projList}" var="projList" >
													<c:choose>
														<c:when test="${projList.projectId==editModule.projectId}">
															<option value="${projList.projectId}" selected><c:out value="${projList.projectName}"/></option>
														</c:when>
														<c:otherwise>
															<option value="${projList.projectId}" disabled><c:out value="${projList.projectName}"/></option>
														</c:otherwise>
													</c:choose>
												
											</c:forEach>
												</select>
											</div>
											
											<input type="hidden" name="moduleId" id="moduleId" value="${editModule.moduleId}"/>
											
											 <div class="col-md-1" ></div>
												<div class="col-md-2" >
													Module Name</div>
												<div class="col-md-3">
													<input type="text" name="mod_name" id="mod_name"
														class="form-control" placeholder="Module Name"
														data-rule-required="true" value="${editModule.moduleName}" required />
												</div>
											 
										</div>
										<br>
										
										<div class="box-content">
											<div class="col-md-2" >
												Select Technology</div>
											<div class="col-md-3">
												<select name="techId" id="techId" class="form-control chosen"
													  data-rule-required="true">
													<option value="">Select Technology</option>
													
													<c:forEach items="${techList}" var="techList" >
													<c:choose>
														<c:when test="${techList.techId==editModule.techId}">
															<option value="${techList.techId}" selected><c:out value="${techList.techName}"/></option>
														</c:when>
														<c:otherwise>
															<option value="${techList.techId}" disabled><c:out value="${techList.techName}"/></option>
														</c:otherwise>
													</c:choose>
												
											</c:forEach>
												</select>
											</div>
											
									<div class="col-md-1" ></div>
											 <div class="col-md-2" >
												Select Phase</div>
											<div class="col-md-3">
												<select name="phaseId" id="phaseId" class="form-control chosen"
													  data-rule-required="true">
													<option value="">Select Phase</option>
													<c:forEach items="${phaseTypeList}" var="phaseTypeList" >
													<c:choose>
														<c:when test="${phaseTypeList.mPhaseId==editModule.phaseId}">
															<option value="${phaseTypeList.mPhaseId}" selected><c:out value="${phaseTypeList.phaseName}"/></option>
														</c:when>
														<c:otherwise>
															<option value="${phaseTypeList.mPhaseId}" disabled><c:out value="${phaseTypeList.phaseName}"/></option>
														</c:otherwise>
													</c:choose>
												
											</c:forEach>
												</select>
											</div>
											 
										</div>
										<br><br>
										
										<div class="box-content">
											<div class="col-md-2">Description</div>
											<div class="col-md-9">
												<input name="module_desc" placeholder="Module Description" class="form-control" id="module_desc"
													value="${editModule.moduleDesc}" required/> 
											</div>
											</div><br> <br>
											
											<input type="hidden" name="flag" id="flag" value="0"/>
											
											<div class="row">
						<div class="col-md-12" style="text-align: center">
						 
					<input type="submit" id="Submit" onclick="validation()" class="btn btn-info" value="Add Module">
					<input type="button" onclick="setSaveAndNext()" class="btn btn-info" value="Save And Next">
						</div>
					</div>
											 
									</form>
								</div>

													                            <div class="box-content">
                               
                                <br/><br/>
                                <div class="clearfix"></div>
<div class="table-responsive" style="border:0">
    <table class="table table-advance" id="table1">
        <thead>
            <tr>
                <th style="width:18px">Sr No</th>
                <th>Project Name</th>
                <th>Module Name</th>
                <th>Technology Name</th>
                <th>Phase Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
             <c:forEach items="${modAndProjList}" var="modProj" varStatus="count">
													<tr class="table-flag-blue">
														<td>${count.index+1}</td>
														<td>${modProj.projectName}</td>
														<td>${modProj.moduleName}</td>
														<td>${modProj.techName}</td>
														<td>${modProj.phaseName}</td>
														<td>
														<a
															href="${pageContext.request.contextPath}/editModule/${modProj.moduleId}"
															class="btn bnt-primary"> <i class="fa fa-edit"></i></a>
														<a
															href="${pageContext.request.contextPath}/deleteModule/${modProj.moduleId}"
															class="btn bnt-primary"> <i class="fa fa-trash-o"></i></a>
														<a
															href="${pageContext.request.contextPath}/showAddNewForm/${modProj.moduleId}"
															class="btn bnt-primary"> <i class="fa fa-list"></i></a> </td>
														
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
<script type="text/javascript">

function setSaveAndNext()
{
	 if(validation()==true){
		document.getElementById("flag").value=1;
		var button = document.getElementById('Submit');
	    button.form.submit();
	 }
	 
}

function validation()
{
	    
	var projectName = document.getElementById("proj_name").value;
	var mod_name = document.getElementById("mod_name").value;
	var techId = document.getElementById("techId").value;
	var phaseId = document.getElementById("phaseId").value;
	var module_desc = document.getElementById("module_desc").value;
	  
	var isValid=true;
	
	if(projectName=="" || projectName==null){
		isValid=false;
		alert("Select Project ");
	}
	else if(mod_name=="" || mod_name==null){
		isValid=false;
		alert("Enter Module Name ");
	}
	else if(techId=="" || techId==null){
		isValid=false;
		alert("Select Technology ");
	}
	else if(phaseId=="" || phaseId==null){
		isValid=false;
		alert("Select Phase ");
	}
	else if(module_desc=="" || module_desc==null){
		isValid=false;
		alert("Enter Description ");
	}
	
	return isValid;
}

</script>
</body>
</html>

