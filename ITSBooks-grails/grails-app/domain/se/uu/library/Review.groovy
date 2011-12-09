package se.uu.library

class Review {
    
    User user
    Book book
    String text
    int score
    Date dateCreated
    Date lastUpdated
    static belongsTo = User

    static constraints = {
	text(blank:false, widget:"textarea")
	score(min:1, max:5)
	book(unique:'user')
    }

}
