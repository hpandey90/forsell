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
			height: 80px; 
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
			display: inline-block;
    		width: auto;
		}
		.searchDiv{
			width:65%;
			height: inherit;
			float: left;
			display: inline-block;
			padding-top:0%;
			text-align:center;
			
		}
		.advertDiv{
		    width: auto;
		    height: inherit;
		    display: inline-block;
		    background: orange;
		    float: left;
		    font-size:larger;
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
				<div class="commonDiv" id="logo" style="width:auto; padding-top:0%;">
				<a href="index.jsp"><img src="images/Logo_mod.jpg" alt="Smiley face" width="80px"></a>
				</div>
				<div class="searchDiv">
					<input id="hero-demo" autofocus type="search" name="q" placeholder="Programming languages ..." style="width:65%; outline:0">
		  			<input type="submit">
				</div>
				<div class="advertDiv">
					<div  id="placeAD" style="width:100%; display:inline-block;"><a href = "postAd.jsp">Place an AD</a></div>
				</div>
			</div>
		</header>	