package se.uu.library

import se.uu.library.spring.Role

class User implements org.springframework.security.core.userdetails.UserDetails {
    static expose = 'user'
   
    String userId
    Date lastLogin
    String password = ""
    Boolean enabled = true
    Boolean accountExpired = false;
    Boolean accountLocked = false;
    Boolean passwordExpired = false;

    static constraints = {
	userId(blank: false, unique: true)
	lastLogin(nullable:true)
	password(nullable:false)
	enabled(nullable:true)
	accountExpired(nullable:true)
	accountLocked(nullable:true)
	passwordExpired(nullable:true)
    }

    static hasMany = [reviews:Review]
    
    Collection getAuthorities() {
	return [ new Role() ]
    }
    
    boolean isAccountNonExpired() {
	return(!accountExpired)
    }
    
    boolean isAccountNonLocked() {
	return(!accountLocked)
    }
    
    boolean isEnabled() {
	return(enabled)
    }
    
    String getUsername() {
	return(userId)
    }
    
    boolean isCredentialsNonExpired() {
	return(!passwordExpired)
    }

}
