<!DOCTYPE html>
<!-- Template by html.am -->
<html>
	<head>
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
			width:75%;
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
		    float: right;
		    font-size:larger;
       		margin-left:2%;
    		margin-right:2%;
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
		<header id="header">
			<div class="headDiv">
				<div class="commonDiv" id="logo" style="width:auto; padding-top:0%; display:table-cell;">
				<div class='innerTag' style='height:inherit'><a href="index.jsp"><img src="images/Logo_mod4.png" alt="Smiley face" width="80px"></a></div>
				</div>
				<div class="searchDiv">
					<form action='listings.jsp' class='innerTag'>
						<input id="hero-demo" autofocus type="search" name="q" placeholder="Programming languages ..." style="width:65%; outline:0; border-radius: 4px;border: none; height: 25px;">
			  			<input type="submit" style>
					</form>
				</div>
				<div class="advertDiv">
					<div  id="placeAD" class='innerTag' ><a href = "postAd.jsp" style='background: orange;'>Place an AD</a></div>		
				</div>
				<div>
					<div>
						<script type="text/javascript" src="scripts/jquery.leanModal.min.js"></script>
						<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />
						<link type="text/css" rel="stylesheet" href="css/login_style.css" />
						<div class="container">
							<a id="modal_trigger" href="#modal" class="btn">Click here to Login or register</a>
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
												<span class="icon"><i class="fa fa-facebook"></i></span>
												<span class="icon_title">Connect with Facebook</span>
											</a>
											<a href="#" class="social_box google">
												<span class="icon"><i class="fa fa-google-plus"></i></span>
												<span class="icon_title">Connect with Google</span>
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
										<form>
											<label>Email / Username</label>
											<input type="text" />
											<br />
						
											<label>Password</label>
											<input type="password" />
											<br />
						
											<div class="checkbox">
												<input id="remember" type="checkbox" />
												<label for="remember">Remember me on this computer</label>
											</div>
						
											<div class="action_btns">
												<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
												<div class="one_half last"><a href="#" class="btn btn_red">Login</a></div>
											</div>
										</form>
						
										<a href="#" class="forgot_password">Forgot password?</a>
									</div>
						
									<!-- Register Form -->
									<div class="user_register">
										<form>
											<label>Full Name</label>
											<input type="text" />
											<br />
						
											<label>Email Address</label>
											<input type="email" />
											<br />
						
											<label>Password</label>
											<input type="password" />
											<br />
						
											<div class="checkbox">
												<input id="send_updates" type="checkbox" />
												<label for="send_updates">Send me occasional email updates</label>
											</div>
						
											<div class="action_btns">
												<div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
												<div class="one_half last"><a href="#" class="btn btn_red">Register</a></div>
											</div>
										</form>
									</div>
								</section>
							</div>
						</div>
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