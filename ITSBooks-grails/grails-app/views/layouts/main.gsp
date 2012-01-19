<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
	<gui:resources components="richEditor, dialog"/>
    </head>
    <body class="yui-skin-sam">
      <div class="maindiv">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
	<div class="intro" style="background: url('${resource(dir:"images",file:"sigill.jpeg")}');">
	  <g:if test="${session?.getAttribute("loggedInUser")}">
	  <ul class="topmenu">
	    <li class="topmenu"><g:link controller="book">Home</g:link>
	    <li class="topmenu"><g:link controller="review">Reviews</g:link>
	    <li class="topmenu"><g:link controller="book">Books</g:link>
	    <li class="topmenu"><g:link controller="user">Users</g:link>
	    <li class="topmenu"><g:link controller="logout">Logout</g:link> 
	  </ul>
	    <span class="loggedInUserName">logged in as ${session?.getAttribute("loggedInUser")}</span>
	  </g:if>
	  </div>
    <g:layoutBody />
      </div>
    </body>
</html>