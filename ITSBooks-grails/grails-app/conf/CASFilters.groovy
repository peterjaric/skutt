
import se.uu.library.User

class CASFilters {

    def filters = {
	loginCheck(controllerExclude:'api') {
	    before = {
		if(session?.getAttribute("loggedIn") == null) {
		    def username = session?.getAttribute("edu.yale.its.tp.cas.client.filter.user") 
		    if( username != null) {
			if(!User.findByUserId(username)) {
		        	User u = new User()
				u.setUserId(username)
				u.save(flush: true);
			}
			User user = User.findByUserId(username)
			session.setAttribute("loggedIn",true)
			session.setAttribute("loggedInUser",username)
			session.setAttribute("user",user)
			log.info("Login: " + username);
		    }
		    else {
			redirect(controller: "book")
			return false
		    }
		}
	    }
	}
    }
    
}

