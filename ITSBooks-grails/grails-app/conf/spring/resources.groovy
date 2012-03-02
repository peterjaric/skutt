import se.uu.library.LoginEventListener
import se.uu.library.DBAutoCreatingUserDetailsService
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH


beans = {
    
    dBAutoCreatingUserDetailsService(DBAutoCreatingUserDetailsService)
   
    
    cas20TicketValidator(org.jasig.cas.client.validation.Cas20ProxyTicketValidator,CH.config.grails.plugins.springsecurity.cas.serverUrlPrefix)
    
    casServiceProperties(org.springframework.security.cas.ServiceProperties) {
	service = CH.config.grails.plugins.springsecurity.cas.serviceUrl
    }

    casAuthenticationProvider(org.springframework.security.cas.authentication.CasAuthenticationProvider) {
	userDetailsService = dBAutoCreatingUserDetailsService	
ticketValidator = cas20TicketValidator
	key = "rogntudjuuuu"
	serviceProperties = casServiceProperties
    }
}