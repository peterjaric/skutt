import se.uu.library.LoginEventListener
import se.uu.library.DBUserDetailsService

//def config = org.codehaus.groovy.grails.commons.ConfigurationHolder.config

beans = {
    //securityEventListener(LoginEventListener)
    dBUserDetailsService(DBUserDetailsService)
   
    
    cas20TicketValidator(org.jasig.cas.client.validation.Cas20ProxyTicketValidator,"https://cas-akkatest.its.uu.se/castest/")
    
    casServiceProperties(org.springframework.security.cas.ServiceProperties) {
	service = 'http://localhost:8081/ITSBooks/j_spring_cas_security_check'
    }

    
    casAuthenticationProvider(org.springframework.security.cas.authentication.CasAuthenticationProvider) {
	userDetailsService = dBUserDetailsService
	ticketValidator = cas20TicketValidator
	key = "rogntudjuuuu"
	serviceProperties = casServiceProperties

    }
}