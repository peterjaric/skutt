
<%@ page import="se.uu.library.Review" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'review.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="text" title="${message(code: 'review.text.label', default: 'Text')}" />
                        
                            <g:sortableColumn property="score" title="${message(code: 'review.score.label', default: 'Score')}" />
			                     
                            <g:sortableColumn property="book" title="${message(code: 'review.book.label', default: 'Book')}" />
                        
                            <g:sortableColumn property="user" title="${message(code: 'review.user.label', default: 'User')}" />
			    
			    <g:sortableColumn property="lastUpdated" title="${message(code: 'review.score.lastUpdated', default: 'lastUpdated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reviewInstanceList}" status="i" var="reviewInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reviewInstance.id}">${fieldValue(bean: reviewInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "text")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "score")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "book.title")}</td>
                        
                            <td>${fieldValue(bean: reviewInstance, field: "user.userId")}</td>
			    
			    <td><g:formatDate format="yyyy-MM-dd" date="${reviewInstance.lastUpdated}"/></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reviewInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
