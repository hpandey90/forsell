<!DOCTYPE html>
<!-- Template by html.am -->
<html>
	<head>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="144689030320-m8lu3e9mpelb9rogmakmrbctv0tqvpvm.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>HomePage</title>
		<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			overflow: hidden;
			height: 100%; 
			max-height: 100%; 
			font-family:Sans-serif;
			line-height: 1.5em;
		}
		
		#header {
			top: 0;
			left: 0;
			width: 100%;
			height: 95px; 
			//overflow: hidden; /* Disables scrollbars on the header frame. To enable scrollbars, change "hidden" to "scroll" */
			background: #222233;
		}
		
		#logo {
			padding:10px;
			color:#AACCFF;
		}
		
		
		p {
			color: #555;
		}

		nav ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
		}
		
		nav ul a {
			color: #76323f;
			text-decoration: none;
		}
				
		/*IE6 fix*/
		* html body{
			padding: 100px 0 0 230px; /* Set the first value to the height of the header and last value to the width of the nav */
		}
		
		* html main{ 
			height: 100%; 
			width: 100%; 
		}
		
		.headDiv{
			display: inline-block;
    		width: 100%;
    		height: inherit;
		}
		.commonDiv{
			height: inherit;
			float: left;
			display: table;
    		width: auto;
    		margin-left:2%;
    		margin-right:2%;
		}
		.searchDiv{
			width:65%;
			height: inherit;
			float: left;
			display: table;
			padding-top:0%;
			text-align:center;
			
		}
		.advertDiv{
		    width: auto;
		    height: inherit;
		    display: table;
		    float: left;
		    font-size:larger;
       		margin-left:2%;
    		margin-right:2%;
		}
		
		.loginDiv{
			width: auto;
		    height: inherit;
		    float: right;
		    font-size:larger;
       		margin-left:2%;
    		margin-right:.5%;
		}
		.innerTag{
			width:100%; display:table-cell; vertical-align: middle;
		}
		
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script type="text/javascript">
			/* =============================
			This script generates sample text for the body content. 
			You can remove this script and any reference to it. 
			 ============================= */
			var bodyText=["The smaller your reality, the more convinced you are that you know everything.", "If the facts don't fit the theory, change the facts.", "The past has no power over the present moment.", "This, too, will pass.", "</p><p>You will not be punished for your anger, you will be punished by your anger.", "Peace comes from within. Do not seek it without.", "<h3>Heading</h3><p>The most important moment of your life is now. The most important person in your life is the one you are with now, and the most important activity in your life is the one you are involved with now."]
			function generateText(sentenceCount){
				for (var i=0; i<sentenceCount; i++)
				document.write(bodyText[Math.floor(Math.random()*7)]+" ")
			}
		</script>	
		<script src="scripts/auto-complete.js"></script>
 <script>
        var demo1 = new autoComplete({
            selector: '#goodssearch',
            minChars: 1,
            source: function(term, suggest){
                term = term.toLowerCase();
                var choices = ['ActionScript', 'AppleScript', 'Asp', 'Assembly', 'BASIC', 'Batch', 'C', 'C++', 'CSS', 'Clojure', 'COBOL', 'ColdFusion', 'Erlang', 'Fortran', 'Groovy', 'Haskell', 'HTML', 'Java', 'JavaScript', 'Lisp', 'Perl', 'PHP', 'PowerShell', 'Python', 'Ruby', 'Scala', 'Scheme', 'SQL', 'TeX', 'XML'];
                var suggestions = [];
                for (i=0;i<choices.length;i++)
                    if (~choices[i].toLowerCase().indexOf(term)) suggestions.push(choices[i]);
                suggest(suggestions);
            }
        });
