
<%@ page import="se.uu.library.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
	    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="book.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="book.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="book.isbn.label" default="Isbn" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "isbn")}</td>
                            
                        </tr>
                    
			
			    <tr class="prop">
                            <td valign="top" colspan="2" class="value">
                                
                                <g:each in="${bookInstance.reviews}" var="r">
                                    <div class="review">
				      <g:link controller="review" action="show" id="${r.id}">${r?.user.userId}</g:link>
				      <g:formatDate format="yyyy-MM-dd" date="${r?.lastUpdated}"/>
				      <div class="reviewText">
					${r?.text}
				      </div>
				    </div>
                                </g:each>
                               
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bookInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		    <g:if test="${bookInstance.checkedOutBy == null}">
		    <span class="button"><g:actionSubmit class="edit" action="checkout" value="${message(code: 'default.button.checkout.label', default: 'Checkout')}" /></span>
		    </g:if>
		    <g:if test="${bookInstance.checkedOutBy != null && bookInstance.checkedOutBy.id == session.getAttribute("user").id}">
		    <span class="button"><g:actionSubmit class="edit" action="returnBook" value="${message(code: 'default.button.return.label', default: 'Return')}" /></span>
		     </g:if>
		 </g:form>
	      <g:form controller="review">
		<g:hiddenField name="id" value="${bookInstance?.id}" />
		 <span class="button"><g:actionSubmit class="edit" controller="review" action="addOrEditReviewForBook" value="${message(code: 'default.button.review.label', default: 'Add/Edit review')}" /></span>
	      </g:form>     
            </div>
        </div>
    </body>
</html>
