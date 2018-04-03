<!DOCTYPE html>
<htmll ang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<!-- Core CSS - Include with every page -->
<link rel="icon" href="favicon.ico">
<link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/main-style.css" rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.6/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.6/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />
<link rel="icon" href="favicon.ico">
<meta name="google-signin-client_id"
	content="322812928410-ru9dr6in3oa9gcqbu6tefptb61fd1pt9.apps.googleusercontent.com">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async
	defer></script>
<script>
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}

	function onLoad() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}
</script>
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async
	defer></script>
</head>
<body>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
	<!-- Include Editor JS files. -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.7.6/js/froala_editor.pkgd.min.js"></script>
	<!--  wrapper -->
	<script>
		function onClickSave() {
			var htmlValue = $('textarea#froala-editor').val();
			console.log('Save ', htmlValue);
			$
					.ajax({
						url : "saveInformation.do",
						data : {
							htmlValue : htmlValue
						},
						success : function(result) {
							console.log('result', result);
							if (result === 'success') {
								window.location = "http://localhost:8080/Adminportfolio/adminListinformation.do";
							}
						},
						error : function(xhr, status, error) {
							console.log('worng')
							console.log(error);
						}
					});
		}
	</script>
	<div id="wrapper">
		<!-- navbar top -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			id="navbar">
			<!-- navbar-header -->
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
			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-3x"></i>
				</a> <!-- dropdown user-->
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i>Settings</a></li>
						<li class="divider"></li>
						<li><a href="login.jsp" onclick="signOut();"><i
								class="fa fa-sign-out fa-fw"></i>Sign off</a></li>
					</ul> <!-- end dropdown-user --></li>
				<!-- end main dropdown -->
			</ul>
			<!-- end navbar-top-links -->

		</nav>
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
					<li class="selected"><a href="forms.jsp"><i
							class="fa fa-edit fa-fw"></i>Forms</a></li>
					<li><a href="adminListinformation.do"><i
							class="fa fa-files-o fa-fw"></i> List News</a> <!-- second-level-items --></li>
				</ul>
				<!-- end side-menu -->
			</div>
			<!-- end sidebar-collapse -->
		</nav>
		<!-- end navbar side -->

		<!--  page-wrapper -->
		<div id="page-wrapper">
			<div class="row">
				<!-- page header -->
				<div class="col-lg-12">
					<h1 class="page-header">Forms</h1>
				</div>
				<!--end page header -->
			</div>
			<!-- Addinformation -->

			<form>			
				<textarea id="froala-editor">
		
				</textarea>
				<input type="button" value="Next" onclick="onClickSave()">
			</form>
			<br />
			<script>
				$('textarea#froala-editor').froalaEditor().on(
						'froalaEditor.contentChanged', function(e, editor) {
							$('#preview').html(editor.html.get());
						})
			</script>
			<script>
				$('textarea#froala-editor').froalaEditor(
						{
							toolbarInline : true,
							charCounterCount : false,
							toolbarButtons : [ 'bold', 'italic', 'underline',
									'strikeThrough', 'subscript',
									'superscript', '-', 'paragraphFormat',
									'align', 'formatOL', 'formatUL', 'indent',
									'outdent', '-', 'insertImage',
									'insertLink', 'insertFile', 'insertVideo',
									'undo', 'redo' ],
							toolbarVisibleWithoutSelection : true
						})
			</script>
			<!-- Addinformation -->

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

</body>

</html>