</script>
	<link rel="stylesheet" href="css/auto-complete.css">
	<body style='overflow-y:auto;'>		
	
		<script>
		 function statusChangeCallback(response) {
			    console.log('statusChangeCallback');
			    console.log(response);
			    // The response object is returned with a status field that lets the
			    // app know the current login status of the person.
			    // Full docs on the response object can be found in the documentation
			    // for FB.getLoginStatus().
			    if (response.status === 'connected') {
			      // Logged into your app and Facebook.
			      testAPI();
			    } else if (response.status === 'not_authorized') {
			      // The person is logged into Facebook, but not your app.
			      document.getElementById('status').innerHTML = 'Please log ' +
			        'into this app.';
			    } else {
			      // The person is not logged into Facebook, so we're not sure if
			      // they are logged into this app or not.
			      document.getElementById('status').innerHTML = 'Please log ' +
			        'into Facebook.';
			    }
			  }
		
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "//connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		  
		  
		  function checkLoginState() {
			  FB.getLoginStatus(function(response) {
			    statusChangeCallback(response);
			  });
			}
		  
		  window.fbAsyncInit = function() {
			    FB.init({
			      appId      : '2166861750205899',
			      xfbml      : true,
			      version    : 'v2.6'
			    });
			  };
			  
			  FB.getLoginStatus(function(response) {
			      statusChangeCallback(response);
			  });
			  
			  (function(d, s, id) {
				    var js, fjs = d.getElementsByTagName(s)[0];
				    if (d.getElementById(id)) return;
				    js = d.createElement(s); js.id = id;
				    js.src = "//connect.facebook.net/en_US/sdk.js";
				    fjs.parentNode.insertBefore(js, fjs);
				  }(document, 'script', 'facebook-jssdk'));
			  function testAPI() {
				    console.log('Welcome!  Fetching your information.... ');
				    FB.api('/me', function(response) {
				      console.log('Successful login for: ' + response.name);
				      document.getElementById('status').innerHTML =
				        'Thanks for logging in, ' + response.name + '!';
				    });
				  }
		</script>
		<header id="header">
			<div class="headDiv">
				<div class="commonDiv" id="logo" style="width:auto; padding-top:0%; display:table-cell;">
				<div class='innerTag' style='height:inherit'><a href="index.jsp"><img src="images/Logo_mod4.png" alt="Smiley face" width="115px"></a></div>
				</div>
				<div class="searchDiv">
					<form action='listings.jsp' class='innerTag'>
						<input id="hero-demo" autofocus type="search" name="q" placeholder="What can I find for you...?" style="width:65%; outline:0; border-radius: 4px;border: none; height: 25px;">
			  			<input type="submit" style>
					</form>
				</div>
				<div class="advertDiv">
					<div  id="placeAD" class='innerTag' ><a href = "postAd.jsp" style='background: orange;'>Place an AD</a></div>		
				</div>
				<div class='loginDiv'>
					<div class='innerTag'>
						<script type="text/javascript" src="scripts/jquery.leanModal.min.js"></script>
						<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
						<link type="text/css" rel="stylesheet" href="css/login_style.css" />
						<%
						if(session.getAttribute("user") == null){
								%>

						<div class="container">
							<a id="modal_trigger" href="#modal" class="btn">Login/register</a>
							<div id="modal" class="popupContainer" style="display:none;">
								<header class="popupHeader">
									<span class="header_title">Login</span>
									<span class="modal_close"><i class="fa fa-times"></i></span>
								</header>
								
								<section class="popupBody">
			<!-- Social Login -->
			<div class="social_login">
				<div class="">
					<a href="#" class="social_box fb">
						 <div id="fb-root">
						 <fb:login-button 
						  scope="public_profile,email"
						  onlogin="checkLoginState();"
						  data-auto-logout-link="true"
						  data-max-rows="1" data-size="large">
						  
						<span class="icon_title">Connect with Facebook</span>
						</fb:login-button>
						 </div>
							  <script>(function(d, s, id) {
							    var js, fjs = d.getElementsByTagName(s)[0];
							    if (d.getElementById(id)) return;
							    js = d.createElement(s); js.id = id;
							    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.8&appId=2166861750205899";
							    fjs.parentNode.insertBefore(js, fjs);
							  }(document, 'script', 'facebook-jssdk'));</script>
					</a>

					<a href="#" class="social_box google">
					    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
					    	Connect with Google
					    </div>
					    <script>
					      function onSignIn(googleUser) {
					        // Useful data for your client-side scripts:
					        var profile = googleUser.getBasicProfile();
					        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
					        console.log('Full Name: ' + profile.getName());
					        console.log('Given Name: ' + profile.getGivenName());
					        console.log('Family Name: ' + profile.getFamilyName());
					        console.log("Image URL: " + profile.getImageUrl());
					        console.log("Email: " + profile.getEmail());
					
					        // The ID token you need to pass to your backend:
					        var id_token = googleUser.getAuthResponse().id_token;
					        console.log("ID Token: " + id_token);
					      };
					    </script>
					</a>
				</div>

				<div class="centeredText">
					<span>Or use your Email address</span>
				</div>

				<div class="action_btns">
					<div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
					<div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
				</div>
			</div>

			<!-- Username & Password Login form -->
			<div class="user_login">
				<form action="./Login" method="post">
					<label>Email / Username</label>
					<input type="text" name="user"/>
					<br />

					<label>Password</label>
					<input type="password" name="password"/>
					<br />

					<div class="checkbox">
						<input id="remember" type="checkbox" />
						<label for="remember">Remember me on this computer</label>
					</div>

					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
						<div class="one_half last"><a href="#" class="btn btn_red"><input type="submit" />Login</a></div>
					</div>
				</form>

				<a href="#" class="forgot_password">Forgot password?</a>
			</div>

			<!-- Register Form -->
			<div class="user_register">
				<form action="./Register" method="post">
					<label>Full Name</label>
					<input type="text" id="fullname" name="fullname"/>
					<br />

					<label>Email Address</label>
					<input type="email" id="email" name="email"/>
					<br />

					<label>Password</label>
					<input type="password" id="password" name="password"/>
					<br />

					<div class="checkbox">
						<input id="send_updates" type="checkbox" />
						<label for="send_updates">Send me occasional email updates</label>
					</div>

					<div class="action_btns">
						<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
						<div class="one_half last"><input type="submit"/>Register</div>
					</div>
				</form>
			</div>
		</section>
							</div>
						</div>
						<%	}
						else{
							String user = null;
							if(session.getAttribute("user") == null){
								response.sendRedirect("index.jsp");
							}else user = (String) session.getAttribute("user");
							String userName = null;
							Cookie[] cookies = request.getCookies();
							if(cookies !=null){
							for(Cookie cookie : cookies){
								if(cookie.getName().equals("user")) userName = cookie.getValue();
							}
							}
							%>
							<div style=color:white >Hi <%=user%>,</div>
							<a href="./Logout">
							<div class="container">Not You ?(SignOut)</div>
							</a>
							<%
						}
						%>
						<script type="text/javascript">
							$("#modal_trigger").leanModal({top : 200, overlay : 0.6, closeButton: ".modal_close" });
						
							$(function(){
								// Calling Login Form
								$("#login_form").click(function(){
									$(".social_login").hide();
									$(".user_login").show();
									return false;
								});
						
								// Calling Register Form
								$("#register_form").click(function(){
									$(".social_login").hide();
									$(".user_register").show();
									$(".header_title").text('Register');
									return false;
								});
						
								// Going back to Social Forms
								$(".back_btn").click(function(){
									$(".user_login").hide();
									$(".user_register").hide();
									$(".social_login").show();
									$(".header_title").text('Login');
									return false;
								});
						
							
							})
						</script>
					</div>
				</div>
			</div>
		</header>	