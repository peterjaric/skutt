/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package se.uu.library


class LogoutController {
        
	def index = {
	    session.invalidate()
	    render "Logged out!"
	
	}
}

