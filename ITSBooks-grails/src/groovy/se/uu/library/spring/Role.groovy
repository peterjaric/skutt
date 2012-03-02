package se.uu.library.spring

// This is not a domain class that should be persisted to the database

class Role implements org.springframework.security.core.GrantedAuthority {
    
    String authority
    
    public Role(String authority) {
	this.authority = authority
    }
    
    public Role() {
	this.authority = "ROLE_USER"
    }
	
}

