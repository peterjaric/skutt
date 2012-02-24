<%@ page import="se.uu.library.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'favourites.css')}" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script src="${resource(dir:'js',file:'lscache.js')}" ></script>
        <script type="text/javascript">
            $( document ).ready(function() {
                var selectedFavs = lscache.get( 'favourites' );
                if ( selectedFavs ) {
                    $.each( selectedFavs, function( index, value ) {
                        /*Star all previously selected favs*/
                        $('.fav-selector-' + value + ' > span' )
                            .addClass( 'selectedStar' )
                            .removeClass( 'unselectedStar' );
                    });
                }

                $('.favourite').bind('click.favourite', function() {
                    var $this = $(this);
                    var previousValue = lscache.get('favourites');
                    if (!previousValue) {
                        previousValue = [];
                    }
                    var favId = $this.data('id');

                    if ( $.inArray(favId, previousValue) != -1 ) {
                        var index = previousValue.indexOf(favId);
                        previousValue.splice(index, 1);
                    } else {
                        previousValue.push(favId);
                    }
                    lscache.set('favourites', previousValue, 10);
                    var span = $this.find('span');
                    span.toggleClass('unselectedStar');
                    span.toggleClass('selectedStar');
                });


            });
        </script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <td>Fav</td>
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
                            <td class="favourite fav-selector-${bookInstance.id}" data-id="${bookInstance.id}"><span class="favourite-icon unselectedStar"></span></td>
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
        </div>
    </body>
</html>
