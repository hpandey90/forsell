<jsp:include page="header_home.jsp"/>
<%@ page import="java.io.*,java.util.*" %>

<link rel="stylesheet" href="css/auto-complete.css">
<form action="search.jsp" method="get">
<!-- <input id="hero-demo" autofocus type="text" name="q" placeholder="Programming languages ..." style="width:60%;max-width:600px;outline:0"> -->
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
<!-- <input type="submit" value="GO"> -->
<jsp:include page="side_nav.jsp"/>
</form>
