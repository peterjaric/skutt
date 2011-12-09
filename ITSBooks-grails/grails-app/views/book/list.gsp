
<%@ page import="se.uu.library.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'book.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="isbn" title="${message(code: 'book.isbn.label', default: 'Isbn')}" />
			    
			    <g:sortableColumn property="lastUpdated" title="${message(code: 'book.lastUpdated.label', default: 'lastUpdated')}" />
			    
			    <g:sortableColumn property="updatedBy" title="${message(code: 'book.user.label', default: 'updatedBy')}" />
			    
			    <g:sortableColumn property="checkedOutBy" title="${message(code: 'book.checkedOutBy.label', default: 'checkedOutBy')}" />
			    
			    <g:sortableColumn property="checkoutDate" title="${message(code: 'book.checkoutDate.label', default: 'checkoutDate')}" />
			    
		
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "isbn")}</td>
			    
			    <td><g:formatDate format="yyyy-MM-dd" date="${bookInstance.lastUpdated}"/></td>
			    
			    <td><g:link controller="user" action="show" id="${bookInstance.updatedBy?.id}">${fieldValue(bean: bookInstance, field: "updatedBy.userId")}</g:link></td>
			    
			    <td><g:link controller="user" action="show" id="${bookInstance.checkedOutBy?.id}">${fieldValue(bean: bookInstance, field: "checkedOutBy.userId")}</g:link></td>
                        
			    <td><g:formatDate format="yyyy-MM-dd" date="${bookInstance.checkoutDate}"/></td>
		    
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
