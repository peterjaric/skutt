package se.uu.library

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUserDetailsService
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

class DBUserDetailsService implements GrailsUserDetailsService {

    UserDetails loadUserByUsername(String username, boolean loadRoles)
    throws UsernameNotFoundException {
	return loadUserByUsername(username)
    }

    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	def user = User.findByUserId(username)
    	if (!user) {
	    System.out.println("New user: " + username)
	    User.withTransaction {
		status ->
		user = new User(userId:username)
		user.save(flush: true, failOnError:true)
	    }
	}
	
	return user	
    }
}
