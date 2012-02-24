import se.uu.library.User

class BootStrap {

    def init = { servletContext ->
	User u = User.findOrCreateByUserId("jokal322");
	u.password = ""
	u.save()
	u.accountExpired = false
	u.accountLocked = false
	u.enabled = true
	u.passwordExpired = false
	System.out.println(u)
    }
    def destroy = {
    }
}
