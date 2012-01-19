
<%@ page import="se.uu.library.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
	</div>
        <div class="body">
            <h1>Logout</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
    </body>
</html>
