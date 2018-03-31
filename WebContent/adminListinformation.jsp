<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - list</title>
<!-- Core CSS - Include with every page -->
<link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/main-style.css" rel="stylesheet" />
<link rel="icon" href="favicon.ico">
<!-- Page-Level CSS -->
<link href="assets/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />

</head>

<body>
	<!--  wrapper -->
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar"> <!-- navbar-header -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html"> <img
				src="assets/img/logo.png" alt="" />
			</a>
		</div>
		<!-- end navbar-header --> <!-- navbar-top-links -->
		<ul class="nav navbar-top-links navbar-right">
			<!-- main dropdown -->			
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
			</a> <!-- dropdown user-->
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i>User
							Profile</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a></li>
					<li class="divider"></li>
					<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>Logout</a>
					</li>
				</ul> <!-- end dropdown-user --></li>
			<!-- end main dropdown -->
		</ul>
		<!-- end navbar-top-links --> </nav>
		<!-- end navbar top -->

		<!-- navbar side -->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<!-- sidebar-collapse -->
			<div class="sidebar-collapse">
				<!-- side-menu -->
				<ul class="nav" id="side-menu">
					<li>
						<!-- user image section-->
						<div class="user-section">
							<div class="user-section-inner">
								<img src="assets/img/user.jpg" alt="">
							</div>
							<div class="user-info">
								<div>
									Admin <strong></strong>
								</div>
								<div class="user-text-online">
									<span class="user-circle-online btn btn-success btn-circle "></span>&nbsp;Online
								</div>
							</div>
						</div> <!--end user image section-->
					</li>
					<li class="sidebar-search">
						<!-- search section-->
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div> <!--end search section-->
					</li>
					<li><a href="timeline.jsp"><i class="fa fa-flask fa-fw"></i>Timeline</a></li>
					<li><a href="forms.jsp"><i class="fa fa-edit fa-fw"></i>Forms</a></li>
					<li class="selected"><a href="adminListinformation.jsp"><i class="fa fa-files-o fa-fw"></i> List News</a>
					 <!-- second-level-items --></li>
				</ul>
				<!-- end side-menu -->
			</div>
			<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->
		<!--  page-wrapper -->
		<div id="page-wrapper">


			<div class="row">
				<!--  page header -->
				<div class="col-lg-12">
					<h1 class="page-header">Tables</h1>
				</div>
				<!-- end  page header -->
			</div>
			<div class="row">
				<div class="col-lg-12">
					<!-- Advanced Tables -->
					<div class="panel panel-default">
						<div class="panel-heading">Advanced Tables</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th>Engine version</th>
											<th>CSS grade</th>
										</tr>
									</thead>
									<tbody>									
										<tr class="even gradeC">
											<td>Trident</td>
											<td>Internet Explorer 5.0</td>
											<td>Win 95+</td>
											<td class="center">5</td>
											<td class="center">C</td>
										</tr>									
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>		
		</div>
		<!-- end page-wrapper -->

	</div>
	<!-- end wrapper -->

	<!-- Core Scripts - Include with every page -->
	<script src="assets/plugins/jquery-1.10.2.js"></script>
	<script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="assets/plugins/pace/pace.js"></script>
	<script src="assets/scripts/siminta.js"></script>
	<!-- Page-Level Plugin Scripts-->
	<script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>

</body>

</html>