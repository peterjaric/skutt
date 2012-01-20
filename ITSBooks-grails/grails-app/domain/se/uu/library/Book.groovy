package se.uu.library

class Book {
    static expose = 'book'
        
    Date dateCreated
    Date lastUpdated
    User updatedBy
    User checkedOutBy
    Date checkoutDate
    String title
    String isbn
    static hasMany = [reviews:Review]

    static constraints = {
	title(blank:false)
	updatedBy(nullable:true)
	checkedOutBy(nullable:true)
	checkoutDate(nullable:true)
	isbn(unique:true)
    }

}
