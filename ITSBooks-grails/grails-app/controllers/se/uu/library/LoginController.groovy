/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package se.uu.library


class LoginController {
        
	def index = {
		redirect(controller:"book", action:"list")
	}
}

