<%
if (org.codehaus.groovy.grails.commons.ConfigurationHolder.config.cas.mocking) {
%>
<html>
	<head>
	<title>CAS Client Plugin Page</title>
	</head>
	<body>
	<h1>
    <%  
		def u = request.getParameter('u')
		if (u) {
			session?.setAttribute(edu.yale.its.tp.cas.client.filter.CASFilter.CAS_FILTER_USER, u)
     		out.println("Current cas-ified user is [${u}].")
     	}
     	else {
     		out.println("Please supply a parameter 'u'!")
     	}
    %>
    </h1>
    <h2><a href="./">Continue to homepage</a></h2>
	</body>
</html>
<%
}
else {
	response.sendError(javax.servlet.http.HttpServletResponse.SC_NOT_FOUND)
}
%>