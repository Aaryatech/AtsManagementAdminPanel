<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/assets/font-awesome/css/font-awesome.min.css">

<!--page specific css styles-->

<!--flaty css styles-->
<link rel="stylesheet" href="resources/css/flaty.css">
<link rel="stylesheet" href="resources/css/flaty-responsive.css">

<link rel="shortcut icon" href="resources/img/favicon.png">

</head>
<body>

	<!-- BEGIN Main Content -->
	<div>
		<!-- BEGIN Login Form -->

		<h3>Home Page</h3>


		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showAssignedTask" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${assignedCount}</p>
							<p class="title">Assigned</p>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showInprogessPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${inprogressCount}</p>
							<p class="title">In Progress</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showForwardPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big"></p>
							<p class="title">Forward</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-md-6">
			<div class="row">
				<a href="${pageContext.request.contextPath}/showCompletedPage" />
				<div class="col-md-6">
					<div class="tile tile-orange">
						<div class="img">
							<i class="fa fa-comments"></i>
						</div>
						<div class="content">
							<p class="big">${completedCount}</p>
							<p class="title">Completed</p>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!--basic scripts-->
		<script
			src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script>
			window.jQuery
					|| document
							.write('<script src="resources/assets/jquery/jquery-2.0.3.min.js"><\/script>')
		</script>
		<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			function goToForm(form) {
				$('.login-wrapper > form:visible').fadeOut(500, function() {
					$('#form-' + form).fadeIn(500);
				});
			}
			$(function() {
				$('.goto-login').click(function() {
					goToForm('login');
				});
				$('.goto-forgot').click(function() {
					goToForm('forgot');
				});
				$('.goto-register').click(function() {
					goToForm('register');
				});
			});
		</script>
</body>
</html>