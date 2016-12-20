<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*,java.util.*" %>

<link rel="stylesheet" href="css/auto-complete.css">
<form action="search.jsp" method="get">
<!-- <input id="hero-demo" autofocus type="text" name="q" placeholder="Programming languages ..." style="width:60%;max-width:600px;outline:0"> -->
</form>
<script src="scripts/auto-complete.js"></script>
 <script>
        var demo1 = new autoComplete({
            selector: '#hero-demo',
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
<style>
.card {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    transition: 0.3s;
}

/* On mouse-over, add a deeper shadow */
.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

/* Add some padding inside the card container */
.card_container {
    padding: 2px 16px;
}
</style>
<!-- <input type="submit" value="GO"> -->
<div>
	<div style="float:left">
	<jsp:include page="side_nav.jsp"/>
	</div>
	<div style="float:right">
		<div class="card" style="width:25%;float:left;margin-left:15px;">
		  <img src="images/patas.png" alt="Avatar" style="width:100%">
		  <div class="card_container">
		    <h4><b>John Doe</b></h4> 
		    <p>Architect & Engineer</p> 
		  </div>
		</div>
		<div class="card" style="width:25%;float:left;margin-left:15px;" >
		  <img src="images/patas.png" alt="Avatar" style="width:100%">
		  <div class="card_container">
		    <h4><b>John Doe</b></h4> 
		    <p>Architect & Engineer</p> 
		  </div>
		</div>
		<div class="card" style="width:25%;float:left;margin-left:15px;">
		  <img src="images/duoc-langur.png" alt="Avatar" style="width:100%">
		  <div class="card_container">
		    <h4><b>John Doe</b></h4> 
		    <p>Architect & Engineer</p> 
		  </div>
		</div>
		<div class="card" style="width:25%;float:left;margin-left:15px;">
		  <img src="images/snub-nosed.png" alt="Avatar" style="width:100%">
		  <div class="card_container">
		    <h4><b>John Doe</b></h4> 
		    <p>Architect & Engineer</p> 
		  </div>
		</div>
	</div>
</div>

