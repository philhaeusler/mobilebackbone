<cfparam name="thisTag.executionMode" default="start">
<cfparam name="attributes.title" default="Backbone">
<cfparam name="attributes.active" default="demo">
<cfparam name="attributes.header" default="true">

<cfif CGI.SERVER_NAME EQ "thingsico.de">
	<cfset base = "/demos/backbone/">
<cfelse>
	<!--- load the libs in a relative fashion --->
	<cfset base = repeatString("../",listlen(cgi.SCRIPT_NAME,"/")-2)>
</cfif>

<cfif thisTag.executionMode EQ "start">

<!DOCTYPE HTML>
<html>
<head>
<cfoutput>
<title>#attributes.title#</title>
<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<link href="#base#libs/google-code-prettify/prettify.css" type="text/css" rel="stylesheet" />
<link href="#base#libs/bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
  body {
    padding-top: 60px;
    padding-bottom: 40px;
  }
</style>
<link href="#base#libs/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="#base#libs/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="#base#libs/underscore.js" type="text/javascript"></script>
<script src="#base#libs/backbone.js" type="text/javascript"></script>
<script type="text/javascript" src="#base#libs/google-code-prettify/prettify.js"></script>
<script src="#base#libs/bootstrap/js/bootstrap.min.js"></script>
<base href="#base#">
</cfoutput>
</head>

<body onLoad="prettyPrint()"  data-spy="scroll" data-target=".subnav" data-offset="50">
	<cfif attributes.header>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Backbone</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li<cfif attributes.active EQ "demo"> class="active"</cfif>><a href="">Demo</a></li>
                            <li class="divider-vertical"></li>

              <li<cfif attributes.active EQ "events"> class="active"</cfif>><a href="events/">Events</a></li>
              <li<cfif attributes.active EQ "models"> class="active"</cfif>><a href="models/">Models</a></li>
              <li<cfif attributes.active EQ "collections"> class="active"</cfif>><a href="collections/">Collections</a></li>
              <li<cfif attributes.active EQ "views"> class="active"</cfif>><a href="views/">Views</a></li>
              <li<cfif attributes.active EQ "mobile"> class="active"</cfif>><a href="mobile/">Mobile</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    </cfif>
    
    <div class="container">

<cfelse>

	<script type="text/javascript">
	$(document).ready(function(e) {
    	$('#subnav').scrollspy()    
    }); 
	</script>
    
	</div>
    
</body>
</html>

</cfif>