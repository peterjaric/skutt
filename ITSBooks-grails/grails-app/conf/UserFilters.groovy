import se.uu.library.*

// This filter makes sure that the User object is available on the session

class UserFilters {
   def filters = {
       loginCheck(controller: '*', action: '*') {
           before = {
              if (request.getRemoteUser() != null && session.getAttribute("user") == null) {
		  User user = User.findByUserId(request.getRemoteUser())
		  log.info("Login: " + user)
		  session.setAttribute("user",user)
              }
           }
       }
   }
}