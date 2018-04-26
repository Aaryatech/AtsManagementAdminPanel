<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<body>
	
	 
<c:url var="getFormListByProjectId" value="/getFormListByProjectId"></c:url> 


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
					<i class="fa fa-file-o"></i>Assign Task
				</h1>
				
				<!-- <h4>Bill for franchises</h4> -->
			</div>
		</div>
		<!-- END Page Title -->

		
		<!-- BEGIN Main Content -->
		<div class="box" id="pending">
			<div class="box-title">
				<h3>
					<i class="fa fa-bars"></i>Form Name
				</h3>
				<div class="box-tool">
				<a href="${pageContext.request.contextPath}/addEmployee">Add Employee</a> <a data-action="collapse" href="#"><i
									class="fa fa-chevron-up"></i></a>
				</div>

			</div> 
			
			
				<div class=" box-content">
				
				<div class="box-content">
							
								<div class="col-md-2">Select Project*</div>
									<div class="col-md-3">
									 <select id="projectId" name="projectId" onchange="getFormListByProjectId();"  class="form-control chosen" required>
									 <option value=""></option>
										<c:forEach items="${projList}" var="projList" varStatus="count">
													 <option value="${projList.projectId}">${projList.projectName}</option>
												</c:forEach>
									 </select>
									</div>
									
								 
								
				 
							</div><br>
				 
					 <div class="box-content">

									<br /> <br />
									<div class="clearfix"></div>
									<div class="table-responsive" style="border: 0">
										<table class="table table-advance" id="table1">
											<thead>
												<tr>
													<th style="width: 18px">Sr No</th>
													<th>Module Name</th>
													<th>Form Name</th>
													<th>Type</th> 
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
	 
	</div>
	<!-- END Main Content -->

	<footer>
	<p>2018 © SONA ELECTRICALS.</p>
	</footer>

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
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/data-tables/bootstrap3/dataTables.bootstrap.js"></script>
		
		<script type="text/javascript">
		
		function getFormListByProjectId()
		{
			var projectId = $("#projectId").val(); 
			
		 

			$ .getJSON( '${getFormListByProjectId}',

							{
								 
								 
								projectId : projectId, 
								ajax : 'true'

							},
							function(data) { 
								
								$('#table1 td').remove();
								if (data == "") {
									alert("No records found !!");

								}
								var grandTotal=0;
								$.each(
										data,
										function(key, itemList) {
											
											 
											var tr = $('<tr></tr>');
												tr.append($('<td></td>').html(key+1));
												tr.append($('<td></td>').html(itemList.moduleName));
											  	tr.append($('<td></td>').html(itemList.formName));
											  	tr.append($('<td></td>').html(itemList.formTypeName)) 
											  	tr.append($('<td></td>').html(' <a href="${pageContext.request.contextPath}/showAddNewForm/'+itemList.projectId+'" class="btn bnt-primary"> <i class="fa fa-list"></i></a> ')); 
												$('#table1 tbody').append(tr);
											 

										})
										 
										 
							});
		}
		
		</script>
		
</body>
</html>