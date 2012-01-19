/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package se.uu.library


class LogoutController {
        
	def index = {
	    log.info("Logout: " + session.getAttribute("loggedInUser"))
	    session.removeAttribute("loggedIn")
	    session.removeAttribute("loggedInUser")
	    session.removeAttribute("user")
	    flash.message = "Logged out!"
	}
}

