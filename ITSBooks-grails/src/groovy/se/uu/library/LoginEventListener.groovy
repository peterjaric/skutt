package se.uu.library

import org.apache.commons.logging.LogFactory
import org.springframework.context.ApplicationListener
import org.springframework.security.authentication.event.AbstractAuthenticationEvent
import org.springframework.security.core.Authentication
import org.springframework.security.web.authentication.logout.LogoutHandler
 
class LoginEventListener implements ApplicationListener<AbstractAuthenticationEvent> {
 
    private static final log = LogFactory.getLog(this)
 
    void onApplicationEvent(AbstractAuthenticationEvent event) {
        event.authentication.with {
            def username = principal.hasProperty('username')?.getProperty(principal) ?: principal
            log.info "event=${event.class.simpleName} username=${username} " +
                "remoteAddress=${details.remoteAddress} sessionId=${details.sessionId}"
        }
    }
}