
import se.uu.library.User
import edu.yale.its.tp.cas.client.filter.CASFilter

class CASFilters {

    def filters = {
	loginCheck(controller:'*', action:'*') {
	    before = {
		if(session?.getAttribute("loggedIn") == null) {
		    def username = session?.getAttribute(CASFilter.CAS_FILTER_USER) 
		    if(!User.findByUserId(username)) {
			User u = new User()
			u.setUserId(username)
			u.save(flush: true);
		    }
		    User user = User.findByUserId(username)
		    //user.setLastLogin(new java.sql.Date(System.currentTimeMillis()))
		    session.setAttribute("loggedIn",true)
		    session.setAttribute("loggedInUser",username)
		    session.setAttribute("user",user)
		    log.info("Login: " + username);
		}
	    }
	}
    }
    
}

