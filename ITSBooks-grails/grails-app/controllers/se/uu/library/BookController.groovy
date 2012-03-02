package se.uu.library

import grails.plugins.springsecurity.Secured


class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookInstanceList: Book.list(params), bookInstanceTotal: Book.count()]
    }

    def favouritesList = {
        def bookList = Book.list();
        [bookInstanceList: bookList]
    }
    
    @Secured(['ROLE_USER'])
    def create = {
        def bookInstance = new Book()
        bookInstance.properties = params
        return [bookInstance: bookInstance]
    }
    
    @Secured(['ROLE_USER'])
    def checkout = {
	def bookInstance = Book.get(params.id)
	if(bookInstance.checkedOutBy) {
	    flash.message = "${message(code: 'default.optimistic.locking.failure', args: [message(code: 'book.label', default: 'Book'), params.id])}"
        }
	else {
	    bookInstance.setCheckedOutBy(User.findByUserId(request.getRemoteUser()))
	    bookInstance.setCheckoutDate(new Date());
	    bookInstance.save(flush:true)
	    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
	}
	render(view: "show", model: [bookInstance: bookInstance])
    }
    
    @Secured(['ROLE_USER'])
    def returnBook = {
	def bookInstance = Book.get(params.id)
	def user = session.getAttribute("user")
	//log.info(user + " returning book " + bookInstance)
	if(bookInstance.checkedOutBy != null && bookInstance.checkedOutBy.id == session.getAttribute("user").id ) {
	    bookInstance.setCheckedOutBy(null)
	    bookInstance.setCheckoutDate(null)
	    flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
	    redirect(action: "show", id: bookInstance.id)
	}
	else {
	    bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'book.label', default: 'Book')] as Object[], "Another user has updated this Book while you were editing")               
	    render(view: "show", model: [bookInstance: bookInstance])
	}
    }

    @Secured(['ROLE_USER'])
    def save = {
        def bookInstance = new Book(params)
	bookInstance.setUpdatedBy(session.getAttribute("user"))
        if (bookInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
            redirect(action: "show", id: bookInstance.id)
        }
        else {
            render(view: "create", model: [bookInstance: bookInstance])
        }
    }

    def show = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookInstance: bookInstance]
        }
    }

    @Secured(['ROLE_USER'])
    def edit = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookInstance: bookInstance]
        }
    }

    @Secured(['ROLE_USER'])
    def update = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookInstance.version > version) {
                    
                    bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'book.label', default: 'Book')] as Object[], "Another user has updated this Book while you were editing")
                    render(view: "edit", model: [bookInstance: bookInstance])
                    return
                }
            }
            bookInstance.properties = params
	    bookInstance.setUpdatedBy(request.getRemoteUser())
            if (!bookInstance.hasErrors() && bookInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])}"
                redirect(action: "show", id: bookInstance.id)
            }
            else {
                render(view: "edit", model: [bookInstance: bookInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }

    @Secured(['ROLE_USER'])
    def delete = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            try {
                bookInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])}"
            redirect(action: "list")
        }
    }
}
