package se.uu.library

import grails.converters.JSON
//import grails.converters.deep.JSON

class ApiController {

    static allowedMethods = [users: "GET", books: "GET", reviews: "GET"]

    def users = {
	if ( params.id ) {
	    render User.get(params.id) as JSON
	}
	else {
	    render User.list() as JSON
	}
    }
    
    def books = {
	if ( params.id ) {
	    render Book.get(params.id) as JSON
	}
	else {
	    render Book.list() as JSON
	}
    }

    def reviews = {
	if ( params.id ) {
	    render Review.get(params.id) as JSON
	}
	else {
	    render Review.list() as JSON
	}
    }
}