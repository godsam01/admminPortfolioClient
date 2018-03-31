<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - admin</title>
<!-- Core CSS - Include with every page -->
<link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href="assets/plugins/pace/pace-theme-big-counter.css"
	rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/main-style.css" rel="stylesheet" />
<link rel="icon" href="favicon.ico">
<!--===============================================================================================-->

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="322812928410-ru9dr6in3oa9gcqbu6tefptb61fd1pt9.apps.googleusercontent.com">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<!--===============================================================================================-->
<script>
	function onFailure(error) {
		console.log(error);
	}
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope' : 'profile email',
			'width' : 240,
			'height' : 50,
			'longtitle' : true,
			'theme' : 'dark',
			'onsuccess' : onSuccess,
			'onfailure' : onFailure
		});
	}
	function onSignIn(googleUser) {
		// Useful data for your client-side scripts:
		var profile = googleUser.getBasicProfile();
		console.log("ID: " + profile.getId()); // Don't send this directly to your
		// server!
		console.log('Full Name: ' + profile.getName());
		console.log('Given Name: ' + profile.getGivenName());
		console.log('Family Name: ' + profile.getFamilyName());
		console.log("Image URL: " + profile.getImageUrl());
		console.log("Email: " + profile.getEmail());

		// The ID token you need to pass to your backend:
		var id_token = googleUser.getAuthResponse().id_token;
		console.log("ID Token: " + id_token);
		$
				.ajax({
					url : "checkUser.do",
					data : {
						idtoken : id_token
					},
					success : function(result) {
						console.log('result', result);
						if (result === 'login') {
							window.location = "http://localhost:8080/Adminportfolio/timeline.jsp";
						}
						
					},
					error : function(xhr, status, error) {
						console.log('worng')
						console.log(error);
					}
				});

	};
</script>
<!--===============================================================================================-->
</head>

<body class="body-Login-back">

	<div class="container">

		<div class="row">
			<div class="col-md-4 col-md-offset-4 text-center logo-margin ">
				<img src="assets/img/logo.png" alt="" />
			</div>
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="g-signin2" data-width="270" data-height="50"
									data-onsuccess="onSignIn" data-longtitle="true"></div>

								<div class="text-center p-t-136">
									<a class="txt2" href="https://accounts.google.com/SignUp?hl=th">
										Create your Account <i class="fa fa-long-arrow-right m-l-5"
										aria-hidden="true"></i>
									</a>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Core Scripts - Include with every page -->
	<script src="assets/plugins/jquery-1.10.2.js"></script>
	<script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="assets/plugins/metisMenu/jquery.metisMenu.js"></script>

</body>

</html>
